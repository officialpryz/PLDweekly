import 'dart:io';
// ignore: unused_import
import 'dart:convert';

void main() async {
  final utility = UtilityApp();
  await utility.run();
}

class UtilityApp {
  final List<Entry> entries = [];
  final String outputFile = 'output.txt';

  Future<void> run() async {
    print('Welcome to the Utility App!');
    
    while (true) {
      print('\nEnter a string (or "quit" to exit):');
      final input = stdin.readLineSync() ?? '';
      
      if (input.toLowerCase() == 'quit') break;
      
      final manipulatedString = manipulateString(input);
      final entry = Entry(manipulatedString, DateTime.now());
      entries.add(entry);
      
      print('\nManipulated string: $manipulatedString');
      print('String length: ${manipulatedString.length}');
      
      await saveToFile();
      displayCollections();
    }
    
    print('Thank you for using the Utility App!');
  }

  String manipulateString(String input) {
    final interpolated = 'Original: $input';
    final substring = input.length > 3 ? input.substring(0, 3) : input;
    final upperCase = input.toUpperCase();
    final lowerCase = input.toLowerCase();
    final reversed = input.split('').reversed.join();
    
    return '$interpolated | Substring: $substring | Upper: $upperCase | Lower: $lowerCase | Reversed: $reversed';
  }

  Future<void> saveToFile() async {
    try {
      final file = File(outputFile);
      final sink = file.openWrite(mode: FileMode.append);
      
      for (var entry in entries) {
        sink.writeln('${entry.timestamp.toIso8601String()} - ${entry.data}');
      }
      
      await sink.flush();
      await sink.close();
      print('Data saved to $outputFile');
    } catch (e) {
      print('Error writing to file: $e');
    }
  }

  void displayCollections() {
    // List
    print('\nList of entries:');
    for (var i = 0; i < entries.length; i++) {
      print('$i: ${entries[i].data}');
    }
    
    // Set
    final uniqueEntries = entries.map((e) => e.data).toSet();
    print('\nUnique entries (Set):');
    for (var entry in uniqueEntries) {
      print(entry);
    }
    
    // Map
    final entryMap = Map.fromEntries(
      entries.map((e) => MapEntry(e.timestamp.toIso8601String(), e.data))
    );
    print('\nEntry Map (timestamp : data):');
    entryMap.forEach((key, value) {
      print('$key : $value');
    });
    
    // Date operations
    if (entries.length >= 2) {
      final firstEntry = entries.first.timestamp;
      final lastEntry = entries.last.timestamp;
      final difference = lastEntry.difference(firstEntry);
      print('\nTime between first and last entry: ${difference.inSeconds} seconds');
    }
  }
}

class Entry {
  final String data;
  final DateTime timestamp;
  
  Entry(this.data, this.timestamp);
}