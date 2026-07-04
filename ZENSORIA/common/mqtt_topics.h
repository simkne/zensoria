#pragma once

// Base topic prefix for all home devices.
// You can adjust this if needed (e.g. "myhome" instead of "home").
#define MQTT_BASE_TOPIC "home"

// Helper macros to build topics; in code you will typically build topics
// using snprintf into a buffer.
//
// Example:
//   snprintf(topic, sizeof(topic), MQTT_BASE_TOPIC "/%s/%s/temperature", location, device);

// Standard channel names (do not change lightly; OpenHAB configs depend on them).
#define MQTT_CH_TEMPERATURE "temperature"
#define MQTT_CH_HUMIDITY    "humidity"
#define MQTT_CH_PRESSURE    "pressure"
#define MQTT_CH_ILLUMINANCE "illuminance"
#define MQTT_CH_MOTION      "motion"
#define MQTT_CH_CONTACT     "contact"
#define MQTT_CH_STATE       "state"
#define MQTT_CH_CMD         "cmd"
#define MQTT_CH_BATTERY     "battery"
#define MQTT_CH_RSSI        "rssi"
#define MQTT_CH_POWER       "power"
#define MQTT_CH_ENERGY      "energy"
#define MQTT_CH_INFO        "info"

