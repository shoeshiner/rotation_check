import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:rotation_check/rotation_check.dart';
import 'package:rotation_check/rotation_check_method_channel.dart';
import 'package:rotation_check/rotation_check_platform_interface.dart';

class MockRotationCheckPlatform with MockPlatformInterfaceMixin implements RotationCheckPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> isRotationLocked() => Future.value(true);
}

void main() {
  final RotationCheckPlatform initialPlatform = RotationCheckPlatform.instance;

  test('$MethodChannelRotationCheck is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRotationCheck>());
  });

  test('getPlatformVersion', () async {
    RotationCheck rotationCheckPlugin = RotationCheck();
    MockRotationCheckPlatform fakePlatform = MockRotationCheckPlatform();
    RotationCheckPlatform.instance = fakePlatform;

    expect(await rotationCheckPlugin.getPlatformVersion(), '42');
  });

  test('isRotationLocked', () async {
    RotationCheck rotationCheckPlugin = RotationCheck();
    MockRotationCheckPlatform fakePlatform = MockRotationCheckPlatform();
    RotationCheckPlatform.instance = fakePlatform;

    expect(await rotationCheckPlugin.isRotationLocked(), true);
  });
}
