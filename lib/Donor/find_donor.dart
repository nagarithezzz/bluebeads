import 'package:bluebeads/Donor/other_donor.dart';
import 'package:bluebeads/SuccessPage/success.dart';
import 'package:bluebeads/constants.dart';
import 'package:flutter/material.dart';

class Donor extends StatelessWidget {
  const Donor({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.deepOrange, backgroundColor: bgcolor),
      home: const DonorScreen(),
    );
  }
}

class DonorScreen extends StatefulWidget {
  const DonorScreen({Key? key}) : super(key: key);

  @override
  _DonorScreenState createState() => _DonorScreenState();
}

class _DonorScreenState extends State<DonorScreen> {
  String? selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              ItemProfile('Myself', selectedProfile == 'Myself', onSelect: () {
                setState(() {
                  selectedProfile = 'Myself';
                });
              }),
              const SizedBox(height: 100),
              ItemProfile('Others', selectedProfile == 'Others', onSelect: () {
                setState(() {
                  selectedProfile = 'Others';
                });
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: selectedProfile != null
          ? FloatingActionButton(
              onPressed: () {
                if (selectedProfile == 'Myself') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessPage()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyForm()),
                  );
                }
              },
              child: Icon(Icons.check),
            )
          : null,
    );
  }
}

class ItemProfile extends StatelessWidget {
  final String subtitle;
  final bool isSelected;
  final VoidCallback onSelect;

  const ItemProfile(this.subtitle, this.isSelected,
      {required this.onSelect, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? kButton1Color : kButtonColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ]
              : null,
        ),
        child: ListTile(
          title: Center(child: Text(subtitle)),
          tileColor: Colors.white,
        ),
      ),
    );
  }
}
