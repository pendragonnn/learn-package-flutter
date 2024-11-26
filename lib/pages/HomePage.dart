import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(
          child: Text("FAKER"),
        ),
      ),
      body: ListView.builder(
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
    );
  }
}
