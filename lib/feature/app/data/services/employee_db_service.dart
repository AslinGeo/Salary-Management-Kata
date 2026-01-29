import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class EmployeeDbService {
  static const _dbName = 'employee.db';
  static const _dbVersion = 1;

  static final EmployeeDbService _instance =
      EmployeeDbService._internal();

  factory EmployeeDbService() => _instance;

  EmployeeDbService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), _dbName);
    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE employees(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        full_name TEXT,
        job_title TEXT,
        country TEXT,
        salary REAL
      )
    ''');
  }

  Future<int> insertEmployee(Map<String, dynamic> data) async {
    final db = await database;
    return db.insert('employees', data);
  }

  Future<List<Map<String, dynamic>>> getAllEmployees() async {
    final db = await database;
    return db.query('employees');
  }

  Future<int> deleteEmployee(int id) async {
    final db = await database;
    return db.delete(
      'employees',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateEmployee(Map<String, dynamic> data) async {
  final db = await database;
  return db.update(
    'employees',
    data,
    where: 'id = ?',
    whereArgs: [data['id']],
  );
}

}
