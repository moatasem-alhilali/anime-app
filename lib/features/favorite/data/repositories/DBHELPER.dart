import 'package:anime_app/features/favorite/data/model/FavoriteAnime.dart';
import 'package:sqflite/sqflite.dart';

class DBHelperFavorite {
  static Database? _db;
  static const int _version = 1;
  static const String nameTable = 'favoriteAnime';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = '${await getDatabasesPath()}favoritess';

      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) async {
          //first table
          await db.execute('''
      CREATE TABLE $nameTable(
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        anime_id INTEGER NOT NULL UNIQUE,
        image TEXT NOT NULL
      )
      ''');
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> addNote(FavoriteAnime favoriteAnime) async {
    print("insert");
    return await _db!.insert(nameTable, favoriteAnime.toJson());
  }

  static Future<int> deleteAnime(FavoriteAnime favoriteAnime) async {
    return await _db!.delete(
      nameTable,
      where: 'id = ?',
      whereArgs: [favoriteAnime.id],
    );
  }

  static Future<int> deleteAllNotes() async {
    return await _db!.delete(nameTable);
  }

  static Future<int> updateNote(FavoriteAnime favoriteAnime) async {
    return await _db!.update(
      nameTable,
      favoriteAnime.toJson(),
      where: 'id = ?',
      whereArgs: [favoriteAnime.id],
    );
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    print("query function called");
    return _db!.query(nameTable);
  }
}
