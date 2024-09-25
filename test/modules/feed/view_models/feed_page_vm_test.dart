import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/feed/models/like_data.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/view_models/feed_list_item_vm.dart';
import 'package:sintez_test/modules/feed/view_models/feed_page_vm.dart';
import 'package:sintez_test/modules/navigation/constants/routes.dart';

import '../../../mocks.dart';

void main() {
  late FeedPageViewModel viewModel;
  late MockPostsRepository mockPostRepository;
  late MockLikesService mockLikesService;
  late MockGoRouter mockGoRouter;

  setUpAll(() {
    mockPostRepository = MockPostsRepository();
    mockLikesService = MockLikesService();
    mockGoRouter = MockGoRouter();
  });

  const postId = 'post1';
  final postDto = PostDto(
    id: postId,
    title: 'Test Post',
    content: 'This is a test post.',
    mediaUrl: null,
    creationDate: DateTime.now().millisecondsSinceEpoch,
  );

  group('initialization stage', () {
    test(
        'Should call get all posts '
        'on view model initialization', () {
      when(() => mockPostRepository.getAllPosts()).thenAnswer((_) async => []);

      viewModel = FeedPageViewModel(
        postsRepository: mockPostRepository,
        likesService: mockLikesService,
        router: mockGoRouter,
      );

      verify(() => mockPostRepository.getAllPosts()).called(1);
    });

    test(
        'Should set postFetching to true '
        'on view model initialization', () {
      when(() => mockPostRepository.getAllPosts()).thenAnswer((_) async => []);

      viewModel = FeedPageViewModel(
        postsRepository: mockPostRepository,
        likesService: mockLikesService,
        router: mockGoRouter,
      );

      expect(viewModel.postsFetching, true);
    });

    test(
        'Should have empty posts '
        'on view model initialization', () {
      when(() => mockPostRepository.getAllPosts()).thenAnswer((_) async => []);

      viewModel = FeedPageViewModel(
        postsRepository: mockPostRepository,
        likesService: mockLikesService,
        router: mockGoRouter,
      );

      expect(viewModel.posts.isEmpty, true);
    });
  });

  group('post initialization stage', () {
    setUp(() {
      when(() => mockPostRepository.getAllPosts()).thenAnswer((_) async => []);
      viewModel = FeedPageViewModel(
        postsRepository: mockPostRepository,
        likesService: mockLikesService,
        router: mockGoRouter,
      );
    });

    test(
        'Should have 2 posts '
        'when repository responds with 2 posts '
        'on get posts', () async {
      expect(viewModel.posts.isEmpty, true);
      when(() => mockPostRepository.getAllPosts())
          .thenAnswer((_) async => [postDto, postDto]);

      await viewModel.getPosts();

      expect(viewModel.posts.length, 2);
    });

    test(
        'Should set postsFetching to false '
        'after get posts', () async {
      await viewModel.getPosts();

      expect(viewModel.postsFetching, false);
    });

    test(
        'Should navigate to create post route '
        'on openPostCreation', () {
      when(() => mockGoRouter.push(RoutePath.createPost))
          .thenAnswer((_) async => null);

      viewModel.openPostCreation();

      verify(() => mockGoRouter.push(RoutePath.createPost)).called(1);
    });

    test(
        'Should create a FeedListItemViewModel '
        'on createFeedListItemViewModel', () {
      when(() =>
          mockLikesService.getLikeDataByPost(
              postId: any(named: 'postId'))).thenAnswer((_) async =>
          LikeData(postId: 'postId', likeCount: 0, likedByCurrentUser: false));

      final feedListItemVm = viewModel.createFeedListItemViewModel(postDto);

      expect(feedListItemVm, isA<FeedListItemViewModel>());
      expect(feedListItemVm.postDto, postDto);
      expect(feedListItemVm.likesService, mockLikesService);
    });
  });
}
