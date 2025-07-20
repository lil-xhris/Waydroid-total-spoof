# Waydroid Total Spoof

## Overview

This repository contains a script to spoof and modify your **Waydroid** environment for Android applications on Linux (specifically using **Waydroid**). The tool allows you to change various system properties to make the system appear as a different device, including device model, Android ID, and various identifiers. This is helpful for those looking to hide their environment for testing, bypassing device checks, or ensuring that their devices aren't detected as emulators (like in gaming applications).

---

## Features

- **Device Spoofing**: Change the device model, manufacturer, and brand.
- **Custom Fingerprints**: Spoof Android's build fingerprint for more authenticity.
- **GPU Passthrough**: Setup GPU passthrough for Waydroid, improving graphics performance.
- **Android ID**: Generate a unique (and random) Android ID, ensuring apps think you are using a real device.
- **GSF ID**: Randomize GSF (Google Services Framework) ID for additional spoofing.
- **System Cleanup**: Removes traces of Waydroid to make the system appear clean and native.

---

## Use Cases

### 1. **Gaming (e.g., Free Fire)**

Many mobile games, including **Free Fire**, actively try to detect emulators to prevent unfair advantages. By spoofing your Waydroid device to look like a legitimate phone (e.g., Pixel, Samsung, or other real models), you can hide the fact that you are using an emulator and avoid detection. This gives you a more legit gameplay experience and avoids potential bans due to being flagged as an emulator. or getting ur acc banned

### 2. **Testing Android Applications**

For developers and testers, this tool can simulate different devices, allowing you to test your apps in multiple environments without requiring real physical devices. This can speed up testing cycles and provide a broader test coverage.

### 3. **Privacy & Security**

For privacy enthusiasts, spoofing allows you to avoid tracking tied to your actual device, such as your Android ID or other personal identifiers. It can also help you avoid app-based tracking systems.

---

## How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/lil-xhris/Waydroid-total-spoof.git
   cd Waydroid-total-spoof
   chmod +x waydroid.sh
   ./V2.0.sh
