import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Menu extends StatefulWidget{


  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  
  final box = Hive.box("manager");
  num totalInc=0;
  num totalExp=0;

  @override
  void initState() {
  box.values.forEach((e) {
    e["isInc"] ? totalInc+=e["amount"] : totalExp+=e["amount"];
  });
  super.initState();
  }

  void clear(){
    box.deleteAll(box.keys);
    setState(() {
      totalInc=0;
      totalExp=0;
    });
  }

  
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Total Income Till Date: ${this.totalInc}",style: TextStyle(color: Colors.green,fontSize: 24.0),),
          Text("Total Expenses Till Date: ${this.totalExp}",style: TextStyle(color: Colors.red,fontSize: 24.0),),
          Text("Total Cash In Hand: ${this.totalInc-this.totalExp}",style: TextStyle(color: Colors.purple,fontSize: 24.0)),
          ElevatedButton(onPressed: (){clear();}, child: Text("Clear All Entries")),
          Card(child: Container(margin: EdgeInsets.all(50.0),child: Text("App Developed By Nitin Garg",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.purple),)),shadowColor: Colors.purple,)
        ],
      ),
    );
  }
}