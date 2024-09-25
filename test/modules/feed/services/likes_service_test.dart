import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/feed/models/like_data.dart';
import 'package:sintez_test/modules/feed/models/like_dto.dart';
import 'package:sintez_test/modules/feed/services/likes_service.dart';

import '../../../mocks.dart';

void main() {
  late LikesService likesService;
  late MockLikesRepository mockLikesRepository;

  setUpAll(() {
    mockLikesRepository = MockLikesRepository();
    likesService = LikesService(repository: mockLikesRepository);
    registerFallbackValue(LikeDto(userId: 'userId', postId: 'postId'));
    registerFallbackValue(
        LikeData(postId: 'postId', likeCount: 0, likedByCurrentUser: false));
  });

  const String postId = 'post1';
  const String currentUserId = 'mockId';

  test(
      'should return LikeData with true current user like '
      'on getLikeDataByPost '
      'if current user id is in the response', () async {
    final mockUserIds = [currentUserId, 'user2'];
    when(() => mockLikesRepository.getLikedUserIdsForPost(postId: postId))
        .thenAnswer((_) async => mockUserIds);

    final result = await likesService.getLikeDataByPost(postId: postId);

    expect(result.runtimeType, LikeData);
    expect(result.likedByCurrentUser, true);
    expect(result.likeCount, 2);
  });

  test(
      'should return LikeData with false current user like '
      'on getLikeDataByPost '
      'if current user id is NOT in the response', () async {
    final mockUserIds = ['user1', 'user2'];
    when(() => mockLikesRepository.getLikedUserIdsForPost(postId: postId))
        .thenAnswer((_) async => mockUserIds);

    final result = await likesService.getLikeDataByPost(postId: postId);

    expect(result.runtimeType, LikeData);
    expect(result.likedByCurrentUser, false);
    expect(result.likeCount, 2);
  });

  test(
      'should call repository.addLike '
      'on addLike', () async {
    when(() => mockLikesRepository.addLike(like: any(named: 'like')))
        .thenAnswer((_) async => {});

    await likesService.addLike(postId: postId);

    verify(() => mockLikesRepository.addLike(
          like: any(named: 'like'),
        )).called(1);
  });

  test(
      'Should call repository.removeLike '
      'on removeLike', () async {
    when(() => mockLikesRepository.removeLike(
            like: any(named: 'like')))
        .thenAnswer((_) async => {});

    await likesService.removeLike(postId: postId);

    verify(() => mockLikesRepository.removeLike(
          like: any(named: 'like'),
        )).called(1);
  });
}
