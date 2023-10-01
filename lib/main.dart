import 'package:flutter/material.dart';

import 'Style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageUI();
  }
}

class HomePageUI extends State<HomePage> {

  Map<String, double> FormValue={
    'num1': 0,
    'num2': 0,
    'num3': 0,
  };
  double sum = 0;

  @override
  Widget build(BuildContext context) {

    MyInputOnChange(InputKey, InputValue){

      setState(() {
        FormValue.update(InputKey, (value) => double.parse(InputValue));
      });
    }

    AddAllNumber(){
      setState(() {
        sum = FormValue['num1']! + FormValue['num2']! + FormValue['num3']!;
      });

    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum App'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              sum.toString(),
              style: HeadTextStyle(),
            ),
            SizedBox(height: 20,),
            TextFormField(
              onChanged: (value){
                MyInputOnChange('num1',value);
              },
              decoration: AppInputStyle('First Number'),
            ),
            SizedBox(height: 20,),
            TextFormField(
              onChanged: (value){
                MyInputOnChange('num2',value);
              },
              decoration: AppInputStyle('Second Number'),
            ),
            SizedBox(height: 20,),
            TextFormField(
              onChanged: (value){
                MyInputOnChange('num3',value);
              },
              decoration: AppInputStyle('Third Number'),
            ),
            SizedBox(height: 20,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AddAllNumber();
                  },
                  style: AppButtonStyle(),
                  child: const Text('Add'),
                ))
          ],
        ),
      ),
    );
  }
}
