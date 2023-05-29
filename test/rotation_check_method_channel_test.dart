import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rotation_check/rotation_check_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelRotationCheck platform = MethodChannelRotationCheck();
  const MethodChannel channel = MethodChannel('rotation_check');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'getPlatformVersion':
            return '42';
          case 'isRotationLocked':
            return true;
        }

        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('isRotationLocked', () async {
    expect(await platform.isRotationLocked(), true);
  });
}
