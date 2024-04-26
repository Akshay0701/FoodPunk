//
// Generated file. Do not edit.
// This file is generated from template in file `flutter_tools/lib/src/flutter_plugins.dart`.
//

// @dart = 2.12

import 'dart:io'; // flutter_ignore: dart_io_import.
import 'package:flutter_inappwebview_android/flutter_inappwebview_android.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_inappwebview_ios/flutter_inappwebview_ios.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_inappwebview_macos/flutter_inappwebview_macos.dart';
import 'package:sqflite/sqflite.dart';

@pragma('vm:entry-point')
class _PluginRegistrant {

  @pragma('vm:entry-point')
  static void register() {
    if (Platform.isAndroid) {
      try {
        AndroidInAppWebViewPlatform.registerWith();
      } catch (err) {
        print(
          '`flutter_inappwebview_android` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        SqflitePlugin.registerWith();
      } catch (err) {
        print(
          '`sqflite` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isIOS) {
      try {
        IOSInAppWebViewPlatform.registerWith();
      } catch (err) {
        print(
          '`flutter_inappwebview_ios` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        SqflitePlugin.registerWith();
      } catch (err) {
        print(
          '`sqflite` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isLinux) {
    } else if (Platform.isMacOS) {
      try {
        MacOSInAppWebViewPlatform.registerWith();
      } catch (err) {
        print(
          '`flutter_inappwebview_macos` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        SqflitePlugin.registerWith();
      } catch (err) {
        print(
          '`sqflite` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isWindows) {
    }
  }
}
