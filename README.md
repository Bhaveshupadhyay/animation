# Flutter Clean Architecture - Blinkit Wallet

Screen Recordings: https://drive.google.com/drive/folders/1zEpZHPtvE-TjD9vAmNlpxDuKQni6gL7j?usp=sharing

## Available in Light/Dark mode

<img width="1080" height="1920" alt="Screenshot_1780003514" src="https://github.com/user-attachments/assets/3eeb7382-3333-4451-aa02-e1ac12236a03" />
<img width="1080" height="1920" alt="light_theme" src="https://github.com/user-attachments/assets/9ffbfff5-7869-4d4b-9fba-7d214504286f" />


## Folder Structure
```bash
lib/
├── core/
│   ├── common/
│   │   ├── widgets/
│   ├── error/
│   ├── theme/
│   └── utils/
├── features/
│   ├── feature/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── cubit/
│   │       ├── screens/
│   │       └── widgets/
└── main.dart
``` 

## Setup Instructions
1. Clone the repo:
```bash 
git clone https://github.com/Bhaveshupadhyay/animation.git
cd flutter animation
```
2. Install dependencies:
```bash 
flutter pub get
```
3. Run the app:
```bash 
flutter run
```

## Features
* **Light & Dark Mode:** Fully responsive theme switching between light and dark environments.
* **Responsive UI:** Seamlessly scales across different screen sizes using `flutter_screenutil`.
* **Custom Typography:** Implemented the custom Okra font to perfectly match the original Blinkit app design.
* **Optimized Assets:** Utilized .webp image formats exclusively for faster rendering, lower memory usage, and reduced app size
* **Consistent Design System:** Centralized all padding and margin values into a dedicated `AppSpacing` configuration file for scalable layout management.
* **Modern Navigation:** Declarative routing using `go_router`.

## Tech Stack & Libraries

This project uses a carefully selected set of libraries to maintain a scalable architecture and a beautiful user interface.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version `3.x.x`)
* [Dart SDK](https://dart.dev/get-dart)


