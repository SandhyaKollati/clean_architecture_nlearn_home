class ApiEndPoints {
  static get baseUrl => "https://stage-nlearn.gcf.education";
  static get featureConfig => "/auth/v1/usage/feature-config";
  static get getCourseList => "/auth/v1/course/course-list";
  static get getHomeScheduledTest => "/test/v1/scheduled/active-list";
  static get getHomeLearnVideoList => "/learn/v1/video/home-recent-list";
  static get getHomeLearnSubjectList => "/learn/v1/usage/subject-details";
  static get getHomePracticeList => "/explore/v3/practice/home-recent-list";
  static get dishaConfig => "/auth/v1/banner/disha-connect";
  static get userInfo => "/auth/v1/user/profile";
  static get getReviseNow => "/revise-test/v1/stats";
}