import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = new Faker();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage:
                NetworkImage("https://picsum.photos/id/${879 + index}/200/300"),
          ),
          // faker implementation
          title: Text(faker.person.name()),

          // intl implementation
          subtitle:
              Text("${DateFormat.yMMMMd().add_jms().format(DateTime.now())}"),
        ),
      ),
      Center(
        child: Text("MENU KE 2"),
      ),
      Center(
        child: Text("MENU KE 3"),
      ),
      Center(
        child: Text("MENU KE 4"),
      ),
      Center(
        child: Text("MENU KE 5"),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(
          child: Text("FAKER"),
        ),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        // backgroundColor: Colors.yellow[400],
        // height: 300,
        color: Colors.black,
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: currentIndex,
        onTap: (int i) => {
          setState(() {
            currentIndex = i;
          })
        },
      ),
    );
  }
}
