import 'package:dio/dio.dart';
import 'package:echse_frontend/models/process_model.dart';
import 'package:echse_frontend/utils/widgets/snack_bars.dart';

class ProcessRepository {
  static String get kBaseUrl => 'http://localhost:443';
  final Dio _dio = Dio();

  ProcessRepository() {
    _dio.options.baseUrl = kBaseUrl;
  }

  Future<List<ProcessModel>> getProcesses() async {
    try {
      final response = await _dio.get('/data');
      final List<dynamic> data = response.data['data'];
      return data.map((json) => ProcessModel.fromJson(json)).toList();
    } on DioException catch (e) {
      showErrorSnackBar(e.toString());
    } catch (e) {
      showErrorSnackBar(e.toString());
    }
    return [];
  }
}
