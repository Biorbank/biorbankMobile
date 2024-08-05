import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// void main() async {
//   // Avoid errors caused by flutter upgrade.
//   // Importing 'package:flutter/widgets.dart' is required.

//   // Create a Account and add it to the Accounts table
//   var fido = Account(
//     id: 0,
//     name: 'Fido',
//     mnemonic: 35,
//   );

//   await insertAccount(fido);

//   // Now, use the method above to retrieve all the Accounts.
//   print(await Accounts()); // Prints a list that include Fido.

//   // Update Fido's mnemonic and save it to the database.
//   fido = Account(
//     id: fido.id,
//     name: fido.name,
//     mnemonic: fido.mnemonic + 7,
//   );
//   await updateAccount(fido);

//   // Print the updated results.
//   print(await Accounts()); // Prints Fido with mnemonic 42.

//   // Delete Fido from the database.
//   await deleteAccount(fido.id);

//   // Print the list of Accounts (empty).
//   print(await Accounts());
// }

late final database;

Future<void> setupDatabase() async {
  database = openDatabase(
    join(await getDatabasesPath(), 'biorbank.db'),
    // When the database is first created, create a table to store Accounts.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE accounts(id INTEGER PRIMARY KEY, name TEXT, mnemonic TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
}

class Account {
  final int id;
  final String name;
  final String mnemonic;

  Account({
    required this.id,
    required this.name,
    required this.mnemonic,
  });

  // Convert a Account into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'mnemonic': mnemonic,
    };
  }

  // Implement toString to make it easier to see information about
  // each Account when using the print statement.
  @override
  String toString() {
    return 'Account{id: $id, name: $name, mnemonic: $mnemonic}';
  }
}

class BiorbankAccounts {
// Define a function that inserts Accounts into the database
  static Future<void> insertAccount(Account account) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Account into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same Account is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'accounts',
      account.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// A method that retrieves all the Accounts from the Accounts table.
  static Future<List<Account>> accounts() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all the Accounts.
    final List<Map<String, Object?>> accountsMaps = await db.query('accounts');

    // Convert the list of each Account's fields into a list of `Account` objects.
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'mnemonic': mnemonic as String
          } in accountsMaps)
        Account(id: id, name: name, mnemonic: mnemonic),
    ];
  }

  static Future<void> updateAccount(Account account) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Account.
    await db.update(
      'accounts',
      account.toMap(),
      // Ensure that the Account has a matching id.
      where: 'id = ?',
      // Pass the Account's id as a whereArg to prevent SQL injection.
      whereArgs: [account.id],
    );
  }

  static Future<void> deleteAccount(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Account from the database.
    await db.delete(
      'accounts',
      // Use a `where` clause to delete a specific Account.
      where: 'id = ?',
      // Pass the Account's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
