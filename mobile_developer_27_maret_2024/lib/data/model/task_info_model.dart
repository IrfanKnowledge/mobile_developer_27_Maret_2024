
import 'package:flutter_downloader/flutter_downloader.dart';

class TaskInfoModel {
  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;

  TaskInfoModel(this.taskId);
}