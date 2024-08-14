import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Dashboard", style: Theme.of(context).textTheme.headlineMedium,),
      const   Spacer(flex: 2,),
        Expanded(
          child: SearchField(),
        
           ),
    
        ProfileCard()
    
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      margin: EdgeInsets.only(left: 10  , right: 10),
      decoration: BoxDecoration( color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SvgPicture.asset('lib/assets/icons/menu_profile.svg', height: 30  , color: Theme.of(context).colorScheme.primary,),
      
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Admin", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({ 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15)),
    
        ),
        suffixIcon: InkWell(
          onTap: () { 
            
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal:2),
            padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15),
              ),
            child: SvgPicture.asset('lib/assets/icons/search.svg', color: Theme.of(context).colorScheme.secondary,),
          ),
        )
      ),
    );
  }
}