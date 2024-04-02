import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class FlutterDownloaderService {
  Future<String> getFile(String url) async {
    try {
      final String path = await getDirPath();

      final fileName = getFileName(url);

      final taskId = await FlutterDownloader.enqueue(
        // url: 'https://images.pexels.com/photos/1092644/pexels-photo-1092644.jpeg',
        url: url,
        savedDir: path,
        fileName: fileName,
        showNotification: false,
        openFileFromNotification: false,
      );

      if (taskId != null) {
        return taskId;
      } else {
        throw 'flutter_downloader_servie.dart, FlutterDownloaderService, getFile(): fail/error';
      }
    } catch (e, stacktrace) {
      print(
          'flutter_downloader_servie.dart, FlutterDownloaderService, getFile(), error: ${e.toString()}, stacktrace: $stacktrace)');
      throw e.toString();
    }
  }

  Future<String> getDirPath() async {
    bool isAndroid = Platform.isAndroid;
    bool isIos = Platform.isIOS;

    Directory? dir;

    if (isAndroid) {
      dir = await getExternalStorageDirectory();
    } else if (isIos) {
      dir = await getDownloadsDirectory();
    }

    if (dir != null) {
      return dir.path;
    } else {
      throw 'flutter_downloader_servie.dart, FlutterDownloaderService, getDirPath(): fail/error';
    }
  }

  String getFileName(String url) {
    return Uri.parse(url).pathSegments.last;
  }
}
