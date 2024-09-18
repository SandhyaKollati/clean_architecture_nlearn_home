import '../utils/constants/api_end_points.dart';
import '../utils/enums/service.dart';
import 'package:dio/dio.dart';

class ApiResponse<T> {
  final Response? response;
  final String? error;

  ApiResponse({this.response, this.error});

  bool get hasError => error != null;
}

class BaseApiService {
  static final BaseApiService instance = BaseApiService();
  final Dio dio = Dio();

  Future<ApiResponse<T>> makeRequest<T>({
    required String url,
    String? baseUrl,
    dynamic body,
    String? contentType,
    Map<String, dynamic>? queryParameters,
    RequestType method = RequestType.get,
  }) async {
    var accessToken = "eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkRHalZmUENhZlMiLCJ1c2VyIjp7Im9iamVjdElkIjoiREdqVmZQQ2FmUyIsImFkbWlzc2lvbk51bWJlciI6Im1nbXQxMWxlYXJuMjExIiwiU3RyZWFtIjoiU1BvdFJxZ1RIVCIsIkNvbGxlZ2UiOiJTZmxmUFdyWGhKIiwiQmF0Y2giOiJtZ210WDZhejRRIiwiQ2xhc3MiOiJ5MTYzZXdpZ0VDIiwiU3ViQmF0Y2giOiJlQkVhNHZta1JzIiwic3R1ZGVudE5hbWUiOiJtZ210MTFsZWFybjIxMSIsImFkZHJlc3MiOiJhZGRyZXNzIiwic3RhdGUiOiJNQU5BR0VNRU5UIFNUQVRFIE5FVyIsIlNlY3Rpb24iOiJuMjE2cDM1OENlIiwibGFzdExvZ2luIjoiMjAyNC0wOS0xOFQyMDozMjowNCswNTozMCIsImlzUHJvZmlsZVVwZGF0ZWQiOnRydWUsInJlZ2lzdHJhdGlvblN0YXR1cyI6MSwiZXhhbU1vZGVsTGlzdCI6WyJ1OWtoelNxYW4zIiwidjNBNk5LRkFiQSIsImpDVDlHRDhXQmsiLCJRQ3BMTTFXZEVVIiwidGlvSUJPUVFRSiIsIlVIenZxaG96UTIiLCJ4OUhMeDVZaDY3IiwicUN1WlhRTFV4RiIsImRWQ1RLQVppaVQiLCJZVDVYYjFPeDFlIl0sIlllYXIiOiJ3VWh4R1hvd0FkIiwiUmVnaXN0cmF0aW9uU3RhdGUiOiJMbWpzTG13ZWtZIiwicHJvZmlsZUltYWdlIjpudWxsLCJkaXNwbGF5TmFtZSI6ImZnZ2dnZ2giLCJDb3Vyc2UiOiI3RXhnamNiZEdzIiwiQm9hcmQiOiJHNmJNa01iQmI1IiwidmVyc2lvbkNvZGUiOm51bGwsInRleHRQYXNzd29yZCI6bnVsbCwicHJvZmlsZXVwZGF0ZWRhYXQiOiIyMDIzLTA0LTIwVDA2OjA4OjQ5LjAwMFoiLCJOVFNFRXhhbSI6bnVsbCwibWF0ZXJpYWxGZWVTdGF0dXMiOiJOTyIsInRhZyI6Imdyb3VwYXBpIiwibWV0YURhdGEiOnsiZmVhdHVyZV9jb25maWdfaGFzaCI6IjAzYmEwOGRhNzA2YjJkYTljMWE4YjlkY2ZmOGRlMDgxNWMxNmJkMmVkODM5MzY3MTRhMzZkY2Q4OWYwZjIxOWUifSwic291cmNlIjpudWxsLCJpc0xvZ2dlZEluRHVtbXkiOmZhbHNlLCJyZW1vdmVBY2NvdW50U3RhdHVzIjpudWxsLCJiYXRjaF9pZCI6Im1nbXRYNmF6NFEiLCJiYXRjaF9uYW1lIjoiTUFOQUdFTUVOVCIsIkxlYXJuaW5nUGFja2FnZUlkIjoxLCJQcmFjdGljZVBhY2thZ2VJZCI6MSwiTGVhcm5pbmdQYWNrYWdlIjoidXlLVXU2UEN4QSIsIlByYWN0aWNlUGFja2FnZSI6IkhjU0U1R0l5SU0iLCJzdGF0ZU9iamVjdElkIjoidDJZTVM3ZUpqWCIsIlN0YXRlIjoidDJZTVM3ZUpqWCIsInN0YXRlTmFtZSI6Ik1BTkFHRU1FTlQgU1RBVEUgTkVXIiwiRGlzdHJpY3QiOiJHeXl1a0JIY1ZrIiwiZGlzdHJpY3ROYW1lIjoiREVNTyBESVNUUklDVCIsImNvbGxlZ2VOYW1lIjoiTUFOQUdFTUVOVCBORVciLCJiYXRjaE5hbWUiOiJNQU5BR0VNRU5UIiwic3ViQmF0Y2hOYW1lIjoiTUFOQUdFTUVOVCIsInN1YkJhdGNoSWQiOiJlQkVhNHZta1JzIiwieWVhck5hbWUiOiIyMDIwLTIwMjEiLCJSZWdpc3RyYXRpb25TdGF0dXMiOiJMbWpzTG13ZWtZIiwiUmVnaXN0cmF0aW9uU3RhdHVzTmFtZSI6InJlZ2lzdHJhdGlvbiIsImNsYXNzTmFtZSI6IjExVEggU1REIiwiY2xhc3NJZCI6InkxNjNld2lnRUMiLCJzZWN0aW9uTmFtZSI6IjUwMSIsInBsYXRmb3JtIjoibmxlYXJuIiwibkd1aWRlUHJvZ3JhbUNvZGUiOm51bGwsImJvYXJkTmFtZSI6IkNCU0UifSwiand0SUQiOiI4MzFiMzZiMzQ4NzBkZjllZjZhOGRjYTQzZjI1NTQxNGM5YTE0MGUxMTYxNDYwYzE4MDkyODkyNzJiN2ZkNDU2IiwiaWF0IjoxNzI2NjcxNzI0LCJleHAiOjE3MjkyNjM3MjQsImlzcyI6Imp3dC1ubGVhcm4ifQ.GVvu9FlF0IOgV4L7gVDnZBHjAPtJAf2ngYsjt8KqUaO_zYhZuN6cOC6EZwMA21QfP_Kri75HUuC_o4hPzmSbr57E2hlpKhXms9hGC6G0CttVk_4J9Hz-BMxJauVsiCkITyIoX3ya9EP4BPL-BLAsgdHVyXJJGjHE4f3m08cJEXSzx8d8qnLLYOBXHX4tkn9aQkjtFu4DBy8y_JIw462bjIgI7lnzQ_tcfGMkZoiEQSu2TWNOXh_fAcxRhvaa7FVGBCS48pF2RJhDL6rpuUdIP83iNJEP6Z87WXVXmzMzLxxiyv29sG-k8bnGLN2bJ6YSV-VRO559o1UOXo6G0pm_VvVmX-O0I2_fzJbT3vUZIxTTNnYqS9KyrCe1qcOm-LXVOne7U63iMKRIDwWBdj3Y3pzTg8UZ1YDpIk7YJh7GOf7kKBfZE1HhvhMugVrGPvOmF33RW36jH9SyI-r1foZXpo9dVeyMXdU39BLM6WplEV40M48QNhLlmJTgkEZi--06u6jqoBc_KC5ru6JapHnZV-L9jE26pSkIznunv1FO2Ak77G5fsfC9sX7k_aVA5OIbhEilbS40YLTS7hZL6XwLCxHzVZ0PGcfJ4dpcHCknoulkJBQexBxWs6ug-10Y_rrf-vWvbNqYVecqhMouwpVxxpeYPZbWlrKpnKWfSTAs28k";
    dio.options.baseUrl = baseUrl ?? ApiEndPoints.baseUrl;
    dio.options.headers['Authorization'] = "Bearer $accessToken";
    dio.options.headers['Content-Type'] = "application/json";
    dio.options.headers['platform'] = "iOS";
    dio.options.headers['source'] = "nlearn";
    dio.options.headers['Accept'] = "application/json";

    try {
      Response response;
      switch (method) {
        case RequestType.get:
          response = await dio.get(url, queryParameters: queryParameters);
          break;
        case RequestType.put:
          response =
              await dio.put(url, queryParameters: queryParameters, data: body);
          break;
        case RequestType.post:
          response =
              await dio.post(url, queryParameters: queryParameters, data: body);
          break;
        case RequestType.delete:
          response = await dio.delete(url,
              queryParameters: queryParameters, data: body);
          break;
      }
      return ApiResponse(response: response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return ApiResponse<T>(error: "Unauthorized: session expired");
      }
      return ApiResponse<T>(error: "Failed to make request: ${e.message}");
    } catch (e) {
      return ApiResponse<T>(error: "An unknown error occurred: $e");
    }
  }
}
