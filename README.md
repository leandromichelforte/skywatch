![Screenshot 1](https://imageupload.io/ib/68dM1VMBvLOTDID_1698655558.png)
## Overview

This is an app that shows the current weather and the forecast based on user's location. The user can add videos with title and description for another users can see.

## Screenshots
##### Weather Day
![Weather Day](https://imageupload.io/ib/BvqJmK9gTlktijt_1698658072.png)
##### Forecast Night
![Forecast Night](https://imageupload.io/ib/uMSgyUrcDqIC7TS_1698656334.png)
##### Video List Light
![Video List Light](https://imageupload.io/ib/9xJHNZHJb9vsOtD_1698656335.png)
##### Upload Video Dark
![Upload Video Dark](https://imageupload.io/ib/eKXjxVL47EjhwdQ_1698656334.png)

## Features
- Android andiOS UI/UX Design
- See the current weather based on your current location
- See the forecast
- List the videos that the users uploaded
- Upload your video from gallery or camera
###### Bonus:
- When the app starts, it checks the device theme (dark/light) to set the colors of the home, video list and upload video page.
- Through the pages weather and forecast, the app's colors change dynamically according to the data returned. It will be light blue if it's day, and dark blue if is not

## App Structure
- Although the app isn't a big app, I developed with the Clean Architechture to make scalable and maintainable
- S.O.L.I.D principles
- BLoC and Cubit for state management
- Used Mockito to make the test coverage over 90%
![Test Coverage](https://imageupload.io/ib/xT6cd8Q1tffGfk0_1698662823.png)

## Development environment (flutter doctor)
- Flutter (Channel stable, 3.13.1, on macOS 13.3.1 22E772610a darwin-arm64, locale en-BR)
- Android toolchain - develop for Android devices (Android SDK version 33.0.2)
- Xcode - develop for iOS and macOS (Xcode 14.2)
- VS Code (version 1.83.1)

## Getting Started
Follow these instructions to get the app up and running on your local machine.
### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) must be installed on your machine.

### Installation and testing
1. Clone the repository
    ```bash
    git clone https://github.com/leandromichelforte/skywatch.git
    ```
2. Install dependencies
    ```
    cd skywatch/
    flutter pub get
    ```
3. Run it
    ```
    flutter run
    ```
4. Run the tests
    ```
    flutter test --coverage
    ```

## Dependencies
##### APIs
- [WeatherAPI](https://www.weatherapi.com/)
- [API.Video](https://api.video/)
##### Flutter packages
- [BLoC](https://pub.dev/packages/bloc)
- [Flutter BLoC](https://pub.dev/packages/flutter_bloc)
- [BLoC Test](https://pub.dev/packages/bloc_test)
- [GetIt](https://pub.dev/packages/get_it)
- [Permission Handler](https://pub.dev/packages/permission_handler)
- [Path Provider](https://pub.dev/packages/path_provider)
- [Geolocator](https://pub.dev/packages/geolocator)
- [Dio](https://pub.dev/packages/dio)
- [Dartz](https://pub.dev/packages/dartz)
- [Equatable](https://pub.dev/packages/equatable)
- [Meta](https://pub.dev/packages/meta)
- [Shimmer](https://pub.dev/packages/shimmer)
- [Image Picker](https://pub.dev/packages/image_picker)
- [Speed Dial](https://pub.dev/packages/flutter_speed_dial)
- [Video Player](https://pub.dev/packages/video_player)
- [Chewie](https://pub.dev/packages/chewie)
- [Mocktail](https://pub.dev/packages/mocktail)
- [Http Mock Adapter](https://pub.dev/packages/http_mock_adapter)



## Support and Feedback
If you have any questions, need help or feedback, please contact [leandromichel2306@gmail.com](mailto:leandromichel2306@gmail.com)