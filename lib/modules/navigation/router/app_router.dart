part of "navigation_register_module.dart";

final GoRouter _router = GoRouter(
  initialLocation: RoutePath.feed,
  routes: <RouteBase>[
    ShellRoute(
        builder: (context, state, child) {
          return ShellNavigationPage(
              viewModel: ShellNavigationViewModel(
                  router: _router, themeStore: ioc<ThemeStore>()),
              child: child);
        },
        routes: [
          GoRoute(
              name: RouteName.feed,
              path: RoutePath.feed,
              builder: (BuildContext context, GoRouterState state) {
                return FeedPage(
                    viewModel: FeedPageViewModel(
                        router: _router,
                        likesService: LikesService(
                            repository: ioc<LikesRepository>()),
                        postsRepository: ioc<PostRepository>()));
              },
              routes: [
                GoRoute(
                  name: RouteName.createPost,
                  path: RouteName.createPost,
                  builder: (context, state) {
                    return PostCreationPage(
                        viewModel: PostCreationPageViewModel(
                            router: _router,
                            uuidGenerator: UuidGenerator(),
                            mediaHandlerService: MediaHandlerService(
                                galleryPickerWrapper: GalleryPickerWrapper()),
                            repository: ioc<PostRepository>()));
                  },
                )
              ]),
        ]),
  ],
);
