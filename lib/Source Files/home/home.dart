import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) => SizedBox(
              height: 50,
              child: ListTile(
                  leading: const Icon(Icons.home),
                  trailing: const Text(
                    "Home",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("List item $index")),
            )),
      ),
    );
  }

  BoxDecoration buttonBackDecoration() {
    return BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue,
              Color(0xFF42A5F5),
              Color(0xFF2995FB),
              Color(0xFF1E88E5),
              Color(0xFF1E88E5)
            ]),
        borderRadius: BorderRadius.circular(14));
  }

  Widget buttonIcon(IconData icon, double size) {
    return Container(
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: Colors.white,
        size: size,
      ),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: const Color(0xFF64B5F6),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}

