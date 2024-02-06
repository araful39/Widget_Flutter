import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Time"),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: ()async{
final DateTime?dateTime=await showDatePicker(context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(3000));
if(dateTime!=null){
  setState(() {
    selectedDate=dateTime;
  });
}
            }, child: const Text("Choose Date"))
          ],
        ),
      ),
    );
  }
}
