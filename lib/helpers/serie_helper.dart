import 'package:segunda_prova_app/domain/serie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SerieHelper{
  static final SerieHelper _instance = SerieHelper.internal();
    
  //questão 2 criar banco

  factory SerieHelper() => _instance;

  SerieHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String? databasesPath = await getDatabasesPath();
    if (databasesPath == null) databasesPath = "";
    String path = join(databasesPath, "livros.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE ${Serie.serieTable}(${Serie.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "                             ${Serie.nameColumn} TEXT, "
                  "                             ${Serie.autorColumn} TEXT, "
                  "                             ${Serie.qntTemporadasColumn} INTEGER, "
                  "                             ${Serie.avaliacaoColumn} REAL, "
                  "                             ${Serie.generoColumn} TEXT, "
                  "                             ${Serie.sinopseColumn} TEXT );"
                  );
        }
      );
  }

  Future<Serie> saveSerie(Serie s) async {
    Database? dbSerie = await db;
    if (dbSerie != null) {
      s.id = await dbSerie.insert(Serie.serieTable, s.toMap());
    }
    return s;
  }

  Future<Serie?> getSerie(int id) async {
    Database? dbSerie = await db;
    if (dbSerie != null) {
      List<Map> maps = await dbSerie.query(Serie.serieTable,
          columns: [
            Serie.idColumn,
            Serie.nameColumn,
            Serie.autorColumn,
            Serie.qntTemporadasColumn,
            Serie.avaliacaoColumn,
            Serie.generoColumn,
            Serie.sinopseColumn
          ],
          where: "${Serie.idColumn} = ?",
          whereArgs: [id]);
      if (maps.length > 0)
        return Serie.fromMap(maps.first);
    }
    return null;
  }

  Future<int> deleteSerie(int id) async {
    Database? dbSerie = await db;
    if (dbSerie!= null) {
      return await dbSerie.delete(Serie.serieTable,
          where: "${Serie.idColumn} = ?", whereArgs: [id]);
    }
    return 0;
  }

  Future<int> updateSerie(Serie s) async {
    Database? dbSerie = await db;
    if (dbSerie != null) {
      return await dbSerie.update(Serie.serieTable, s.toMap(),
          where: "${Serie.idColumn} = ?", whereArgs: [s.id]);
    }
    return 0;
  }

  Future<List> getAll() async {
    Database? dbSerie = await db;
    if (dbSerie != null) {
      List listMap = await dbSerie.rawQuery("SELECT * FROM ${Serie.serieTable}");
      List<Serie> listSerie = [];
      for (Map m in listMap) {
        listSerie.add(Serie.fromMap(m));
      }
      return listSerie;
    }
    return [];
  }
}