// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UsuarioDao? _usuarioDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UsuarioModel` (`matricula` TEXT NOT NULL, `nome` TEXT NOT NULL, `foto` TEXT, PRIMARY KEY (`matricula`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UsuarioDao get usuarioDao {
    return _usuarioDaoInstance ??= _$UsuarioDao(database, changeListener);
  }
}

class _$UsuarioDao extends UsuarioDao {
  _$UsuarioDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _usuarioModelInsertionAdapter = InsertionAdapter(
            database,
            'UsuarioModel',
            (UsuarioModel item) => <String, Object?>{
                  'matricula': item.matricula,
                  'nome': item.nome,
                  'foto': item.foto
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UsuarioModel> _usuarioModelInsertionAdapter;

  @override
  Future<UsuarioModel?> first() async {
    return _queryAdapter.query('SELECT * FROM Usuario LIMIT 1',
        mapper: (Map<String, Object?> row) => UsuarioModel(
            nome: row['nome'] as String,
            matricula: row['matricula'] as String,
            foto: row['foto'] as String?));
  }

  @override
  Future<List<UsuarioModel>> all() async {
    return _queryAdapter.queryList('SELECT * FROM Usuario',
        mapper: (Map<String, Object?> row) => UsuarioModel(
            nome: row['nome'] as String,
            matricula: row['matricula'] as String,
            foto: row['foto'] as String?));
  }

  @override
  Stream<UsuarioModel?> find(int matricula) {
    return _queryAdapter.queryStream(
        'SELECT * FROM Usuario WHERE matricula = ?1',
        mapper: (Map<String, Object?> row) => UsuarioModel(
            nome: row['nome'] as String,
            matricula: row['matricula'] as String,
            foto: row['foto'] as String?),
        arguments: [matricula],
        queryableName: 'UsuarioModel',
        isView: false);
  }

  @override
  Future<void> insertUsuario(UsuarioModel usuario) async {
    await _usuarioModelInsertionAdapter.insert(
        usuario, OnConflictStrategy.abort);
  }
}
