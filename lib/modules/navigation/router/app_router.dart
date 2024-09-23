part of "navigation_register_module.dart";

final GoRouter _router = GoRouter(
  initialLocation: RoutePath.feed,
  routes: <RouteBase>[
    ShellRoute(
        builder: (context, state, child) {
          return ShellNavigationPage(
              viewModel: ShellNavigationViewModel(router: _router),
              child: child);
        },
        routes: [
          GoRoute(
            name: RouteName.feed,
            path: RoutePath.feed,
            builder: (BuildContext context, GoRouterState state) {
              return Feed(
                  viewModel: FeedViewModel(
                      router: _router,
                      repository: PostRepository(
                          postDao: PostDaoSqfliteImpl(
                              database: ioc<SDatabase>().instance))));
            },
          ),
        ]),
  ],
);
