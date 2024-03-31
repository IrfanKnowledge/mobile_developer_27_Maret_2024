import 'dart:io';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:mobile_developer_27_maret_2024/data/api/flutter_downloader_service.dart';
import 'package:mobile_developer_27_maret_2024/data/model/task_info_model.dart';
import 'package:mobile_developer_27_maret_2024/utils/result_state.dart';

class PlayListDownloadProvider extends ChangeNotifier {
  final FlutterDownloaderService _flutterDownloaderService;

  PlayListDownloadProvider(
      {required FlutterDownloaderService flutterDownloaderService})
      : _flutterDownloaderService = flutterDownloaderService;

  final List<TaskInfoModel> _listTaskInfoModel = [];
  String _message = '';
  ResultState _state = ResultState.initialize;

  String get message => _message;

  ResultState get state => _state;

  void download() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final taskId = await _flutterDownloaderService.getFile();
      _state = ResultState.success;
      final taskInfoModel = TaskInfoModel(taskId);
      _listTaskInfoModel.add(taskInfoModel);
      notifyListeners();
    } on SocketException catch (e) {
      _message = e.toString();
      _state = ResultState.error;
      notifyListeners();
    } catch (e, stacktrace) {
      _message = e.toString();
      _state = ResultState.error;
      print(
          'playlist_download_provider, PlayListDownloadProvider, download(), stacktrace: $stacktrace');
      notifyListeners();
    }
  }

  void setItem(TaskInfoModel taskInfoModel) {
    final task = _listTaskInfoModel
        .firstWhere((task) => task.taskId == taskInfoModel.taskId);
    task
      ..status = taskInfoModel.status
      ..progress = taskInfoModel.progress;
    notifyListeners();
  }

  void deleteItem(TaskInfoModel taskInfoModel) {
    _listTaskInfoModel.remove(taskInfoModel);
    notifyListeners();
  }
}
