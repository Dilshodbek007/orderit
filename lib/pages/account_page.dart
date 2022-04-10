
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
