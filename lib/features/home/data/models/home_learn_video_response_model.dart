import '../../domain/entities/response/home_learn_video_response.dart';

class HomeGetLearnVideoResponseModel extends HomeGetLearnVideoResponse {
  final String heading;
  final List<LearnDataModel> learnData;

  const HomeGetLearnVideoResponseModel({required this.heading, required this.learnData})
      : super(heading: heading, learnData: learnData);

  factory HomeGetLearnVideoResponseModel.fromJson(Map<String, dynamic> json) {
      var data = json['data'];
      return HomeGetLearnVideoResponseModel(
        heading: data['heading'],
        learnData: (data['learn_data'] as List<dynamic>)
            .map((item) => LearnDataModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
  }

  HomeGetLearnVideoResponse toEntity() => HomeGetLearnVideoResponse(
    heading: heading,
    learnData: learnData.map((e) => e.toEntity()).toList(),
  );
}

class LearnDataModel extends LearnData {
  final String chapterId;
  final String videoName;

  const LearnDataModel( {
    required this.chapterId,
    required this.videoName,
  }) : super(
    chapterId: chapterId,
    videoName: videoName,
  );

  factory LearnDataModel.fromJson(Map<String, dynamic> json) {
    return LearnDataModel(
      chapterId: json['chapter_id'] ?? "", videoName: json['video_name'] ?? "",
    );
  }

  LearnData toEntity() => LearnData(
    chapterId: chapterId, videoName: videoName,
  );
}
