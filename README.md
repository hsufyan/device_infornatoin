# device_information

A lightweight MVP Flutter project that collects essential **device information** from the user's device and sends it to a backend server.  
Useful for onboarding, security validation, analytics, and device-binding flows.

---

## 🚀 Features

- Fetch device details such as:
  - Model
  - Manufacturer
  - OS version
  - Unique device ID
  - Physical device check
- Convert device metadata into JSON
- Send data to REST API (POST request)
- Simple and clean UI
- MVP-ready architecture

---

## 🛠 Tech Stack

- **Flutter** (3.22+)
- **device_info_plus** (for device data)
- **http** (for API calls)

---

## 📦 Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter

  device_info_plus: ^10.1.0
  http: ^1.2.0

📲 Data Collected
📱 Android

Device ID

Model

Manufacturer

Android Version

SDK Level

Physical Device (true/false)

🍏 iOS

Identifier for Vendor

Model

OS Version

Physical Device (true/false)

📁 Project Structure
lib/
 ├── main.dart
 ├── screens/
 │     └── home_screen.dart
 ├── controllers/
 │     └── device_controller.dart
 ├── utils/
 │     └── device_helper.dart
 ├── services/
       └── api_service.dart

🧑‍💻 Developer

Muhammad Sufyan – Flutter Developer
GitHub: https://github.com/hsufyan

LinkedIn: https://linkedin.com/in/muhammad-sufyan-376121200/
