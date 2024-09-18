import 'package:equatable/equatable.dart';

class PracticeReviseNowResponse extends Equatable {
  final int testsAttempted;
  final int questionsToBeRevised;

  const PracticeReviseNowResponse({required this.questionsToBeRevised,required this.testsAttempted});

  @override
  // TODO: implement props
  List<Object?> get props => [testsAttempted, questionsToBeRevised];
}