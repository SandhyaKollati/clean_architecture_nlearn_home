enum AppRouter {
  home,
  login;

  static AppRouter getRouterByName(String routeName) =>
      AppRouter.values.byName(routeName);
}