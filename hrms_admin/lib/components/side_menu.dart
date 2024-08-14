import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_admin/themes/theme_provider.dart';
import 'package:provider/provider.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:const  BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        
             
        child: SingleChildScrollView(
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              
        
              Padding(
                padding: const EdgeInsets.all(0),
                child: DrawerHeader(
                  
                  child: SvgPicture.asset('lib/assets/images/bloom.svg', height: 50, color: Theme.of(context).colorScheme.inversePrimary,) ),
              ),
            
                DrawerListTile(
                  title: 'Dashboard', 
                  svgIcon: "lib/assets/icons/menu_dashboard.svg",
                  press: () {  },),
            
                 DrawerListTile(
                  title: 'Attendance', 
                 svgIcon: "lib/assets/icons/menu_time.svg",
                  press: () {  },),
            
                   DrawerListTile(
                  title: 'Employees', 
                  svgIcon: "lib/assets/icons/menu_employees.svg", 
                  press: () {  },),
        
                   DrawerListTile(
                  title: 'Leaves', 
                  svgIcon: "lib/assets/icons/menu_leaves.svg", 
                  press: () {  },),
      
                  SizedBox(height: 40,),
            
                  DrawerListTile(
                  title: 'Settings', 
                  svgIcon: "lib/assets/icons/settings.svg", 
                  press: () {  },),
            
                  DrawerListTile(
                  title: 'Profile', 
                  svgIcon: "lib/assets/icons/menu_profile.svg", 
                  press: () {  },),


                  SizedBox(height: 70,),
      
      
                  DrawerListTile(
                  title: 'Logout', 
                  svgIcon: "lib/assets/icons/logout.svg", 
                  press: () {  },),
        
        
        
                   Row(
                    mainAxisSize: MainAxisSize.min              ,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
        
                        Text("Light", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                       CupertinoSwitch(
                        
                        value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                        onChanged: (value) =>
                          Provider.of<ThemeProvider>(context, listen: false).toggleThemes(),
                        ),
        
                        Text("Dark", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
        
                     ],
                   ),
        
                
        
            ],),
          ),
      ),
    );
    
  }
}


// drawer list tile
class DrawerListTile extends StatelessWidget {

  final String title, svgIcon;
  final VoidCallback press;

  const DrawerListTile({
    super.key, required this.title, required this.svgIcon, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      
      onTap: press, 
    // ignore: deprecated_member_use
    leading: SvgPicture.asset(svgIcon, height:18,color: Theme.of(context).colorScheme.inversePrimary,) ,
      title: Text(title),                  
    );
  } 
}