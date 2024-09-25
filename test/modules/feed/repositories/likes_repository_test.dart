
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/feed/models/like_dto.dart';
import 'package:sintez_test/modules/feed/repositories/likes_repository.dart';

import '../../../mocks.dart';

void main() {
  late MockLikesDao mockLikesDao;
  late LikesRepository likesRepository;
  final likeDto = LikeDto(userId: 'user1', postId: 'post1');

  setUpAll(() {
    mockLikesDao = MockLikesDao();
    likesRepository = LikesRepository(likesDao: mockLikesDao);
    registerFallbackValue(likeDto);
  });

  test('Should call insertLike from likes DAO'
      'on addLike', () async {
    when(() => mockLikesDao.insertLike(any())).thenAnswer((_) async => {});

    await likesRepository.addLike(like: likeDto);

    verify(() => mockLikesDao.insertLike(likeDto)).called(1);
  });

  test('Should call deleteLike from LikesDao'
      'on removeLike', () async {
    when(() => mockLikesDao.deleteLike(any())).thenAnswer((_) async => {});

    await likesRepository.removeLike(like: likeDto);

    verify(() => mockLikesDao.deleteLike(likeDto)).called(1);
  });

  test('Should call getLikedUserIdsForPost from LikesDao '
      'and return list of userIds'
      'on getLikedUserIdsForPost', () async {
    final mockUserIds = ['user1', 'user2'];
    when(() => mockLikesDao.getLikedUserIdsForPost(any()))
        .thenAnswer((_) async => mockUserIds);

    final result = await likesRepository.getLikedUserIdsForPost(postId: 'post1');

    expect(result, mockUserIds);
    verify(() => mockLikesDao.getLikedUserIdsForPost('post1')).called(1);
  });
}