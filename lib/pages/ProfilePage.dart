import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(
          child: Text("AVATAR GLOW"),
        ),
      ),
      body: Center(
        child: AvatarGlow(
            glowColor: Colors.red,
            duration: Duration(milliseconds: 500),
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                backgroundImage: NetworkImage("https://picsum.photos/200"),
                radius: 50,
              ),
            )),
      ),
    );
  }
}
