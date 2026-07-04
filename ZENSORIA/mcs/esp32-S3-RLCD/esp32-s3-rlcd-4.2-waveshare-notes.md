# Waveshare ESP32-S3-RLCD-4.2 — collected documentation notes

Notes distilled from **Waveshare’s official documentation** for firmware and power-management planning. Use this as a quick reference; the **authoritative electrical detail** is always the **published schematic PDF** (link below).

**Sources (retrieved 2026-04-24):**

- [Product / overview — ESP32-S3-RLCD-4.2](https://docs.waveshare.com/ESP32-S3-RLCD-4.2)
- [Resources — schematics and mechanical files](https://docs.waveshare.com/ESP32-S3-RLCD-4.2/Resources-And-Documents)

---

## Product summary (from Waveshare)

- ESP32-S3 AIoT dev board with **4.2″ fully reflective RLCD** (Waveshare states resolution **300 × 400** on the doc page; align with your firmware if you use 400×300 — treat as a doc vs code consistency check).
- **Wi-Fi + BLE**, onboard **ES7210** (mic ADC / AEC path), **ES8311** audio codec, **dual microphones**, speaker connector.
- **SHTC3** temp/humidity, **PCF85063** RTC, **TF** slot, **Type-C** (flash / log / power).
- **18650 holder** and **battery charge and discharge management** (wording from Waveshare; specific PMIC model is **not** named on the overview page — see schematic).
- **RTC backup** connector: **PH1.0 rechargeable RTC battery only** (per Waveshare).
- Expansion: **2×8** female header, reserved **USB / UART / I2C / GPIO** (per feature list).

**SKUs (from Waveshare table):**

| SKU   | Variant                                      |
| ----- | -------------------------------------------- |
| 33298 | Board **with** 18650 lithium battery         |
| 33507 | Board **without** 18650 lithium battery      |

**Handling caution (from Waveshare):** do not stress the screen when inserting Type-C or 18650; screen damage from mishandling is not covered by warranty.

---

## Onboard items relevant to power / status (from “Onboard Resources”)

These are **labeled features** on the documentation page — useful for UI or diagnostics, but **LED state is not the same as a software-readable GPIO** unless the schematic routes that signal to the ESP32.

| # | Item | Notes for firmware |
| - | ---- | ------------------ |
| 5 | **PWR button** | Long press **power off**, single click **power on** (user-facing power behavior). |
| 12 | **18650 battery holder** | Main battery path. |
| 14 | **CHG** charging indicator | Waveshare: light behavior tied to charging; **turns off when battery is fully charged**. |
| 15 | **WRN** warning indicator | Waveshare: **stays on if battery is reverse-connected**. |
| 16 | **Type-C** | Programming, log, **power supply**. |

**Implication:** the docs **explicitly** describe **visual** charge/full/reverse-battery indications. For **automatic** “charging vs not” / “USB vs battery” in firmware, you still need either:

1. **Signals from the charger / power path** brought to GPIO (check schematic), or  
2. **Heuristics** (e.g. bus voltage / battery voltage trends) if only a **divided battery voltage** is available on an ADC pin.

---

## Hardware design files (from Resources page)

- **Schematic (PDF):**  
  `https://files.waveshare.com/wiki/ESP32-S3-RLCD-4.2/ESP32-S3-RLCD-4.2-schematic.pdf`  
  Use this to answer: which IC handles charge, whether **VBUS** or **CHG**/**PG**/`STAT` lines reach the ESP32, I2C addresses for any fuel gauge, etc.

- **Structure / 3D (RAR):**  
  `https://files.waveshare.com/wiki/ESP32-S3-RLCD-4.2/ESP32-S3-RLCD-4.2-3dFile.rar`

---

## ESP32-S3 official references (linked from Waveshare Resources)

Waveshare points to Espressif PDFs for the **ESP32-S3** chip (datasheet + TRM). Use those for sleep modes, USB PHY, power domains — not duplicated here.

---

## Link to our firmware project (`ESP32-S3-RLDC_test`)

- Today’s firmware uses **`components/port_bsp/adc_bsp.cpp`**: **ADC1 channel 3**, divider math `vol = 0.001 * tage * 3`, and a **3.0 V … 4.12 V → 0…100 %** mapping in `Adc_GetBatteryLevel()`.
- **Verify every pin and divider ratio against the schematic** above whenever you change boards or revision.

**Vendor demo bundle:** the repo may ship Waveshare **SensorLib**-style code (e.g. fuel-gauge classes) under `components/ExternLib/` — that does **not** by itself prove this SKU populates a given I2C device; only the schematic + a bus scan confirm it.

### Charger IC (from schematic PDF text, not just marketing copy)

The published schematic references **ETA6096 / ETA6098** (ETA switching Li-ion charger family, **STAT** pin, **VIN** from USB path). Net name hints in the PDF include **`NLVBUS`**, **`NLBAT0ADC`**, **`NLGPIO4`** (always re-verify on the PDF before assigning GPIOs).

**Firmware module:** `components/power_mgmt/` reads battery via `adc_bsp` and can use optional **`POWER_MGMT_GPIO_USB_SENSE`** / **`POWER_MGMT_GPIO_CHG_STAT`** in `main/user_config.h` once you map which ESP32 pins (if any) carry VBUS sense or **STAT** (the on-board **CHG LED** alone is not readable by software unless duplicated to a GPIO).

---

## Firmware: battery & power stack (2026-04-24)

Detailed implementation notes (build pitfalls, UI mapping, glyph thresholds, mW limitations) live in:

**`docs/howto/esp32-s3-rldc-battery-power-firmware-2026-04-24.md`**

Summary:

- **Voltage only** on ADC1 CH3 → **percent curve** in `adc_bsp`; **`extern "C"`** in `adc_bsp.h` required because the BSP is compiled as **C++** while **`power_mgmt.c` is C**.
- **`power_mgmt`** centralizes SOC + optional USB/charge GPIOs; **`tools_icons_28` + `tools_icons_map.h`** drive the main-screen battery/Wi-Fi/BLE status row.
- **True power (mW)** needs extra hardware (shunt / INA / gauge), not software on the stock divider.

---

## Suggested next edits (optional)

- After you read the schematic: append a short **“Confirmed on rev X”** subsection (PMIC part number, STAT pins, ADC net names, any GPIO for USB present).
- When you confirm GPIO numbers for VBUS/STAT, add them to `main/user_config.h` and note them here under **Confirmed on rev X**.
