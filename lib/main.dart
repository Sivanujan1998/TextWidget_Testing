import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Widget Testing'),

      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _text;
  final textcont = new TextEditingController();
  void posttext() {
    setState(() {
      if (textcont.text == null) {
        
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Value Can\'t Be Empty"),
            duration: Duration(seconds: 2),  
        ));
        
      } else {
        _text = textcont.text;
        textcont.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: textcont,
                decoration: InputDecoration(hintText: "Enter the text here"),
              ),
              RaisedButton(
                onPressed: posttext,
                child: Text("Submit"),
              ),
              Text(
                '\nYour Text is: ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              Text(
                '$_text',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 26),
              )
            ],
          ),
        ),
      ),
    );
  }
}
