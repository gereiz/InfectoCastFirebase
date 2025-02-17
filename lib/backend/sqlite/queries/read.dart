import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN LISTA CATEGORIAS
Future<List<ListaCategoriasRow>> performListaCategorias(
  Database database,
) {
  final query = '''
select * from categories
''';
  return _readQuery(database, query, (d) => ListaCategoriasRow(d));
}

class ListaCategoriasRow extends SqliteRow {
  ListaCategoriasRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get title => data['title'] as String;
  String get icon => data['icon'] as String;
  int? get createdAt => data['created_at'] as int?;
  int? get updatedAt => data['updated_at'] as int?;
  int get idUser => data['id_user'] as int;
}

/// END LISTA CATEGORIAS

/// BEGIN LISTA SUBCATEGORIAS
Future<List<ListaSubcategoriasRow>> performListaSubcategorias(
  Database database, {
  int? idCategory,
}) {
  final query = '''
select * from subcategories where id_category = ${idCategory}
''';
  return _readQuery(database, query, (d) => ListaSubcategoriasRow(d));
}

class ListaSubcategoriasRow extends SqliteRow {
  ListaSubcategoriasRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get title => data['title'] as String;
  int get idCategory => data['id_category'] as int;
  int get createdAt => data['created_at'] as int;
  int get updatedAt => data['updated_at'] as int;
  int get idUser => data['id_user'] as int;
}

/// END LISTA SUBCATEGORIAS

/// BEGIN LISTA TOPICOS
Future<List<ListaTopicosRow>> performListaTopicos(
  Database database, {
  int? idSubCategoria,
}) {
  final query = '''
select * from topics where id_subcategory = ${idSubCategoria}
''';
  return _readQuery(database, query, (d) => ListaTopicosRow(d));
}

class ListaTopicosRow extends SqliteRow {
  ListaTopicosRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get title => data['title'] as String;
  String get content => data['content'] as String;
  String get idSubcategory => data['id_subcategory'] as String;
  int get createdAt => data['created_at'] as int;
  int get updatedAt => data['updated_at'] as int;
  String get idUser => data['id_user'] as String;
  int get free => data['Free'] as int;
  int get gold => data['Gold'] as int;
  int get premium => data['Premium'] as int;
}

/// END LISTA TOPICOS
