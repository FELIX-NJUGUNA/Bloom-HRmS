import 'package:flutter/material.dart';


class AddBtn extends StatelessWidget {
  final String text;
  final Icon icon;
  final void Function()? onBtnTap;

  
  

  const AddBtn({super.key, required this.text,required this.onBtnTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBtnTap,
      child: Container(
        
       decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(15)
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
        
          children: [
                                            
            icon,
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary
              ),
            )
          ],
        ),
      ),
        ),
    );
  }
}