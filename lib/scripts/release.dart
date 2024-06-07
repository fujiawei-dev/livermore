import 'dart:io';


import '../api/webdav.dart';
import '../version.dart';

const String releaseApk = 'build/app/outputs/flutter-apk/app-release.apk';
const String releaseVersion = 'version.txt';

void release() {
  File(releaseVersion).writeAsStringSync(getFileSha256(releaseApk));

  uploadToWebDav(releaseApk);
  uploadToWebDav(releaseVersion);
}
