import 'package:expense_tracker/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class EntryScreen extends StatefulWidget{

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  final box = Hive.box("manager");

  @override
  Widget build(BuildContext context){
    return ListView(children: box.keys.map((e){ return Tile(date: e,nar: box.get(e)["nar"],amount: box.get(e)["amount"],isInc: box.get(e)["isInc"],);}).toList());}
}
