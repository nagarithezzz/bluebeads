import 'package:bluebeads/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme:
          ThemeData(primarySwatch: Colors.deepOrange, backgroundColor: bgcolor),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/shivam.jpeg'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', 'Shivam Kumar Thakur', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', '+91 99999 99999', CupertinoIcons.phone),
              const SizedBox(height: 10),
              itemProfile(
                  'Address',
                  'VIT CHENNAI, Chennai - 600127, Tamil Nadu, INDIA ',
                  CupertinoIcons.location),
              const SizedBox(height: 10),
              itemProfile('Email', 'shivam1213@gmail.com', CupertinoIcons.mail),
              const SizedBox(height: 10),
              itemProfile('Blood Group', 'O+', CupertinoIcons.drop),
              const SizedBox(height: 10),
              itemProfile('Gender', 'Male', CupertinoIcons.flag),
              const SizedBox(height: 10),
              itemProfile('Age', '20', CupertinoIcons.calendar),
              const SizedBox(height: 10),
              itemProfile('Location', 'Chennai', CupertinoIcons.location),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Edit Profile')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Color.fromRGBO(241, 230, 255, 2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}
