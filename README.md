# lm_flutter

Flutter Application for Lastminute
Developed for Android and iOS

![Image](screenshot/1.png) 
![Image](screenshot/2.png) 
![Image](screenshot/3.png) 
![Image](screenshot/4.png) 
![Image](screenshot/5.png) 

## Getting Started

This project is a starting point for a Flutter application.

Before you can build this project, you must install Flutter and configure your editor:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Android Studio] or [VisualStudio Code](https://flutter.dev/docs/get-started/editor)

For help getting started with Flutter, view online [documentation](https://flutter.dev/docs/get-started/install).

## Install PUBs

The most important plugins used in this project are : 

| Plugin  |  Pub | Used|
|---|---|---|
| [connectivity](https://pub.dartlang.org/packages/connectivity)|[![pub package](https://img.shields.io/pub/v/connectivity.svg)](https://pub.dartlang.org/packages/connectivity)|![pub package](https://img.shields.io/badge/pub-v0.4.2-green.svg)|
| [device_info](https://pub.dartlang.org/packages/device_info)|[![pub package](https://img.shields.io/pub/v/device_info.svg)](https://pub.dartlang.org/packages/device_info)|![pub package](https://img.shields.io/badge/pub-v'0.4.0+1'-green.svg)|
| [package_info](https://pub.dartlang.org/packages/package_info)|[![pub package](https://img.shields.io/pub/v/package_info.svg)](https://pub.dartlang.org/packages/package_info)|![pub package](https://img.shields.io/badge/pub-v0.4.0+2-green.svg)|
| [dio](https://pub.dartlang.org/packages/dio)|[![pub package](https://img.shields.io/pub/v/dio.svg)](https://pub.dartlang.org/packages/dio)|![pub package](https://img.shields.io/badge/pub-v2.1.0-green.svg)|
| [json_annotation](https://pub.dartlang.org/packages/json_annotation)|[![pub package](https://img.shields.io/pub/v/json_annotation.svg)](https://pub.dartlang.org/packages/json_annotation)|![pub package](https://img.shields.io/badge/pub-v2.0.0-green.svg)|
| [cached_network_image](https://pub.dev/packages/cached_network_image)|[![pub package](https://img.shields.io/pub/v/cached_network_image.svg)](https://pub.dartlang.org/packages/cached_network_image)|![pub package](https://img.shields.io/badge/pub-v0.8.0-green.svg)|
| [carousel_slider](https://pub.dev/packages/carousel_slider)|[![pub package](https://img.shields.io/pub/v/carousel_slider.svg)](https://pub.dartlang.org/packages/carousel_slider)|![pub package](https://img.shields.io/badge/pub-v1.3.0-green.svg)|
| [json_serializable](https://pub.dartlang.org/packages/json_serializable)|[![pub package](https://img.shields.io/pub/v/json_serializable.svg)](https://pub.dartlang.org/packages/json_serializable)|![pub package](https://img.shields.io/badge/pub-v2.0.3-green.svg)|

These plugins dependencies are defined inside the pubspec.yaml file, You can install these and others 
 - From the terminal: `Run flutter packages get`
 - From Android Studio/IntelliJ: Click ‘Packages Get’ in the action ribbon at the top of pubspec.yaml
 - From VS Code: Click ‘Get Packages’ located in right side of the action ribbon at the top of pubspec.yaml


## Run

You can run the main.dart file

- from the terminal `flutter run -t lib/main.dart`
- from IntelliJ click on the run button

## Brief Project Explaination

Starting form your specs I developed this small application.

The Project is sctuctured in this way : 
```bash
├── lib
    │
    ├── fragments        
    │   │
    │   ├── hotels 
    │   │    │
    │   │    ├── hotel_detail.dart                # detailed page for a selected Hotel
    │   │    │
    │   │    ├── hotel_ui_widget.dart             # ui definition for most component used in hotel_detail and hotels_fragment
    │   │    │  
    │   │    └── hotels_fragment.dart             # the fragment that contains the list of hotels sortable by user rating and by the numer of stars 
    │   │
    │   └── home_fragmet.dart                     # the main page that contains the menu drawer
    │
    ├── model                                     # classes definitions (Hotel, Location, Contact..)
    │
    ├── pages                                     # empty_page and splash_page
    │
    ├── rest              
    │   │
    │   └── hotel_rest_service.dart           
    │
    ├── ui                                        # usefull global definition 
    │
    ├── utils                                     # global usefull  
    │  
    └── main.dart
```

        

## TESTED ON :
- iOS Emulator : iphone 8
- Android Emulator : Nexus 5X with Android 9
- Real Device : Nexus 5X with Android 8.1
- Real Device : Redmi 4X with Android 7.1.2