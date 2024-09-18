import 'package:equatable/equatable.dart';

class HomeGetScheduledTestResponse extends Equatable {
  final String examName;
  const HomeGetScheduledTestResponse({required this.examName});

  @override
  // TODO: implement props
  List<Object?> get props => [examName];
}