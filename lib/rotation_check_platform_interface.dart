import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'rotation_check_method_channel.dart';

abstract class RotationCheckPlatform extends PlatformInterface {
  /// Constructs a RotationCheckPlatform.
  RotationCheckPlatform() : super(token: _token);

  static final Object _token = Object();

  static RotationCheckPlatform _instance = MethodChannelRotationCheck();

  /// The default instance of [RotationCheckPlatform] to use.
  ///
  /// Defaults to [MethodChannelRotationCheck].
  static RotationCheckPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RotationCheckPlatform] when
  /// they register themselves.
  static set instance(RotationCheckPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();

  Future<bool?> isRotationLocked();
}
