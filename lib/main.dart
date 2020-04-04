import 'package:flutter/material.dart';
TextEditingController height = new TextEditingController();
TextEditingController weight = new TextEditingController();
void main() => runApp(
  MaterialApp(
    initialRoute: '/',
  routes: {
    '/': (context) => FirstScreen(),
    '/second': (context) => SecondScreen(),
  },
  title: 'BMI Calculator',
  theme: ThemeData(
    primaryColor: Colors.blue
  )
  )
);

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admiral AppBar'),
        ),
      body:Column(
        children: <Widget>[
          Align(
            child:Text("Enter Values", style: TextStyle(fontSize:28)),
            alignment: Alignment.bottomLeft,
          ),
          TextField(
            decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Enter your height [m]",
            labelStyle: TextStyle(
              color: Colors.blue
            )
            ),
            controller: height,
            keyboardType: TextInputType.number
          ),
          TextField(
            decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Enter your weight [kg]",
            labelStyle: TextStyle(
              color: Colors.blue
            )
            ),
            controller: weight,
            keyboardType: TextInputType.number
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            splashColor: Colors.blueAccent,
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text(
            "Flat Button",
            style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
        ),
      
    );
  }
}

class SecondScreen extends StatelessWidget {
  Widget _bmiResult() {
  
  var result = 0.0;

  if(height.text.isEmpty || weight.text.isEmpty) {
    return Container(
       child: Column(children: <Widget>[
         Text("ERROR", style:TextStyle(fontSize:90))
       ],  mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,),
       
       alignment: Alignment.center,
       height:300,
       width:300,
       decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red[900],)
  );
  } else if(weight.text.isNotEmpty && height.text.isNotEmpty){
    var heightN = double.parse(height.text);
    var weightN = double.parse(weight.text);
    result = weightN / (heightN * heightN);
  }
  if(result < 18.5) {
     return Container(
       child: Column(children: <Widget>[
         Text(result.toStringAsFixed(1), style:TextStyle(fontSize:90, fontWeight: FontWeight.bold)),
         Text("Underweight", style:TextStyle(fontSize:40))
       ],  mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,),
       
       alignment: Alignment.center,
       height:300,
       width:300,
       decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.lightBlue[300],)
  );
  } else if(result >= 18.5 && result <= 25) {
    return Container(
       child: Column(children: <Widget>[
         Text(result.toStringAsFixed(1), style:TextStyle(fontSize:90, fontWeight: FontWeight.bold)),
         Text("Optimal Weight", style:TextStyle(fontSize:40))
       ],  mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,),
       
       alignment: Alignment.center,
       height:300,
       width:300,
       decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green[600])
    );
  } else if(result > 25) {
    return Container(
       child: Column(children: <Widget>[
         Text(result.toStringAsFixed(1), style:TextStyle(fontSize:90, fontWeight: FontWeight.bold)),
         Text("Overweight", style:TextStyle(fontSize:40))
       ],  mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,),
       
       alignment: Alignment.center,
       height:300,
       width:300,
       decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange[600])
    );
  } 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admiral AppBar'),
        ),
      body:Center(
         child: _bmiResult()
        ),
      
    );
  }
}

