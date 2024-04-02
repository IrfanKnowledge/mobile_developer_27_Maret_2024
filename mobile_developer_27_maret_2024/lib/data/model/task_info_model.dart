import 'package:flutter_downloader/flutter_downloader.dart';

class TaskInfoModel {
  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;
  String? url;

  TaskInfoModel(this.taskId, this.url);

  TaskInfoModel.complete({
    required this.taskId,
    required this.progress,
    required this.status,
    required this.url,
  });
}
