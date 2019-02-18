import 'dart:io';
import "package:flutter/material.dart";
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class Dropdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DropdownState();
  }
}

class DropdownState extends State<Dropdown> {
  List<String> _passengers = ["", "1", "2", "3", "4", "5"];
  String _passenger;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown and Picker"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:ListView(
          children: <Widget>[
            _image == null ? Text("No image selected") : Image.file(_image),
            InputDecorator(
              decoration: InputDecoration(
                  icon: Icon(Icons.person), labelText: "Passenger"),
              isEmpty: _passenger == "",
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _passenger,
                  isDense: true,
                  onChanged: (String value) {
                    setState(() {
                      _passenger = value;
                    });
                  },
                  items: _passengers.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            DateTimePickerFormField(
              inputType: InputType.time,
              format: DateFormat("HH:mm"),
              editable: false,
              decoration: InputDecoration(
                  icon: Icon(Icons.date_range), labelText: "Date"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: getImage,
      ),
    );
  }
}
