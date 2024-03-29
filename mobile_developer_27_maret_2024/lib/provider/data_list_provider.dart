import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_developer_27_maret_2024/data/api/api_service.dart';
import 'package:mobile_developer_27_maret_2024/data/model/data_list_model.dart';
import 'package:mobile_developer_27_maret_2024/utils/loading_state.dart';

class DataListProvider extends ChangeNotifier {
  final ApiService _apiService;

  DataListProvider({required ApiService apiService}) : _apiService = apiService {
    fetchDataList();
  }

  LoadingState<DataListModel> _state = const LoadingState.initial();

  LoadingState<DataListModel> get state => _state;

  void fetchDataList() async {
    try {
      _state = const LoadingState.loading();
      notifyListeners();

      final result = await _apiService.getDataListModel();

      _state = LoadingState.loaded(result);
      notifyListeners();

    } on SocketException catch (e) {
      _state = LoadingState.error(e.toString());
      print('data_list_provider.dart, DataListProvider, fetchDataList(), e: ${e.toString()}');
      notifyListeners();

    } catch (e, stacktrace) {
      _state = LoadingState.error(e.toString());
      print('data_list_provider.dart, DataListProvider, fetchDataList(), e: ${e.toString()}, stacktrace: $stacktrace');
      notifyListeners();
    }
  }
}
