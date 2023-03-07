import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'colors.dart';

class Calaculator extends StatefulWidget {
  const Calaculator({Key? key}) : super(key: key);

  @override
  State<Calaculator> createState() => _CalaculatorState();
}

class _CalaculatorState extends State<Calaculator> {
// variable
  double firstNum =0.0;
  double secondNum=0.0;
  var input ='';
  var output ='';
  var operation ='';
  var hideinput = false;
  var outputsize =34.0;

  onButtonClick(value){
    if(value == "Ac"){
      input ='';
      output='';
    }
    else if(value == "<"){
        if(input.isNotEmpty){
          input =input.substring(0,input.length-1);
        }
    }
    else if(value == "="){
      if(input.isNotEmpty){
        var userinput= input;
        userinput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression =p.parse(userinput);
        ContextModel cm =ContextModel();
        var finalvalue =expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if(output.endsWith(".0")){
          output =output.substring(0,output.length-2);
        }
        input =output;
        hideinput =true;
        outputsize =52;
      }


      }else{
      input =input+value;
      hideinput =false;
      outputsize =34;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children:  [
          Expanded(child: 
          Container(
            width: double.infinity,
            // color: Colors.red,
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hideinput?"":input,style: TextStyle(
                  fontSize: 48,
                  color: Colors.white
                ),
                ),
                SizedBox(height: 25,),
                Text(output,style: TextStyle(
                    fontSize: outputsize,
                    color: Colors.white.withOpacity(0.7)
                ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
          ),
          
          
          
          
          Row(
            children: [
              button(text: 'Ac',buttonbgcolor: operatorColor,tcolor: orangeColor),
              button(text: '<',buttonbgcolor: operatorColor,tcolor: orangeColor),
              button(text: "",buttonbgcolor: Colors.transparent),
              button(text: '/',buttonbgcolor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: '7',),
              button(text: '8',),
              button(text: "9",),
              button(text: '*',buttonbgcolor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5',),
              button(text: "6",),
              button(text: '-',buttonbgcolor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: '1',),
              button(text: '2',),
              button(text: "3",),
              button(text: '+',buttonbgcolor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: '%',buttonbgcolor: operatorColor),
              button(text: '0',),
              button(text: ".",buttonbgcolor: operatorColor),
              button(text: '=',buttonbgcolor: operatorColor,tcolor: orangeColor),
            ],
          ),
        ],
      ),
    );
  }
  Widget button({ text,tcolor= Colors.white,buttonbgcolor=buttonColor}){
      return Expanded(child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),

            ),
            padding: EdgeInsets.all(22),
            primary: buttonbgcolor,
          ),
            onPressed: (){
            onButtonClick(text);
            },
            child: Text(text,style: TextStyle(
                fontSize: 25,
                color: tcolor,
                fontWeight: FontWeight.bold
            ),
            ),
          )
      ),
      );
  }
}
