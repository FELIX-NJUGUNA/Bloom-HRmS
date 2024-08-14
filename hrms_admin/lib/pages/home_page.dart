import 'package:flutter/material.dart'; 
import 'package:hrms_admin/components/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            
              children: [
              
                Header(
                  title: "Dashboard",
                ),
                const SizedBox(height: 10,),
                Row(

                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 500,
                        color: Theme.of(context).colorScheme.secondary
                      )
                      ),
                      const SizedBox(width: 10,), 

                      Expanded(
                      flex: 2 ,
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary
                        ),
                      )
                      ),
                  ],
                )
              ],
          ),
        ),
      ),
    );
  }
}

