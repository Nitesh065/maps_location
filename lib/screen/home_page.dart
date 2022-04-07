import 'package:flutter/material.dart';
import 'package:maps_location/screen/map_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps Location"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            setState(() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=> MapScreen()));
            });
          },
          child: Text("Show Map"),
        ),
      ),
    );
  }
}


