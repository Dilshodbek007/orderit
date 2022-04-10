import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
   const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                      leading: const Icon(Icons.search),
                      trailing: const Text(
                        "Search",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("List item $index")),
                )),
      ),
    );
  }
}
