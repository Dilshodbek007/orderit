
import 'package:flutter/material.dart';


class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);
  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: 35,
            itemBuilder: (BuildContext context,int index)=>
                SizedBox(
                  height: 50,
                  child: ListTile(
                      leading: const Icon(Icons.person),
                      trailing: const Text("Account",
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
