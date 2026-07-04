## MQTT Conventions

This file defines the standard topic and payload schemas for all ESP32-based devices in your home setup.

### Topic schema

Base pattern:

- `home/<location>/<device>/<channel>`

Where:

- `location`: physical or logical location, e.g. `livingroom`, `bedroom`, `kitchen`, `office`.
- `device`: short device identifier, e.g. `envsensor`, `multisensor`, `switch1`, `plug01`.
- `channel`: specific sensor, state, or command, e.g. `temperature`, `humidity`, `state`, `cmd`, `power`, `battery`.

Examples:

- `home/livingroom/envsensor/temperature`
- `home/livingroom/envsensor/humidity`
- `home/bedroom/multisensor/motion`
- `home/office/plug01/state`
- `home/office/plug01/cmd`

#### Reserved channels

Use the following standard channel names:

- `temperature` – °C as a float.
- `humidity` – %RH as a float or integer.
- `pressure` – hPa as a float.
- `illuminance` – lux as a float.
- `motion` – `0` or `1` (no motion / motion detected).
- `contact` – `0` or `1` (closed / open).
- `state` – device or actuator state; for plugs, use `ON` / `OFF`.
- `cmd` – commands for actuators; for plugs, accept `ON` / `OFF` (and optionally `TOGGLE`).
- `battery` – battery level percentage as integer `0–100`.
- `rssi` – WiFi RSSI in dBm as integer.

### Payload schema

For most **sensor readings**, prefer **simple payloads** (single value):

- Numeric sensors: raw number as text, e.g. `23.5`, `55`, `1013.2`.
- Binary sensors: `0` / `1`.
- ON/OFF: `ON` / `OFF`.

For **complex or multi-value messages**, use **JSON** with a version field:

```json
{
  "v": 1,
  "ts": 1710000000,
  "values": {
    "temperature": 23.4,
    "humidity": 55.1
  },
  "meta": {
    "fw": "envsensor-1.0.0"
  }
}
```

Guidelines:

- Always include `"v"` (schema version) if you use JSON.
- Use `"ts"` as a UNIX timestamp (seconds) or ISO 8601 string for time.
- Group sensor values in `"values"`.
- Optional `"meta"` for firmware version, battery, rssi, etc.

### Device info topics

For each device, expose a basic info topic:

- `home/<location>/<device>/info`

Payload (JSON):

```json
{
  "v": 1,
  "device_id": "envsensor01",
  "location": "livingroom",
  "model": "esp32-env",
  "fw": "envsensor-1.0.0"
}
```

### Suggested topic mapping per device type

#### Environmental sensor node

Topics published:

- `home/<location>/<device>/temperature` – °C (float).
- `home/<location>/<device>/humidity` – %RH (float).
- `home/<location>/<device>/pressure` – hPa (float), optional.
- `home/<location>/<device>/illuminance` – lux (float), optional.
- `home/<location>/<device>/battery` – % (int), optional.
- `home/<location>/<device>/rssi` – dBm (int), optional.
- `home/<location>/<device>/info` – JSON device info.

#### Motion/contact sensor node

Topics published:

- `home/<location>/<device>/motion` – `0` or `1`.
- `home/<location>/<device>/contact` – `0` or `1`, if applicable.
- `home/<location>/<device>/battery` – % (int), optional.
- `home/<location>/<device>/info` – JSON device info.

#### Smart plug or relay node

Topics:

- `home/<location>/<device>/state` – `ON` / `OFF`.
- `home/<location>/<device>/cmd` – `ON` / `OFF` / `TOGGLE`.
- `home/<location>/<device>/power` – W (float), optional.
- `home/<location>/<device>/energy` – kWh (float), optional.
- `home/<location>/<device>/info` – JSON device info.

### OpenHAB mapping hints

- Bind **channels** to the above topics using the MQTT binding.
- For simple numeric topics, use `Number` or `Switch` items.
- For JSON payloads, use JSONPATH or JS transforms to extract fields into items.

