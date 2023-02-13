// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact-db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorContactDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ContactDatabaseBuilder databaseBuilder(String name) =>
      _$ContactDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ContactDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ContactDatabaseBuilder(null);
}

class _$ContactDatabaseBuilder {
  _$ContactDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ContactDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ContactDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ContactDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ContactDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ContactDatabase extends ContactDatabase {
  _$ContactDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ContactDAO? _contactDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `Contact` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `lastname` TEXT NOT NULL, `firstname` TEXT NOT NULL, `number` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ContactDAO get contactDao {
    return _contactDaoInstance ??= _$ContactDAO(database, changeListener);
  }
}

class _$ContactDAO extends ContactDAO {
  _$ContactDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _contactInsertionAdapter = InsertionAdapter(
            database,
            'Contact',
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'lastname': item.lastname,
                  'firstname': item.firstname,
                  'number': item.number
                }),
        _contactUpdateAdapter = UpdateAdapter(
            database,
            'Contact',
            ['id'],
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'lastname': item.lastname,
                  'firstname': item.firstname,
                  'number': item.number
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Contact> _contactInsertionAdapter;

  final UpdateAdapter<Contact> _contactUpdateAdapter;

  @override
  Future<List<Contact>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Contact',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int?,
            row['lastname'] as String,
            row['firstname'] as String,
            row['number'] as String));
  }

  @override
  Future<Contact?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM Contact WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int?,
            row['lastname'] as String,
            row['firstname'] as String,
            row['number'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteContact(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Contact WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> createContact(Contact contact) async {
    await _contactInsertionAdapter.insert(contact, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateContact(Contact contact) async {
    await _contactUpdateAdapter.update(contact, OnConflictStrategy.abort);
  }
}
