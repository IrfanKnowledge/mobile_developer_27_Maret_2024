import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_developer_27_maret_2024/data/api/flutter_downloader_service.dart';
import 'package:mobile_developer_27_maret_2024/data/model/task_info_model.dart';
import 'package:mobile_developer_27_maret_2024/utils/loading_state.dart';
import 'package:path/path.dart' as p;

class PlayListDownloadProvider extends ChangeNotifier {
  final FlutterDownloaderService _flutterDownloaderService;

  PlayListDownloadProvider(
      {required FlutterDownloaderService flutterDownloaderService})
      : _flutterDownloaderService = flutterDownloaderService;

  final Map<String, TaskInfoModel> _mapTaskInfoModelById = {};
  final Map<String, TaskInfoModel> _mapTaskInfoModelByUrl = {};

  LoadingState<String> _stateTaskInfoModel = const LoadingState.initial();

  LoadingState<String> get stateTaskInfoModel => _stateTaskInfoModel;

  LoadingState<Map<String, bool>> _stateIsDownloadedFilesExist =
      const LoadingState.initial();

  LoadingState<Map<String, bool>> get stateIsDownloadedFilesExist =>
      _stateIsDownloadedFilesExist;

  void download(String url) async {
    try {
      _stateTaskInfoModel = const LoadingState.loading();
      notifyListeners();

      final taskId = await _flutterDownloaderService.getFile(url);
      _stateTaskInfoModel = LoadingState.loaded(taskId);
      final taskInfoModel = TaskInfoModel(taskId, url);
      _addTaskInfoModel(
        taskId: taskId,
        url: url,
        taskInfoModel: taskInfoModel,
      );
      notifyListeners();
    } on SocketException catch (e) {
      _stateTaskInfoModel = LoadingState.error(e.toString());
      notifyListeners();
    } catch (e, stacktrace) {
      _stateTaskInfoModel = LoadingState.error(e.toString());
      print(
          'playlist_download_provider, PlayListDownloadProvider, download(), error: ${e.toString()}, stacktrace: $stacktrace');
      notifyListeners();
    }
  }

  void _addTaskInfoModel({
    required String taskId,
    required String url,
    required TaskInfoModel taskInfoModel,
  }) {
    _mapTaskInfoModelByUrl.addAll({
      url: taskInfoModel,
    });
    _mapTaskInfoModelById.addAll({
      taskId: taskInfoModel,
    });
  }

  int getListItemLength() => _mapTaskInfoModelById.length;

  TaskInfoModel getCopyTaskInfoModel(String url) {
    final taskInfoModel = _mapTaskInfoModelByUrl[url];

    return TaskInfoModel.complete(
      taskId: taskInfoModel?.taskId,
      progress: taskInfoModel?.progress,
      status: taskInfoModel?.status,
      url: taskInfoModel?.url,
    );
  }

  void updateTaskInfo(TaskInfoModel taskInfoModel) {
    _mapTaskInfoModelById[taskInfoModel.taskId]
      ?..status = taskInfoModel.status
      ..progress = taskInfoModel.progress;
    notifyListeners();
  }

  void deleteItem(TaskInfoModel taskInfoModel) {
    final url = _mapTaskInfoModelById[taskInfoModel.taskId]?.url;
    _mapTaskInfoModelById.remove(taskInfoModel.taskId);
    _mapTaskInfoModelByUrl.remove(url);
    notifyListeners();
  }

  void isDownloadedFilesExist(List<String> listUrl) async {
    try {
      _stateIsDownloadedFilesExist = const LoadingState.loading();
      notifyListeners();

      final path = await _flutterDownloaderService.getDirPath();

      final Map<String, bool> mapIsDownloadedFilesExist = {};

      for (var url in listUrl) {
        final fileName = _flutterDownloaderService.getFileName(url);
        final isFileExist = await File(p.join(path, fileName)).exists();

        mapIsDownloadedFilesExist.addAll({
          url: isFileExist,
        });
      }

      _stateIsDownloadedFilesExist =
          LoadingState.loaded(mapIsDownloadedFilesExist);
      notifyListeners();
    } catch (e, stacktrace) {
      _stateIsDownloadedFilesExist = LoadingState.error(e.toString());
      print(
          'playlist_download_provider, PlayListDownloadProvider, isDownloadedFilesExist(), error: ${e.toString()}, stacktrace: $stacktrace');
      notifyListeners();
    }
  }
}
