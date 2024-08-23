import 'package:flutter/material.dart';


class EventNotif extends StatelessWidget {

  final String eventTxt;
  final String time;
  final String date;
  final String month;
  const EventNotif({super.key, required this.eventTxt, required this.time, required this.date, required this.month});

  @override
  Widget build(BuildContext context) {
      return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10)
    
      ),
      child: Row(
        children: [
            Column(
              children: [
                Text(date, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                Text(month)
                
              ],
            ),
    
          Expanded(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventTxt, maxLines: 1, overflow: TextOverflow.ellipsis,),
                                                  
                  Text(
                    time,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary
                    ),
                  )
                ],
              ),
            )
            )
        ],
      ),
    ),
  );
  }
}