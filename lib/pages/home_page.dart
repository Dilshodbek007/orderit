import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

// Container(
// color: Colors.white,
// padding: const EdgeInsets.all(20),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// //button 1
// GestureDetector(
// onTap: ()=>debugPrint('pressed'),
// child: Container(
// height: 65,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// alignment: Alignment.center,
// width: 180,
// child: ListTile(
// title: const Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
// leading: buttonIcon(Icons.shopping_bag_rounded,22)
// ),
// ),
//
// const Padding(
// padding:  EdgeInsets.symmetric(vertical: 12),
// child:  VerticalDivider(color: Colors.grey,width: 1,thickness: 1.5,),
// ),
// Container(
// padding: const EdgeInsets.only(right: 20),
// child: Row(
// children: [
// Container(height:17,child:const Text('\$',style: TextStyle(color: Colors.white60,fontSize: 12),),alignment: Alignment.topCenter,),
// const Text('400',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
// ],
// ),
// )
// ],
// ),
// decoration:  buttonBackDecoration()
// ),
// ),
// const SizedBox(height: 20),
//
// // button 2
// GestureDetector(
// onTap: ()=>debugPrint('pressed'),
// child: Container(
// height: 65,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children:  [
// const Text('Proceed to checkout',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
// buttonIcon(Icons.arrow_forward, 20),
// ],
// ),
// decoration:  buttonBackDecoration()
// ),
// ),
// ],
// ),
// ),
