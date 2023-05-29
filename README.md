# rotation_check

Simple utility package to check whether auto-rotate or portrait orientation lock is turned on/off across
Android and iOS.

## Usage

To use this plugin, add `rotation_check` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

``` dart
import 'package:rotation_check/rotation_check.dart';

// Check if auto-rotate is enabled
RotationCheck rotationCheck = RotationCheck();
bool isRotationEnabled = await rotationCheck.isRotationEnabled();
```

NOTE: This plugin currently works on Android and has a no-op implementation on iOS. Due to the nature
of iOS, it is not possible to check whether the orientation lock is enabled or not through any public
facing APIs that Apple provides. I've been researching ways to utilize gyroscope and accelerometer sensor
data to obtain auto-rotate.

## Issues and feedback

// TODO: Add issues link
