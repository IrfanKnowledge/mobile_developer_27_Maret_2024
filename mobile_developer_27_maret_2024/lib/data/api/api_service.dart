import 'package:http/http.dart' as http;
import 'package:mobile_developer_27_maret_2024/data/model/data_list_model.dart';

class ApiService {
  static const String baseUrl = 'http://103.183.75.112';
  static const String pathGetDataList = '/api/directory/dataList';

  Future<DataListModel> getDataListModel() async {
    final uri = Uri.parse('$baseUrl$pathGetDataList');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.get(
      uri,
      headers: headers,
    );

    final statusCode = response.statusCode;
    print('api_service.dart, ApiService, getDataListModel(), statusCode: $statusCode');

    final parsingResult = DataListModel.fromRawJson(response.body);

    if (statusCode == 200 || statusCode == 201) {
      return parsingResult;
    } else {
      throw 'api_service.dart, ApiService, getDataListModel(), statusCode: $statusCode, response.body: ${response.body}';
    }

  }
}
