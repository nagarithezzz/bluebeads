import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/services.dart';

// Import your pages here
import 'package:bluebeads/Donor/other_donor.dart';
import 'package:bluebeads/FindNGO/ngo_find.dart';
import 'package:bluebeads/Profile/profile.dart';
import 'package:bluebeads/Screens/NGOPage/ngo.dart';
import 'package:bluebeads/SuccessPage/success.dart';
import 'package:bluebeads/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: bgcolor,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  int _currentIndex = 0; // Default index for Profile
  String _greeting = '';

  @override
  void initState() {
    super.initState();
    _setGreeting();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPage(_currentIndex),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_hospital),
                  label: 'Blood Banks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'NGO',
                ),
              ],
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(size: 28),
              unselectedIconTheme: const IconThemeData(size: 24),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            title: "Myself",
            iconColor: Colors.white,
            bubbleColor: Colors.purple,
            icon: Icons.people,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController!.reverse();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SuccessPage()),
              );
            },
          ),
          Bubble(
            title: "Others",
            iconColor: Colors.white,
            bubbleColor: Colors.purple,
            icon: Icons.group,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController!.reverse();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyForm()),
              );
            },
          ),
        ],
        onPress: () => _animationController!.isCompleted
            ? _animationController!.reverse()
            : _animationController!.forward(),
        backGroundColor: Colors.purple,
        iconColor: Colors.white,
        iconData: Icons.find_in_page,
        animation: _animation!,
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _buildProfilePage();
      case 1:
        return _buildBloodBanksPage();
      case 2:
        return _buildNGOPage();
      default:
        return _buildProfilePage();
    }
  }

  Widget _buildProfilePage() {
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
                    '12345',
                    'Volunteered',
                    Colors.orange,
                    const EdgeInsets.only(right: 10.0),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildCircleWithText(
                    '67890',
                    'Donated',
                    Colors.orange,
                    const EdgeInsets.only(left: 10.0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 4, // Add elevation to the main card view
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildHorizontalCardView("Nearby NGOs", 2),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 4, // Add elevation to the main card view
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildHorizontalCardView("Nearby Blood Banks", 3),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNGOPage() {
    return Scaffold(
      body: NGOFind(),
    );
  }

  Widget _buildBloodBanksPage() {
    return Scaffold(
      body: ListPage(title: 'Nearby Blood Banks'),
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
              border: Border.all(color: color, width: 3),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCardView(String title, int itemCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 185,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (title == "Nearby Blood Banks")
                return _buildBloodBanksSmallCardView(index);
              else
                return _buildSmallCardView(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSmallCardView(int index) {
    List<Map<String, String>> data = [
      {
        "name": "Name : Drishti Foundation Trust",
        "location": "Location : Kelambakkam, Chennai - 600127",
        "contact": "Contact : +91 93019 38391",
      },
      {
        "name": "Name : Kritagyata Trust",
        "location": "Location : Vandalur, Chennai ",
        "contact": "Contact : +91 93013 34391",
      },
    ];

    final itemData = data[index];

    return Container(
      width: 160,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemData['name']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(itemData['location']!),
          Text(itemData['contact']!),
        ],
      ),
    );
  }

  Widget _buildBloodBanksSmallCardView(int index) {
    List<Map<String, String>> data = [
      {
        "name": "Name : Athma Blood Centre (ABC) - Blood Bank ",
        "location": "Location : Chennai, Tamil Nadu, INDIA 600044",
        "contact": "Contact :  095661 54918",
      },
      {
        "name": "Name : MIOT Hospitals Blood Bank ",
        "location": "Location : Chennai, Tamil Nadu, INDIA 600089",
        "contact": "Contact :  044 2249 2288",
      },
      {
        "name": "Name : ANNAI TERESA BLOOD BANK ",
        "location": "Location : Chennai, Tamil Nadu, INDIA 600091",
        "contact": "Contact :  044 2258 0803",
      },
    ];

    final itemData = data[index];

    return Container(
      width: 160,
      height: 230,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemData['name'] ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(itemData['location'] ?? ''),
          Text(itemData['contact'] ?? ''),
        ],
      ),
    );
  }
}
