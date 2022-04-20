import 'dart:io';

import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'db_data.dart';

class NikkiDatabaaseController {
  static const kDbFileName = 'ninni_file.db';
  static const kDbTableName = 'nikki_table';
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  late Database db;
  List<Nikki_dialy> items = [];

  // Opens a db local file. Creates the db table if it's not yet created.
  Future<void> initMoneyDb() async {
    final dbFolder = await getDatabasesPath();
    if (!await Directory(dbFolder).exists()) {
      await Directory(dbFolder).create(recursive: true);
    }
    final dbPath = join(dbFolder, kDbFileName);
    db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
        CREATE TABLE $kDbTableName(
          id INTEGER PRIMARY KEY, 
          points INTEGER,
          text TEXT,
          tab0 INTEGER,
          tab1 INTEGER,
          tab2 INTEGER,
          tab3 INTEGER,
          tab4 INTEGER,
          tab5 INTEGER,
          tab6 INTEGER,
          tab7 INTEGER,
          tab8 INTEGER,
          tab9 INTEGER,
          day INT)
        ''',
        );
      },
    );
  }

  // Retrieves rows from the db table.
  Future<void> getNikki_dialys() async {
    final List<Map<String, dynamic>> jsons =
    await db.rawQuery('SELECT * FROM $kDbTableName');
    items = jsons.map((json) => Nikki_dialy.fromJsonMap(json)).toList();
  }

  // Inserts records to the db table.
  // Note we don't need to explicitly set the primary key (id), it'll auto
  // increment.
  Future<void> addNikki_dialy(Nikki_dialy item) async {
    await db.transaction(
          (Transaction txn) async {
        await txn.rawInsert(
          '''
          INSERT INTO $kDbTableName
            (points, text, tab0, tab1, tab2, tab3, tab4, tab5, tab6, tab7, tab8, tab9, day)
          VALUES
            (
              "${item.points}",
              "${item.text}",
              "${item.tab0}",
              "${item.tab1}",
              "${item.tab2}",
              "${item.tab3}",
              "${item.tab4}",
              "${item.tab5}",
              "${item.tab6}",
              "${item.tab7}",
              "${item.tab8}",
              "${item.tab9}", 
              ${item.day.millisecondsSinceEpoch}
            )''',
        );
      },
    );
  }



  // Deletes records in the db table.
  Future<void> deleteNikki_dialy(Nikki_dialy item) async {
    await db.rawDelete(
      '''
        DELETE FROM $kDbTableName
        WHERE id = ${item.id}
      ''',
    );
  }




  asyncInit() async {
    // Avoid this function to be called multiple times,
    // cf. https://medium.com/saugo360/flutter-my-futurebuilder-keeps-firing-6e774830bc2
    await _memoizer.runOnce(() async {
      await initMoneyDb();
      await getNikki_dialys();
    });
  }

  Future<void> deleteAll() async {
    await db.rawDelete(
      '''
        DELETE FROM $kDbTableName
      ''',
    );
  }
}