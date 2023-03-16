import 'package:expense_tracker/screens/entries.dart';
import 'package:expense_tracker/screens/home.dart';
import 'package:expense_tracker/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("manager");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _myAppState();
}

class _myAppState extends State<MyApp> {
  var screens = [Home(),EntryScreen(),Menu()];
  var index = 0;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: const Text("Expense Tracker"),centerTitle: true,),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() {
            index = value;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.money),label:"Entries"),
            BottomNavigationBarItem(icon: Icon(Icons.menu),label:"Menu")
          ]),
        body: screens[index],
      ),);
  }
}