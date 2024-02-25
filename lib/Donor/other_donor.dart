import 'package:bluebeads/SuccessPage/success.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>(); //key for form
  String selectedBloodGroup = 'A+';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey, //key for form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              Text(
                "Find Donors ",
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),
              Text(
                "Near You !",
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration:
                    InputDecoration(label: Text('Enter the person name')),
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                    return "Enter correct name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(label: Text('Enter the age')),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(label: Text('Enter the location')),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration:
                    InputDecoration(label: Text('Enter the phone number')),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Blood Group', // Adding label
                  border: OutlineInputBorder(), // Customizing border
                ),
                value: selectedBloodGroup,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBloodGroup = newValue!;
                  });
                },
                items: <String>[
                  'A+',
                  'B+',
                  'AB+',
                  'O+',
                  'A-',
                  'B-',
                  'AB-',
                  'O-'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SuccessPage()),
          );
        },
        child: Icon(Icons.check), // Use the check icon
        // Set the background color
      ),
    );
  }
}
