import 'rotation_check_platform_interface.dart';

class RotationCheck {
  Future<String?> getPlatformVersion() {
    return RotationCheckPlatform.instance.getPlatformVersion();
  }

  /// Returns true if the rotation is locked, false otherwise.
  Future<bool?> isRotationLocked() {
    return RotationCheckPlatform.instance.isRotationLocked();
  }
}
