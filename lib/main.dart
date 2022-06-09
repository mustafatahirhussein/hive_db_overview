import 'package:flutter/material.dart';
import 'package:hive_demo/Model/books.dart';
import 'package:hive_demo/Screens/my_books.dart';
import 'package:hive_flutter/adapters.dart';

Box? box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox<Books>("booksbox");
  Hive.registerAdapter(BooksAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hive Demo",
      home: MyBooks(),
    );
  }
}
