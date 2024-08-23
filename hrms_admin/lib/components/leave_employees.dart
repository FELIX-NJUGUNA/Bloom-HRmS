import 'package:flutter/material.dart';

class LeaveEmployees extends StatelessWidget {
  final String name;
  final String leaveType;
  final String duration;
  
  const LeaveEmployees({
    super.key,
    required this.name,
    required this.leaveType,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Adds shadow to the card
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adds margin around the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners for the card
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the card
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items at the start
          children: [
            Icon(
              Icons.person,
              size: 40, // Adjust icon size
              color: Theme.of(context).colorScheme.primary, // Icon color
            ),
            const SizedBox(width: 16.0), // Space between icon and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18, // Adjust font size
                      fontWeight: FontWeight.bold, // Bold text for the name
                    ),
                  ),
                  const SizedBox(height: 4.0), // Space between name and leave type
                  Text(
                    '$leaveType Leave',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16, // Font size for leave type
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0), // Space between text and duration container
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Padding inside the container
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12.0), // Rounded corners for the container
              ),
              child: Text(
                duration,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary, // Text color inside the container
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
