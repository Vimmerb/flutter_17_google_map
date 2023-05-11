import 'package:flutter/material.dart';
import 'package:flutter_17_maps_lesson/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LatLng> saveLocationsList = [
    //LatLng(50.45, 30.52),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locations list page"),
      ),
      body: ListView.builder(
        itemCount: saveLocationsList.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(
              '${saveLocationsList[index].latitude}, ${saveLocationsList[index].longitude}'),
        ),
      ),
      //////
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapPage()),
          );
          // arguments:
          // LatLng(0, 0);
          if (result != null && result is LatLng) {
            final coordinates = result;
            saveLocationsList.add(coordinates);
            setState(() {});
          }
        },
      ),
    );
  }
}
