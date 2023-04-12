import 'package:flutter/material.dart';

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home>
{
  final TextEditingController _usercontroller = TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";



   void handleRadioValueChanged(rohan)
  {
    setState(() {
      radioValue = rohan;
      switch(radioValue)
      {
        case 0: _finalResult = calculate(_usercontroller.text , 0.06);
                _formattedText = "Your weight on PLUTO is ${_finalResult.toStringAsFixed(1)} kg";
                break;
        case 1:  _finalResult = calculate(_usercontroller.text , 0.38);
                 _formattedText = "Your weight on MARS is ${_finalResult.toStringAsFixed(1)} kg";
                break;
        case 2: _finalResult = calculate(_usercontroller.text , 0.91);
                 _formattedText = "Your weight on VENUS is ${_finalResult.toStringAsFixed(1)} kg";
                 break;
      }

    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),

      body: Container(
        color: Colors.blueGrey.shade300,
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(2.5),
          children: [

            Image.asset('images/planet.png',
            height: 230.0,
            width:  250.0,
            ),

            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: _usercontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Your Weight on Earth",
                       hintText: "in kg",
                      icon: Icon(Icons.person, color: Colors.black,),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(5.0)),
                  // three radio button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // radio button
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged ),
                      Text("Pluto",
                      style: TextStyle(color: Colors.black),),

                      Radio<int>(
                          activeColor: Colors.redAccent,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      Text("Mars",
                        style: TextStyle(color: Colors.black),),

                      Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      Text("Venus",
                        style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  
                  Padding(padding: EdgeInsets.all(10.6)),

                  // result Text
                  Text(
                    _usercontroller.text.isEmpty ? "please Enter Your Weight": _formattedText ,
                    // "$_formattedText",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),






                ],
              ),
            ),


          ],
        ),
      ),
    );
    
  }

  double calculate(String weight, double gravity)
  {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0)
      {
        return (int.parse(weight) * gravity);
      }
    else
      {
        print("wrong !!!!");

        return (int.parse("180") * 0.03);
      }
  }
  
}