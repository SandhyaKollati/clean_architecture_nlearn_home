import '../../domain/entities/response/home_revise_now_status_response.dart';

class PracticeReviseNowResponseModel extends PracticeReviseNowResponse {
  final int testsAttempted;
  final int questionsToBeRevised;
  const PracticeReviseNowResponseModel({required this.questionsToBeRevised, required this.testsAttempted}) : super(testsAttempted: testsAttempted, questionsToBeRevised: questionsToBeRevised);

  factory PracticeReviseNowResponseModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return PracticeReviseNowResponseModel(
        testsAttempted: data['tests_attempted'] ?? 0,
        questionsToBeRevised: data['questions_to_be_revised'] ?? 0,
    );
  }

  PracticeReviseNowResponse toEntity() => PracticeReviseNowResponse(questionsToBeRevised: questionsToBeRevised, testsAttempted: testsAttempted);
}
