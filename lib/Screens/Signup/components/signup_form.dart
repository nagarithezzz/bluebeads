import 'package:bluebeads/Screens/Dashboard/dashboard.dart';
import 'package:bluebeads/Screens/OTP/otp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Login/login_screen.dart';
import '../../OTP/otp.dart';
import 'package:geocoding/geocoding.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String location = 'Loading...';
  bool locationPermissionDenied = false;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    var status = await Permission.location.request();
    print("Status : ");
    print(status.isGranted);
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark placemark = placemarks[0];
        setState(() {
          location =
              '${placemark.locality},${placemark.postalCode}, ${placemark.administrativeArea}';
        });
        print(location);
      } catch (e) {
        print('Error fetching location: $e');
        setState(() {
          location = 'Unable to fetch location';
        });
      }
    } else {
      print('Location permission denied');
      setState(() {
        locationPermissionDenied = true;
        _getLocation();
      });
    }
  }

  void _signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Otp();
        },
      ),
    );
    // if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
    //   Fluttertoast.showToast(
    //       msg: "Please fill all fields",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // } else {

    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: dblue,
            onSaved: (name) {},
            decoration: const InputDecoration(
              hintText: "Your Name",
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: TextFormField(
              controller: phoneController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              keyboardType: TextInputType.number,
              cursorColor: dblue,
              decoration: const InputDecoration(
                hintText: "Your Phone Number",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.phone),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: dblue,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          // Dropdown for blood groups
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Select Blood Group',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.local_hospital),
                ),
              ),
              items: <String>['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // Handle blood group selection here
              },
            ),
          ),
          SizedBox(height: defaultPadding), // Add spacing here
          ElevatedButton(
            onPressed: () {
              // Check if location is still loading or permission was denied
              if (location == 'Loading...' || locationPermissionDenied) {
                _getLocation();
              } else {
                _signUp();
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kButtonColor),
            ),
            child: Text("Sign Up".toUpperCase()),
          ),
          SizedBox(height: defaultPadding * 2), // Increased spacing
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
