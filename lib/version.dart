import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'api/webdav.dart';
import 'config.dart';
import 'logger.dart';

String getFileSha256(String path) {
  return sha256.convert(File(path).readAsBytesSync()).toString();
}

Future updateAndroidApp() async {
  final appDir = await getApplicationDocumentsDirectory();

  await downloadFormWebDav(
      androidApkNewerVersion, path.join(appDir.path, androidApkNewerVersion));

  final olderVersionFile =
      File(path.join(appDir.path, androidApkCurrentVersion));
  final newerVersionFile = File(path.join(appDir.path, androidApkNewerVersion));

  String newerVersion = newerVersionFile.readAsStringSync();

  String olderVersion = '';
  if (olderVersionFile.existsSync()) {
    olderVersion = olderVersionFile.readAsStringSync();
  }

  newerVersionFile.deleteSync();

  // 比对版本是否一致
  if (newerVersion != olderVersion) {
    logger.d('版本不一致，自动下载新版本');

    var apkDownloadPath = path.join(appDir.path, androidApkPath);
    await downloadFormWebDav(androidApkPath, apkDownloadPath);
    olderVersionFile.writeAsStringSync(newerVersion);

    logger.d('新版本下载完成，启动安装程序');
    OpenFilex.open(apkDownloadPath);
  }
}
