import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 DateTime selectetDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time"),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${selectetDate.year}-${selectetDate.month}-${selectetDate.day}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: ()async{
final DateTime?dateTime=await showDatePicker(context: context,
    initialDate: selectetDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(3000));
if(dateTime!=null){
  setState(() {
    selectetDate=dateTime;
  });
}
            }, child: Text("Choose Date"))
          ],
        ),
      ),
    );
  }
}
