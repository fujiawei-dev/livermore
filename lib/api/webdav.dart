import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:webdav_client/webdav_client.dart' as webdav;

import '../config.dart';

Future downloadFormWebDav(String file, String dst) async {
  var client = webdav.newClient(
    webDavHost,
    user: webDavUser,
    password: webDavPassword,
    debug: false,
  );

  Directory dstDirectory = Directory(path.dirname(dst));

  if (!dstDirectory.existsSync()) {
    dstDirectory.createSync(recursive: true);
  }

  await client.read2File('$webDavApp/$file', dst);
}

Future uploadToWebDav(String file) async {
  var client = webdav.newClient(
    webDavHost,
    user: webDavUser,
    password: webDavPassword,
    debug: false,
  );

  await client.writeFromFile(file, '$webDavApp/${path.basename(file)}');
}
