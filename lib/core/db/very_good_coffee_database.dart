import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';

class VeryGoodCoffeeDatabase {
  VeryGoodCoffeeDatabase._init();
  static final VeryGoodCoffeeDatabase instance = VeryGoodCoffeeDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('coffee.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imageUrl TEXT NOT NULL,
        rating REAL NOT NULL
      )
    ''');
  }

  Future<void> addFavorite(CoffeeModel coffee) async {
    final db = await instance.database;
    await db.insert('favorites', coffee.toJson());
  }

  Future<void> removeFavorite(String imageUrl) async {
    final db = await instance.database;
    await db.delete('favorites', where: 'imageUrl = ?', whereArgs: [imageUrl]);
  }

  Future<List<CoffeeModel>> getFavorites() async {
    final db = await instance.database;
    final result = await db.query('favorites');
    return result.map(CoffeeModel.fromJson).toList();
  }
}
