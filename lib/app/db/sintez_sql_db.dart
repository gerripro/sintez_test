import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sintez_test/app/db/constants/db_configs.dart';
import 'package:sqflite/sqflite.dart';

final class SDatabase {
  late final Database instance;
  Future<void> _initDataBase() async {
    String path = join(await getDatabasesPath(), SDbConfigs.dbName);
    instance = await openDatabase(
      path,
      version: SDbConfigs.version,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS ${SDbConfigs.postsTable} (
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            content TEXT NOT NULL,
            mediaUrl TEXT,
            creationDate INTEGER NOT NULL,
            likeCount INTEGER NOT NULL
          )
        ''');
      },
    );
  }
}

@module
abstract class SDatabaseRegistrationModule {
  @preResolve
  Future<SDatabase> getInstance() async {
    final db = SDatabase();
    await db._initDataBase();
    return db;
  }
}
