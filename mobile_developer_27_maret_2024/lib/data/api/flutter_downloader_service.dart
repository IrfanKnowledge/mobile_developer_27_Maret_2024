
import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class FlutterDownloaderService {
  Future<String> getFile() async {
    bool isAndroid = Platform.isAndroid;
    bool isIos = Platform.isIOS;

    Directory? dir;

    if (isAndroid) {
      dir = await getExternalStorageDirectory();
    } else if (isIos) {
      dir = await getDownloadsDirectory();
    }

    final taskId = await FlutterDownloader.enqueue(
      url: 'https://images.pexels.com/photos/1092644/pexels-photo-1092644.jpeg',
      savedDir: dir?.path ?? '',
      showNotification: false,
      openFileFromNotification: false,
    );

    if (taskId != null) {
      return taskId;
    } else {
      throw 'flutter_downloader_servie.dart, FlutterDownloaderService, getFile(): fail/error';
    }
  }
}