import 'package:bluebeads/Donor/other_donor.dart';
import 'package:bluebeads/Profile/profile.dart';
import 'package:bluebeads/Screens/Dashboard/dashboard.dart';
import 'package:bluebeads/Screens/NGOPage/ngo.dart';
import 'package:bluebeads/SuccessPage/success.dart';
import 'package:bluebeads/constants.dart';
import 'package:flutter/material.dart';

class NGOFind extends StatefulWidget {
  const NGOFind({Key? key}) : super(key: key);

  @override
  State<NGOFind> createState() => _NGOFindState();
}

class _NGOFindState extends State<NGOFind> with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  int _currentIndex = 0; // Default index for Profile
  String _greeting = '';

  @override
  void initState() {
    _setGreeting();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  void _setGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (hour < 17) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else {
      setState(() {
        _greeting = 'Good Evening';
      });
    }
  }

  String? _selectedCountry;
  String? _selectedState;
  String? _selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Shivam Kumar Thakur!',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text(_greeting,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white54)),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/shivam.jpeg'),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildCircleWithText(
                    '9',
                    'Registered NGOs',
                    Colors.orange,
                    const EdgeInsets.only(right: 10.0),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildCircleWithText(
                    '10k+',
                    'Donors',
                    Colors.orange,
                    const EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildCircleWithText(
                    '5000',
                    'Donated Users',
                    Colors.orange,
                    const EdgeInsets.only(left: 10.0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: dblue, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Search NGOs',
                      style: TextStyle(
                        color: dblue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select Country',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedCountry,
                      items: <String>['Country 1', 'Country 2', 'Country 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountry = newValue;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select State',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedState,
                      items: <String>['State 1', 'State 2', 'State 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedState = newValue;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select City',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedCity,
                      items: <String>['City 1', 'City 2', 'City 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCity = newValue;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle search button press
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(5), // Adjusted padding here
                        ),
                        child: Text(
                          'Search NGOs',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30), // Increased space between the cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: dblue, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Search Camps',
                      style: TextStyle(
                        color: dblue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select Country',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedCountry,
                      items: <String>['Country 1', 'Country 2', 'Country 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountry = newValue;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select State',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedState,
                      items: <String>['State 1', 'State 2', 'State 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedState = newValue;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select City',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedCity,
                      items: <String>['City 1', 'City 2', 'City 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCity = newValue;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle search button press
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(5), // Adjusted padding here
                        ),
                        child: Text(
                          'Search Camps',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleWithText(
    String number,
    String text,
    Color color,
    EdgeInsets margin,
  ) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 3), // Outer orange border
              color: Colors.white, // Inner white color
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color is black
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.black, // Text color is black
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
