
import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
   NotificationPage({Key? key}) : super(key: key);
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

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
            itemBuilder: (BuildContext context,int index)=>
                SizedBox(
                  height: 50,
                  child: ListTile(
                      leading: const Icon(Icons.notifications),
                      trailing: const Text("Bell",
                        style: TextStyle(
                            color: Colors.green,fontSize: 15),),
                      title:Text("List item $index")
                  ),
                )
        ),
      ),
    );
  }
}
