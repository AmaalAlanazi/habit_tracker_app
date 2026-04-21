# Habit Tracker App 🚀

**A modern, robust solution for building and maintaining positive habits.**

This application is built with a focus on high performance, clean code, and a seamless user experience. It allows users to create, manage, and track their daily routines while providing deep insights into their progress through advanced statistics.

## 🌟 Key Features

  * **Daily Habit Management:** Effortlessly create, edit, and categorize your habits.
  * **Real-time Progress Tracking:** Check off habits as you complete them with instant database synchronization.
  * **Dynamic Timeline Calendar:** Navigate through different dates to view past performance or plan future routines.
  * **Advanced Analytics:**
      * **Today's Score:** Visual representation of daily goal completion.
      * **Weekly Insights:** Heatmaps and completion logs for the current week.
      * **Overall Statistics:** Long-term streaks and success rate calculations.
  * **Category-based Organization:** Group habits by life domains (Health, Work, Personal, etc.) with custom color coding.

## 🛠️ Tech Stack & Architecture

This project is built using **Clean Architecture** (Data, Domain, Presentation) to ensure scalability and maintainability.

  * **Framework:** [Flutter](https://flutter.dev) (Dart)
  * **State Management:** [BLoC / Cubit](https://pub.dev/packages/flutter_bloc)
  * **Backend & Database:** [Supabase](https://supabase.com) (PostgreSQL)
  * **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
  * **Reactive Logic:** [Flutter Hooks](https://pub.dev/packages/flutter_hooks)
  * **Code Generation:** [Freezed](https://pub.dev/packages/freezed) & [Build Runner](https://pub.dev/packages/build_runner)

## 📸 Screenshots

| Home Dashboard | Statistics View | Category Management |
| :---: | :---: | :---: |
| <img width="350" height="800" src="https://github.com/user-attachments/assets/f9cbe1ca-eac4-4e5b-ad94-3f71cecb18ff" /> | <img width="350" height="800" src="https://github.com/user-attachments/assets/d4ac1e56-d711-4402-bb56-bbadd2e8f6af" />
| <img width="350" height="800" src="https://github.com/user-attachments/assets/cbc5103c-c4a5-44df-ab2a-d5cd90adf142" />|

# 🎥 Demo Video


https://github.com/user-attachments/assets/2e39e288-6944-4ccf-964b-559ed0246d75



## 🚀 Getting Started

### Prerequisites

  * Flutter SDK (Stable channel)
  * A Supabase project (URL and Anon Key)


## 📂 Project Structure

```text
lib/
├── core/                 # Shared logic: constants, themes, network, and DI (GetIt)
└── features/             # Modular feature-based architecture
    ├── auth/             # Authentication module (Login, SignUp, ForgotPassword)
    │   ├── data/         # Repositories & Supabase Data Sources
    │   ├── domain/       # Entities & Business Logic (Use Cases)
    │   └── presentation/ # BLoC/Cubit & UI Screens
    │
    ├── home/             # Main Dashboard & Daily Timeline
    │   ├── data/         # Habit Models & Remote Data Sources
    │   ├── domain/       # Habit Entities & Fetching Logic
    │   └── presentation/ # Home Widgets & Timeline Logic
    │
    ├── statistics/       # Data visualization and progress charts
    │   ├── data/
    │   ├── domain/
    │   └── presentation/ # StatisticsScreen & Analytic Widgets
    │
    ├── profile/          # User management (Edit Profile, Change Password)
    │   ├── data/
    │   └── presentation/ # Profile UI & Settings
    │
    └── habit_details/    # Focused view for individual habit tracking
        └── presentation/ # Detail screens & habit-specific actions
```

## 🤝 Contributing

Contributions are welcome\! If you'd like to improve the UI or add a new feature, feel free to fork the repo and create a pull request.

-----

**Developed with ❤️ by Layan Alsubaie & Amaal Alanazi**
