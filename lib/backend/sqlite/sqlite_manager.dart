import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'infectocastdb',
      'infectocastdb.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<ListaCategoriasRow>> listaCategorias() => performListaCategorias(
        _database,
      );

  Future<List<ListaSubcategoriasRow>> listaSubcategorias({
    int? idCategory,
  }) =>
      performListaSubcategorias(
        _database,
        idCategory: idCategory,
      );

  Future<List<ListaTopicosRow>> listaTopicos({
    int? idSubCategoria,
  }) =>
      performListaTopicos(
        _database,
        idSubCategoria: idSubCategoria,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  /// END UPDATE QUERY CALLS
}
