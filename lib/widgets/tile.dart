import 'package:flutter/material.dart';

class Tile extends StatelessWidget{
  
  late final nar;
  late final date;
  late final amount;
  late final isInc;  

  Tile({required this.nar,required this.date, required this.amount, required this.isInc});

  @override
  Widget build(BuildContext context){
    
    return ListTile(title: Text(this.nar),subtitle: Text("On ${this.date}"),trailing: Text("${this.amount}", style: TextStyle(color: this.isInc?Colors.green:Colors.red,fontSize: 24.0),));
  
  }
}