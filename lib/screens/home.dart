import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class Home extends StatefulWidget{

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final box = Hive.box("manager");
  final control1 = TextEditingController();
  final control2 = TextEditingController();
  var isIncome = false;

  void save() async{
    if(control1.text != "" && control2.text!=""){
    await box.put(formatDate(DateTime.now(), [dd, '.', mm, '.', yy, ' ', HH, ':', nn, ':', ss]), {"nar":control1.text,"isInc":isIncome,"amount":int.parse(control2.text)});
    Fluttertoast.showToast(msg: "Added Successfully!");
    control1.text="";
    control2.text="";
    setState(() {
      isIncome = false;
    });
    }
    else{
      Fluttertoast.showToast(msg: "Input Not Valid");
    }
  }

@override
Widget build(BuildContext context){
  return Center(child: Card(
    margin: const EdgeInsets.all(16.0),
    
    child: Container(
      height: MediaQuery.of(context).size.height/3,
      margin: const EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextField(controller: control1, decoration: const InputDecoration(labelText: "Enter The Narration"),),
        TextField(controller: control2, decoration: const InputDecoration(labelText: "Enter The Amount"),keyboardType: TextInputType.number,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Expense"),
            Switch(value: isIncome, onChanged:((value) =>  setState(() {isIncome=!isIncome;}))),
            Text("Income")
          ],
        ),
        ElevatedButton(onPressed: (){save();}, child: const Text("Add Entry")),
      ],),
    ),
  ));
}
}