/* import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

// Helper class for SQLite
class QuranDatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'quran.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE QuranPages (
        id INTEGER PRIMARY KEY,
        page_number INTEGER,
        image_data BLOB
      );
    ''');
  }

  Future<void> insertImage(int pageNumber, Uint8List imageData) async {
    final db = await database;
    await db.insert(
      'QuranPages',
      {
        'page_number': pageNumber,
        'image_data': imageData,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllImages() async {
    final db = await database;
    return await db.query('QuranPages', orderBy: 'page_number ASC');
  }
}

// Function to load all images from assets
Future<void> insertAllImages() async {
  final dbHelper = QuranDatabaseHelper();
  for (int i = 1; i <= 864; i++) {
    String assetPath = 'assets/images/quran/$i.jpg'; // Update this path
    try {
      ByteData data = await rootBundle.load(assetPath);
      Uint8List imageData = data.buffer.asUint8List();
      await dbHelper.insertImage(i, imageData);
    } catch (e) {
      print('Error loading image $i: $e');
    }
  }
  print('All images inserted into database.');
}

// Check if it's the first app launch
Future<void> handleFirstLaunch() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  if (isFirstLaunch) {
    print('First launch: inserting images...');
    await insertAllImages();
    await prefs.setBool('isFirstLaunch', false); // Set flag to false
  } else {
    print('Not the first launch: skipping image insertion.');
  }
}
 */