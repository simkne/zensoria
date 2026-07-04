#pragma once

// Simple struct for device identity that can be shared between
// Arduino/PlatformIO and ESP-IDF projects (with minor adjustments).
//
// You can either:
// - Fill these at compile time using build flags, or
// - Hardcode per-device values in a local config header.

typedef struct {
    const char *device_id;   // e.g. "envsensor01"
    const char *location;    // e.g. "livingroom"
    const char *model;       // e.g. "esp32-env"
    const char *fw_version;  // e.g. "envsensor-1.0.0"
} device_info_t;

