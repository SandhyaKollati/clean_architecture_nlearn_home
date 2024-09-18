import '../../domain/entities/response/home_learn_practice_response.dart';

class HomeGetPracticeResponseModel extends HomeGetPracticeResponse {
  final String heading;
  final List<PracticeDataModel> practiceData;

  const HomeGetPracticeResponseModel({
    required this.heading,
    required this.practiceData,
  }) : super(heading: heading, practiceData: practiceData);

  factory HomeGetPracticeResponseModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return HomeGetPracticeResponseModel(
      heading: data['heading'],
      practiceData: (data['practice_data'] as List<dynamic>? ?? [])
          .map((data) => PracticeDataModel.fromJson(data as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'heading': heading,
      'practice_data': practiceData.map((data) => data.toJson()).toList(),
    };
  }

  HomeGetPracticeResponse toEntity() {
    return HomeGetPracticeResponse(
      heading: heading,
      practiceData: practiceData.map((data) => data.toEntity()).toList(),
    );
  }
}

class PracticeDataModel extends PracticeData {
  final String chapterName;
  final int completedQuestions;
  final int totalQuestions;
  final String subjectName;
  final String subjectIcon;
  final String practiceType;
  final String topicName;

  const PracticeDataModel({
    required this.topicName,
    required this.chapterName,
    required this.completedQuestions,
    required this.totalQuestions,
    required this.subjectName,
    required this.subjectIcon,
    required this.practiceType,
  }) : super(
      chapterName: chapterName,
      completedQuestions: completedQuestions,
      totalQuestions: totalQuestions,
      subjectName: subjectName,
      subjectIcon: subjectIcon,
      practiceType: practiceType, topicName: topicName);

  factory PracticeDataModel.fromJson(Map<String, dynamic> json) {
    return PracticeDataModel(
      chapterName: json['chapter_name'] ?? '',
      completedQuestions: json['completed_questions'] ?? 0,
      totalQuestions: json['total_questions'] ?? 0,
      subjectName: json['subject_name'] ?? '',
      subjectIcon: json['subject_icon'] ?? '',
      practiceType: json['practice_type'] ?? '',
      topicName: json['topic_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chapter_name': chapterName,
      'completed_questions': completedQuestions,
      'total_questions': totalQuestions,
      'subject_name': subjectName,
      'subject_icon': subjectIcon,
      'practice_type': practiceType,
      'topic_name': topicName
    };
  }

  PracticeData toEntity() {
    return PracticeData(
      chapterName: chapterName,
      completedQuestions: completedQuestions,
      totalQuestions: totalQuestions,
      subjectName: subjectName,
      subjectIcon: subjectIcon,
      practiceType: practiceType,
      topicName: topicName,
    );
  }
}
