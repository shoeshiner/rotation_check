import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'rotation_check_platform_interface.dart';

/// An implementation of [RotationCheckPlatform] that uses method channels.
class MethodChannelRotationCheck extends RotationCheckPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('rotation_check');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> isRotationLocked() async {
    final version = await methodChannel.invokeMethod<bool>('isRotationLocked');
    return version;
  }
}
