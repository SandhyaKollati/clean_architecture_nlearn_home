import 'package:equatable/equatable.dart';

class CourseInformationResponse extends Equatable {
  final String? id;
  final String? name;

  const CourseInformationResponse({this.id, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}