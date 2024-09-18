import 'package:equatable/equatable.dart';

class HomeGetPracticeResponse extends Equatable {
  final String heading;
  final List<PracticeData> practiceData;

  const HomeGetPracticeResponse({
    required this.heading,
    required this.practiceData,
  });

  @override
  List<Object?> get props => [heading, practiceData];
}

class PracticeData extends Equatable {
  final String chapterName;
  final int completedQuestions;
  final int totalQuestions;
  final String subjectName;
  final String subjectIcon;
  final String practiceType;
  final String topicName;

  const PracticeData({
    required this.topicName,
    required this.chapterName,
    required this.completedQuestions,
    required this.totalQuestions,
    required this.subjectName,
    required this.subjectIcon,
    required this.practiceType,
  });

  @override
  List<Object?> get props => [
    chapterName,
    completedQuestions,
    totalQuestions,
    subjectName,
    subjectIcon,
    practiceType,
    topicName
  ];
}
