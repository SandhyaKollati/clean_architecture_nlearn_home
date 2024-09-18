import 'dart:core';

import 'package:equatable/equatable.dart';

class HomeGetLearnVideoResponse extends Equatable {
  final String heading;
  final List<LearnData> learnData;

  const HomeGetLearnVideoResponse({
    required this.heading,
    required this.learnData,
  });

  @override
  List<Object?> get props => [heading, learnData];
}

class LearnData extends Equatable {
  final String chapterId;
  final String videoName;

  const LearnData({
    required this.videoName,
    required this.chapterId,
  });

  @override
  List<Object?> get props => [chapterId, videoName];
}
