# 🚚 Logistics Manager (Flutter + Cubit)

A simple logistics management app built with **Flutter**, **Cubit (Bloc)**, and **MVVM-like structure** using **mock data**.

This project demonstrates how to manage **Drivers**, **Vehicles**, and **Trips** with assignment, updates, and trip lifecycle logic — all stored in-memory.

---

## ✨ Features

- **Drivers**
    - List all drivers with details.
    - Track status (`available`, `onTrip`).
    - Automatically linked to vehicles and trips.

- **Vehicles**
    - List all vehicles with details.
    - Track status (`available`, `assigned`).
    - Automatically linked to drivers and trips.

- **Trips**
    - Create new trips and assign a driver + vehicle.
    - Update trip status (`pending`, `inProgress`, `completed`).
    - When a trip is completed:
        - Driver becomes `available` again.
        - Vehicle becomes `available` again.
        - Vehicle’s `currentTrip` is cleared.

- **State Management**
    - Uses `Cubit` + `TripState` to handle loading, success, and error states.
    - Avoids duplicate trips by cloning lists before emitting state.

---

## 🗂 Project Structure

```
lib/
│
├── helper/         # Reusable Functions
│   ├── bottom_nav_handler.dart
│   └── get_statues_color.dart
│
│── Managers/         # State Management (Cubits + States)
│   ├── trip_cubit.dart
│   └── trip_state.dart
│
├── Models/           # Data Models
│   ├── drivers_model.dart
│   ├── vehicles_model.dart
│   ├── mock_data.dart
│   └── trips_model.dart
│
├── utiles/           # setub files (styles, color, images)
│   ├── app_color.dart
│   ├── app_images.dart
│   ├── app_routers.dart
│   └── app_style.dart
│
├── Repos/            # Repository (Mock Data)
│   └── trip_repo.dart
│
├── Screens/          # UI Screens
│   ├── drivers_screen.dart
│   ├── vehicles_screen.dart
│   ├── trips_screen.dart
│   ├── trip_details_screen.dart
│   └── add_trip_screen.dart
│
└── main.dart         # App Entry Point
```

---

## 🚀 How It Works

1. Open the app → lists of drivers, vehicles, and trips load from **mock data**.
2. Add a trip → choose a driver + vehicle.
3. Start/complete trip → statuses update automatically:
    - Driver: `onTrip` → `available`
    - Vehicle: `assigned` → `available`
    - Trip: `pending` → `completed`

---

## 🔮 Future Enhancements

- Persist data using SQLite, Hive, or Firebase.
- Add push notifications for trip updates.

---

## 🏃 Run the App

```bash
flutter pub get
flutter run
```

---

## 👩‍💻 Author

Made with ❤️ in Flutter Bloc to **DRB Company**.
