import '../../domain/entities/response/home_user_profile_response.dart';

class UserProfileInformationResponseModel extends UserProfileInformationResponse {
  final String studentId;
  final String studentName;
  final String displayName;

  const UserProfileInformationResponseModel({required this.studentId,required this.studentName, required this.displayName}) : super(studentId: studentId, studentName: studentName, displayName: displayName);

  factory UserProfileInformationResponseModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return UserProfileInformationResponseModel(
        studentId: data['studentId'],
        studentName: data['studentName'],
        displayName: data['display_name']
    );
  }

  UserProfileInformationResponse toEntity() => UserProfileInformationResponse(studentId: studentId, studentName: studentName, displayName: displayName);
}