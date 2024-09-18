import 'package:equatable/equatable.dart';

class UserProfileInformationResponse extends Equatable {
  final String studentId;
  final String studentName;
  final String displayName;

  const UserProfileInformationResponse({required this.studentId, required this.studentName, required this.displayName});

  @override
  // TODO: implement props
  List<Object?> get props => [
    studentId,
    studentName,
    displayName
  ];
}