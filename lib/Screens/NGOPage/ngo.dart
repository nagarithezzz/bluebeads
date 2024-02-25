import 'package:bluebeads/Screens/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:bluebeads/model/lesson.dart';
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _currentIndex = 0;
  late List<Lesson> lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 230, 255, 1),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(241, 230, 255, 1),
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                          border: Border(
                            right:
                                BorderSide(width: 1.0, color: Colors.white24),
                          ),
                        ),
                        child: Icon(
                          Icons.group,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "BloodBank ${index + 1}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          lessons[index].level,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: Text(
                        "Chennai, TamilNadu",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Lesson> getLessons() {
  return [
    Lesson(
      title: "Introduction to Driving",
      level: "Beginner",
      indicatorValue: 0.33,
      price: 20,
      content:
          "Start by taking a couple of minutes to read the info , Start by taking a couple of minutes to read the info , Start by taking a couple of minutes to read the info , Start by taking a couple of minutes to read the info",
    ),
    Lesson(
      title: "Introduction to Driving 2",
      level: "Beginner",
      indicatorValue: 0.33,
      price: 2,
      content: "Start by taking a couple of minutes to read the info",
    ),
    Lesson(
      title: "Introduction to Driving 3",
      level: "Beginner",
      indicatorValue: 0.33,
      price: 50,
      content: "Start by taking a couple of minutes to read the info",
    ),
    Lesson(
      title: "Introduction to Driving 4",
      level: "Beginner",
      indicatorValue: 0.33,
      price: 20,
      content: "Start by taking a couple of minutes to read the info",
    ),
    Lesson(
      title: "Introduction to Driving 5",
      level: "Beginner",
      indicatorValue: 0.33,
      price: 20,
      content: "Start by taking a couple of minutes to read the info",
    ),
    Lesson(
      title: "Introduction to Driving 6",
      level: "Beginner",
      indicatorValue: 0.33,
      price: 20,
      content: "Start by taking a couple of minutes to read the info",
    ),
    Lesson(
      title: "Introduction to Driving 7",
      level: "Beginner",
      indicatorValue: 0.33,
      price: 20,
      content: "Start by taking a couple of minutes to read the info",
    ),
  ];
}
