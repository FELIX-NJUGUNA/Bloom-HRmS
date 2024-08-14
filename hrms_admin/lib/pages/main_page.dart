import 'package:flutter/material.dart';
import 'package:hrms_admin/components/side_menu.dart';
import 'package:hrms_admin/pages/home_page.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:const SafeArea(
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            
                
             Expanded(
               
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SideMenu(),
                ),
              
              ),
          
            Expanded(
              
            
              flex: 5,
              child:HomePage(),
              
              
            )

          ],
        )
        ),
    );
  }
}


