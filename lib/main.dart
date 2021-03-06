import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devendra Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int num1;
  int num2;
  String texttodisplay = "";
  String result;
  String operator;

  void btnclicked(String btnValue){
    if(btnValue == "C"){
      texttodisplay = "";
      num1 = 0;
      num2 = 0;
      result = "";
    }
    else if(btnValue == "+" || btnValue == "-" || btnValue == "x" || btnValue == "/"){
      num1 = int.parse(texttodisplay);
      result = "";
      operator = btnValue;
    }
    else if(btnValue == "="){
      num2 = int.parse(texttodisplay);
      if(operator == "+"){
        result = (num1 + num2).toString();
      }
      if(operator == "-"){
        result = (num1 - num2).toString();
      }
      if(operator == "x"){
        result = (num1 * num2).toString();
      }
      if(operator == "/"){
        result = (num1 / num2).toString();
      }
    }
    else{
      result = int.parse(texttodisplay + btnValue).toString();
    }

    setState(() {
      texttodisplay = result;
    });

  }



  Widget custombutton(String btnValue){
    return Expanded(
      child:OutlineButton(
        padding: EdgeInsets.all(20.0),
        onPressed: ()=>btnclicked(btnValue),
        child: Text(
          "$btnValue",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Devendra Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
