import '../../domain/entities/response/home_learn_subjects_response.dart';

class HomeGetLearnSubjectListResponseModel extends HomeGetLearnSubjectListResponse {
  final String subjectId;
  final String subjectName;

  const HomeGetLearnSubjectListResponseModel({required this.subjectId,required this.subjectName}) : super(subjectId: subjectId, subjectName: subjectName);

  factory HomeGetLearnSubjectListResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeGetLearnSubjectListResponseModel(
        subjectId: json['subject_id'],
        subjectName: json['subject_name']
    );
  }
  HomeGetLearnSubjectListResponse toEntity() => HomeGetLearnSubjectListResponse(subjectId: subjectId, subjectName: subjectName);
}
