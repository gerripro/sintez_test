import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sintez_test/app/db/constants/db_configs.dart';
import 'package:sqflite/sqflite.dart';

class SDatabase {
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
            creationDate INTEGER NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS ${SDbConfigs.likesTable} (
            id TEXT PRIMARY KEY,
            userId TEXT NOT NULL,
            postId TEXT NOT NULL,
            FOREIGN KEY(postId) REFERENCES ${SDbConfigs.postsTable}(id) ON DELETE CASCADE
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
