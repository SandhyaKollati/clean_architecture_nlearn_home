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
    var accessToken = "eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkRHalZmUENhZlMiLCJ1c2VyIjp7Im9iamVjdElkIjoiREdqVmZQQ2FmUyIsImFkbWlzc2lvbk51bWJlciI6Im1nbXQxMWxlYXJuMjExIiwiU3RyZWFtIjoiU1BvdFJxZ1RIVCIsIkNvbGxlZ2UiOiJTZmxmUFdyWGhKIiwiQmF0Y2giOiJtZ210WDZhejRRIiwiQ2xhc3MiOiJ5MTYzZXdpZ0VDIiwiU3ViQmF0Y2giOiJlQkVhNHZta1JzIiwic3R1ZGVudE5hbWUiOiJtZ210MTFsZWFybjIxMSIsImFkZHJlc3MiOiJhZGRyZXNzIiwic3RhdGUiOiJNQU5BR0VNRU5UIFNUQVRFIE5FVyIsIlNlY3Rpb24iOiJuMjE2cDM1OENlIiwibGFzdExvZ2luIjoiMjAyNC0wOS0yNlQxODoxMDoyOSswNTozMCIsImlzUHJvZmlsZVVwZGF0ZWQiOnRydWUsInJlZ2lzdHJhdGlvblN0YXR1cyI6MSwiZXhhbU1vZGVsTGlzdCI6WyJ1OWtoelNxYW4zIiwidjNBNk5LRkFiQSIsImpDVDlHRDhXQmsiLCJRQ3BMTTFXZEVVIiwidGlvSUJPUVFRSiIsIlVIenZxaG96UTIiLCJ4OUhMeDVZaDY3IiwicUN1WlhRTFV4RiIsImRWQ1RLQVppaVQiLCJZVDVYYjFPeDFlIl0sIlllYXIiOiJ3VWh4R1hvd0FkIiwiUmVnaXN0cmF0aW9uU3RhdGUiOiJMbWpzTG13ZWtZIiwicHJvZmlsZUltYWdlIjpudWxsLCJkaXNwbGF5TmFtZSI6ImZnZ2dnZ2giLCJDb3Vyc2UiOiI3RXhnamNiZEdzIiwiQm9hcmQiOiJHNmJNa01iQmI1IiwidmVyc2lvbkNvZGUiOm51bGwsInRleHRQYXNzd29yZCI6bnVsbCwicHJvZmlsZXVwZGF0ZWRhYXQiOiIyMDIzLTA0LTIwVDA2OjA4OjQ5LjAwMFoiLCJOVFNFRXhhbSI6bnVsbCwibWF0ZXJpYWxGZWVTdGF0dXMiOiJOTyIsInRhZyI6Imdyb3VwYXBpIiwibWV0YURhdGEiOnsiZmVhdHVyZV9jb25maWdfaGFzaCI6ImExMmU0MzJmMGNkNzQ1YzM1YzcxYjgyMGRhY2ZhYTE5NmUwNWRiYzkyZGFlODk1YzU4MDViZTZjMGViOWE2MjEifSwic291cmNlIjpudWxsLCJpc0xvZ2dlZEluRHVtbXkiOmZhbHNlLCJyZW1vdmVBY2NvdW50U3RhdHVzIjpudWxsLCJiYXRjaF9pZCI6Im1nbXRYNmF6NFEiLCJiYXRjaF9uYW1lIjoiTUFOQUdFTUVOVCIsIkxlYXJuaW5nUGFja2FnZUlkIjoxLCJQcmFjdGljZVBhY2thZ2VJZCI6MSwiTGVhcm5pbmdQYWNrYWdlIjoidXlLVXU2UEN4QSIsIlByYWN0aWNlUGFja2FnZSI6IkhjU0U1R0l5SU0iLCJzdGF0ZU9iamVjdElkIjoidDJZTVM3ZUpqWCIsIlN0YXRlIjoidDJZTVM3ZUpqWCIsInN0YXRlTmFtZSI6Ik1BTkFHRU1FTlQgU1RBVEUgTkVXIiwiRGlzdHJpY3QiOiJHeXl1a0JIY1ZrIiwiZGlzdHJpY3ROYW1lIjoiREVNTyBESVNUUklDVCIsImNvbGxlZ2VOYW1lIjoiTUFOQUdFTUVOVCBORVciLCJiYXRjaE5hbWUiOiJNQU5BR0VNRU5UIiwic3ViQmF0Y2hOYW1lIjoiTUFOQUdFTUVOVCIsInN1YkJhdGNoSWQiOiJlQkVhNHZta1JzIiwieWVhck5hbWUiOiIyMDIwLTIwMjEiLCJSZWdpc3RyYXRpb25TdGF0dXMiOiJMbWpzTG13ZWtZIiwiUmVnaXN0cmF0aW9uU3RhdHVzTmFtZSI6InJlZ2lzdHJhdGlvbiIsImNsYXNzTmFtZSI6IjExVEggU1REIiwiY2xhc3NJZCI6InkxNjNld2lnRUMiLCJzZWN0aW9uTmFtZSI6IjUwMSIsInBsYXRmb3JtIjoibmxlYXJuIiwibkd1aWRlUHJvZ3JhbUNvZGUiOm51bGwsImJvYXJkTmFtZSI6IkNCU0UifSwiand0SUQiOiI2NzU0NTQxMDA4Y2JmYmEzNDc1ZTEwODBjMGZhMmRhODg2MmQ2Nzc4NDlmMmQ5MmZjNjZlNmIzNjUxYjhlMTc5IiwiaWF0IjoxNzI3MzU0NDI5LCJleHAiOjE3Mjk5NDY0MjksImlzcyI6Imp3dC1ubGVhcm4ifQ.dTAzZxuc42FEj_yZBnoKrIj_NdgN_1IauJI2WF8YMcf3Osbb06Irqx7xBm3Dbk32kTtfn98DoGYGrmZwOMdbhM-uplFojbVyRLbgwf3kt_eyrxmzziNo45bpAonTuRLFj2Vm-gnOXdzxPv1c_5o4PakaqTvib-Cgp-4MrChoJXID2o1K3KknXTdnt_upSqJllQmGN9VY6nIRzFDuRi8yiYyQvHog7IK22V2KwXaqLxTFjMO0A3Au29OPWSJ-Zb0gY3RzOOPa6Utiqb2bY1_6bzUug0C_6aq8X-l8VzYLB5_qafajr5wy3Wmna5vg2A62guSdo8J79kUPOVnY4CPUrxKNBftxVcSqurh6unw59ZS8U7tO-wN3KyA1tqpFT8-IMDLPvuSkNW5rBDlQjS3XZ5sQyZjUfv5Izo2KmWs_a4y1lciUIx41Pv06vT2kf8YffegKXJhSbl9Sri-fj9vSJ8Lqt7koaw93xwkgO7ZiVQVn-pmeRgQME-MulM9ii3y98ajMYmLJ7UqtJaFxs6v8EZn28WQ7S0DjJIyhoQhgo-qxP4wEqodsK_4hbBn8vwjRu4KZbXeo3RyKfGJINEYsWATMx1p9UCXNVqyuSMHCVlTxrbBUaY50ScFSHnHcvYhlP9b3fWl-1m2z8PfC5WgpqCW2UPK-fAgcHDQk4DFZQqE";
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
