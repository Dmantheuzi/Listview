import 'package:flutter/material.dart';

void main()  {

  runApp(
    MaterialApp(
      title: 'Simple Interest Calculator',
      debugShowCheckedModeBanner: false,
      home: SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen,
        accentColor:  Colors.red
        

      ),

    )
  );
}

class SIForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {

  var _currencies = ['Eeuros', 'Dollars', 'Naira'];
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Simple Interest Calculator'),
      ),

      body: Container(
        child: ListView(
          children: <Widget>[

            getImageAsset(),

            Padding(
              padding:  EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
              keyboardType: TextInputType.number,
              style: textStyle,
              decoration: InputDecoration(
                labelText: 'Principal',
                hintText:  'Enter Principal eg 2000',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
            )),

            Padding(
              padding:  EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
              keyboardType: TextInputType.number,
              style: textStyle,
              decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  hintText:  'In Percent',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            )),

            Padding(
              padding:  EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
              children: <Widget>[

                Expanded(child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Term',
                      hintText:  'Time in years',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                )),

                Container(width: _minimumPadding * 5,),

                Expanded(child: DropdownButton<String>(
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),

                  value: 'Eeuros',

                  onChanged: (String newValueSelected) {

                  },
                ))

              ],
            )),

            Padding(
              padding:  EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColorDark,
                  child: Text('Calculate', textScaleFactor: 1.5,),
                  onPressed: () {

                  }
                ),
              ),

              
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColorLight,
                  child: Text('Reset', textScaleFactor: 1.5,),
                  onPressed: () {

                  }
                ),
              ),

            ],)),

            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text('Calculator', style: textStyle,),
            ) 

        ],
      ),
    ),
  );
 }

  Widget getImageAsset() {

    
    var assetsImage = new AssetImage('assets/dollar.png');
    var image = new Image(image: assetsImage, width: 125.0, height: 125.0,);
    return new Container(child:  image, margin: EdgeInsets.all(_minimumPadding * 10),);

    
  }
}
