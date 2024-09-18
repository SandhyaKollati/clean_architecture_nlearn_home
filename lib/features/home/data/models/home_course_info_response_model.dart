import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';

class CourseInformationResponseModel extends CourseInformationResponse {
  final String id;
  final String name;

  const CourseInformationResponseModel({required this.id, required this.name}) : super(id: id, name: name);

  factory CourseInformationResponseModel.fromJson(Map<String, dynamic> json) {
    return CourseInformationResponseModel(
        id: json['course_id'],
        name: json['course_name']
    );
  }

  CourseInformationResponse toEntity() => CourseInformationResponse(id: id, name: name);
}
