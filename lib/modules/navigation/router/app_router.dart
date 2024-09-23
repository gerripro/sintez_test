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
                var db = ioc<SDatabase>().instance;
                return FeedPage(
                    viewModel: FeedPageViewModel(
                        router: _router,
                        likesService: LikesService(
                            repository: LikesRepository(
                                likesDao: LikesDaoSqfliteImpl(database: db))),
                        postsRepository: PostRepository(
                            postDao: PostDaoSqfliteImpl(database: db))));
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
                            repository: PostRepository(
                                postDao: PostDaoSqfliteImpl(
                                    database: ioc<SDatabase>().instance))));
                  },
                )
              ]),
        ]),
  ],
);
