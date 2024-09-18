import 'package:equatable/equatable.dart';

class HomeGetLearnSubjectListResponse extends Equatable {
  final String? subjectId;
  final String? subjectName;

  const HomeGetLearnSubjectListResponse(
      {this.subjectId, this.subjectName});

  @override
  // TODO: implement props
  List<Object?> get props => [subjectId, subjectName];
}