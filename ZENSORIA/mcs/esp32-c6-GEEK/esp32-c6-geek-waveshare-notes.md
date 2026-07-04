# Waveshare ESP32-C6-GEEK — knowledge-base notes

**Vendor wiki:** [Waveshare ESP32-C6-GEEK](https://docs.waveshare.com/ESP32-C6-GEEK)

---

## Role in this repo (`home-devkit-ai`)

| Item | Location / note |
| --- | --- |
| Vendor / demo bundle | `firmware/ESP32-C6-GEEK/ESP32-C6-GEEK-examples-main/` (see its `README.md`) |
| This device note | `docs/devices/esp32-c6-geek-waveshare-notes.md` |
| I2C sensor bench (BME280 / BH1750 / …) | `docs/howto/esp32-c6-geek-i2c-sensor-bench.md` |

Treat vendor trees under `firmware/` as **reference only** unless the task is compare or vendor-sync (`AGENTS.md`).

---

## Maintained firmware (PlatformIO)

**Project path:** `/Users/simon/Documents/PlatformIO/Projects/ESP32-C6-GEEK`

**Baseline behaviour (current):**

- ST7789 LCD + **LVGL 8** via `espressif/esp_lvgl_port` (same family as vendor ESP-IDF `06_lvgl_example_v9`, different LVGL major in `idf_component.yml`).
- **Three UI screens**: status (Wi-Fi + RSSI), I2C sensor bench, help — switched with the **boot button** (`espressif/button`, GPIO9 like vendor `04_button`).
- **Wi-Fi STA**, **DHCP wait**; RSSI timer runs only while the status screen is visible.
- Wi-Fi init entry point is **`wifi_sta_app_start`** (not `wifi_station_start`) — avoids a **linker clash** with ESP-IDF `libnet80211`.
- **`app_main` must not return** (idle loop at end).
- **Partitions / flash:** large `factory` slot + `board_build.flash_size` — see project `README.md`.

**Files to touch first when extending:**

| File | Purpose |
| --- | --- |
| `src/main.c` | Screens, button map, Wi-Fi / RSSI |
| `src/i2c_sensor_hub.c` | Bench report logic |
| `src/sensor_bench_config.h` | Pins / addresses / which checks run (edit without touching hub C for common tweaks) |
| `src/board_button.c` | GPIO9 `iot_button` wiring |
| `src/wifi_station.c` | STA / reconnect policy |
| `src/wifi_creds.h` | SSID / password (gitignored; template `wifi_creds.h.example`) |
| `partitions.csv` / `platformio.ini` | Flash geometry |

---

## Reference bundle layout (short)

- `Arduino/examples/` — sketches (LCD, Wi-Fi, BLE, SD, MQTT, **I2C BME68x** demo with SDA/SCL defines).
- `ESP-IDF/` — standalone IDF projects (Wi-Fi, LVGL, SD, button).
- Build target in bundle: **`esp32c6`**.

---

## Reserved for later

MCU/radio details, exact connector pin tables, power paths, MQTT/OpenHAB wiring — add when you lock a revision against the schematic.

---

## Alignment with `AGENTS.md`

- **Secrets:** do not commit real Wi-Fi or broker credentials; keep `wifi_creds.h` local or use private storage.
- After meaningful firmware or partition changes, update this note or the linked howtos so the knowledge base stays aligned.
