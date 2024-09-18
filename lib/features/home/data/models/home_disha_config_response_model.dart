import '../../domain/entities/response/home_disha_config_response.dart';

class HomeDishaConfigResponseModel extends HomeDishaConfigResponse {
  final String dishaEndPoint;

  const HomeDishaConfigResponseModel({required this.dishaEndPoint}) : super(dishaEndPoint: dishaEndPoint);

  factory HomeDishaConfigResponseModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return HomeDishaConfigResponseModel(
        dishaEndPoint: data['disha_connect_end_point'],
    );
  }

  HomeDishaConfigResponse toEntity() => HomeDishaConfigResponse(dishaEndPoint: dishaEndPoint);
}
