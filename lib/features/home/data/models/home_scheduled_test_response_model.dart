import '../../domain/entities/response/home_scheduled_test_response.dart';

class HomeGetScheduledTestResponseModel extends HomeGetScheduledTestResponse{
  final String examName;

  const HomeGetScheduledTestResponseModel({required this.examName}) : super(examName: examName);

  factory HomeGetScheduledTestResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeGetScheduledTestResponseModel(
        examName: json['exam_name'],
    );
  }

  HomeGetScheduledTestResponse toEntity() => HomeGetScheduledTestResponse(examName: examName);
}
