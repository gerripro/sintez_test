
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/app/db/constants/db_configs.dart';
import 'package:sintez_test/modules/feed/dao/likes_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/models/like_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

import '../../../mocks.dart';

void main() {
  late LikesDaoSqfliteImpl likesDao;
  late MockSQFliteDatabase mockDatabase;
  late MockSDatabase sqFliteDatabase;

  final likeDto = LikeDto(userId: 'user1', postId: 'post1');

  setUpAll(() {
    sqFliteDatabase = MockSDatabase();
    mockDatabase = MockSQFliteDatabase();
    likesDao = LikesDaoSqfliteImpl(database: sqFliteDatabase);
    when(() => sqFliteDatabase.instance).thenReturn(mockDatabase);
  });

  test(
      'Should insert likeDto into the database '
          'on insertLike', () async {
    when(() => mockDatabase.insert(
      any(),
      any(),
      conflictAlgorithm: any(named: 'conflictAlgorithm'),
    )).thenAnswer((_) async => 1);

    await likesDao.insertLike(likeDto);

    verify(() => mockDatabase.insert(
      SDbConfigs.likesTable,
      likeDto.toJson(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    )).called(1);
  });

  test('Should delete a like from the database'
      'on deleteLike', () async {
    when(() => mockDatabase.delete(
      any(),
      where: any(named: 'where'),
      whereArgs: any(named: 'whereArgs'),
    )).thenAnswer((_) async => 1);

    await likesDao.deleteLike(likeDto);

    verify(() => mockDatabase.delete(
      SDbConfigs.likesTable,
      where: 'userId = ? AND postId = ?',
      whereArgs: [likeDto.userId, likeDto.postId],
    )).called(1);
  });

  test('Should return a list of userIds who liked a post'
      'on getLikedUserIdsForPost', () async {
    final mockQueryResult = [
      {'userId': 'user1'},
      {'userId': 'user2'},
    ];
    when(() => mockDatabase.query(
      any(),
      columns: any(named: 'columns'),
      where: any(named: 'where'),
      whereArgs: any(named: 'whereArgs'),
    )).thenAnswer((_) async => mockQueryResult);

    final result = await likesDao.getLikedUserIdsForPost('post1');

    expect(result, ['user1', 'user2']);
    verify(() => mockDatabase.query(
      'likes',
      columns: ['userId'],
      where: 'postId = ?',
      whereArgs: ['post1'],
    )).called(1);
  });
}