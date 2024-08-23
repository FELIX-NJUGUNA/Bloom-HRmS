import 'package:flutter/material.dart';


class QuickInfo extends StatelessWidget {

  final Icon icon;
  final String title;
  final String remainder;
  final String totalCount;

  const QuickInfo({
    super.key, required this.icon, required this.title, required this.remainder, required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         // icon
        icon,
      
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
           // title
        Text(title),
      
        // number
        Row(
          
          children: [
            Text(remainder, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
            Text("/", style: TextStyle(fontSize: 25)),
            Text(totalCount, style: TextStyle(fontSize: 20)),
          ],
        )
      
        ],),
      
      
       
       ],
      ),
    );
  }
}
