import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_admin/components/side_menu.dart';
import 'package:hrms_admin/pages/home_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

        // body
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:const SafeArea(
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            
                
             Expanded(
               
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: SideMenu(),
                ),
              
              ),
          
            // Expanded(
              
            
            //   flex: 5,
            //   child:HomePage(),
              
              
            // )

          ],
        )
        ),
    );
  }
}


