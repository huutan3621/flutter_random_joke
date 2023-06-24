import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../random_jokes/models/jokes_model.dart';

class DatabaseHelper {
  static const int _version = 1;

  static const String _dbName = 'Jokes.db';

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute(
          "CREATE TABLE Jokes(id INTEGER PRIMARY KEY, content TEXT, hasRead INTEGER, hasLiked INTEGER)"),
      version: _version,
    );
  }

  static Future<int> addJokes(Jokes jokes) async {
    final db = await _getDB();
    return await db.insert("Jokes", jokes.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateJoke(Jokes joke) async {
    final db = await _getDB();
    return await db.update(
      "Jokes",
      joke.toJson(),
      where: 'id = ?',
      whereArgs: [joke.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Jokes>?> getAllJokes() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Jokes");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
      maps.length,
      (index) => Jokes.fromJson(maps[index]),
    );
  }
}
