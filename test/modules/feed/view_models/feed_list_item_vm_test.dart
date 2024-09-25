import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/feed/models/like_data.dart';
import 'package:sintez_test/modules/feed/models/post_dto.dart';
import 'package:sintez_test/modules/feed/view_models/feed_list_item_vm.dart';
import 'package:test/test.dart';

import '../../../mocks.dart';

void main() {
  late FeedListItemViewModel viewModel;
  late MockLikesService mockLikesService;

  const postId = 'post1';
  final postDto = PostDto(
    id: postId,
    title: 'Test Post',
    content: 'This is a test post.',
    mediaUrl: null,
    creationDate: DateTime.now().millisecondsSinceEpoch,
  );
  final unlikedLikeData = LikeData(
    postId: postId,
    likeCount: 5,
    likedByCurrentUser: false,
  );
  final likedLikeData = LikeData(
    postId: postId,
    likeCount: 5,
    likedByCurrentUser: true,
  );

  Future<void> _initVm(LikeData likeData, {String? mediaUrl}) async {
    mockLikesService = MockLikesService();
    when(() => mockLikesService.getLikeDataByPost(postId: any(named: 'postId')))
        .thenAnswer((_) async => likeData);
    viewModel = FeedListItemViewModel(
        likesService: mockLikesService,
        postDto: PostDto(
          id: postId,
          title: 'Test Post',
          content: 'This is a test post.',
          mediaUrl: mediaUrl,
          creationDate: DateTime.now().millisecondsSinceEpoch,
        ));
    await Future.delayed(const Duration());
  }

  group('initialization stage', () {
    setUp(() {
      mockLikesService = MockLikesService();
      when(() =>
              mockLikesService.getLikeDataByPost(postId: any(named: 'postId')))
          .thenAnswer((_) async => unlikedLikeData);
    });

    test(
        'Should call getLikeDataByPost '
        'on view model initialization', () {
      viewModel = FeedListItemViewModel(
          likesService: mockLikesService, postDto: postDto);

      verify(() => mockLikesService.getLikeDataByPost(postId: postId))
          .called(1);
    });

    test(
        'Should set isLoading to true '
        'on view model initialization', () {
      viewModel = FeedListItemViewModel(
          likesService: mockLikesService, postDto: postDto);

      expect(viewModel.isLoading, true);
    });

    test(
        'Should have likeData value null '
        'and isPostMediaVideo false '
        'on view model initialization', () {
      viewModel = FeedListItemViewModel(
          likesService: mockLikesService, postDto: postDto);

      expect(viewModel.likeData, isNull);
      expect(viewModel.isPostMediaVideo, false);
    });
  });

  group('post initialization stage', () {
    test(
        'Should have same likeData value as passed through constructor '
        'after view model initialization', () async {
      await _initVm(unlikedLikeData);

      expect(viewModel.likeData!.likeCount, unlikedLikeData.likeCount);
      expect(viewModel.likeData!.likedByCurrentUser,
          unlikedLikeData.likedByCurrentUser);
      expect(viewModel.likeData!.postId, unlikedLikeData.postId);
    });

    test(
        'Should have isPostMediaVideo value equals to true '
            'when mediaUrl is of video format', () async {
      await _initVm(unlikedLikeData, mediaUrl: 'smth.mp4');

      expect(viewModel.isPostMediaVideo, true);
    });

    test(
        'Should have isPostMediaVideo value equals to false '
            'when mediaUrl is NOT of video format', () async {
      await _initVm(unlikedLikeData, mediaUrl: 'smth.jpg');

      expect(viewModel.isPostMediaVideo, false);
    });

    test(
        'Should call getLikeDataByPost '
        'on handleLike', () async {
      await _initVm(unlikedLikeData);
      when(() => mockLikesService.addLike(postId: any(named: 'postId')))
          .thenAnswer((_) async {});

      await viewModel.handleLike();

      verify(() => mockLikesService.getLikeDataByPost(postId: postId))
          .called(2);
    });

    test(
        "Should call service's addLike "
        "on handleLike "
        "if post was NOT liked before", () async {
      await _initVm(unlikedLikeData);
      when(() => mockLikesService.addLike(postId: any(named: 'postId')))
          .thenAnswer((_) async {});

      await viewModel.handleLike();

      verify(() => mockLikesService.addLike(postId: postId)).called(1);
    });

    test(
        "Should call service's removeLike "
        "on handleLike "
        "if post was liked before", () async {
      await _initVm(likedLikeData);
      when(() => mockLikesService.removeLike(postId: any(named: 'postId')))
          .thenAnswer((_) async {});

      await viewModel.handleLike();

      verify(() => mockLikesService.removeLike(postId: postId)).called(1);
    });
  });
}
