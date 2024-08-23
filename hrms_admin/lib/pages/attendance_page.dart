import 'package:flutter/material.dart';
import 'package:hrms_admin/components/add_btn.dart';
import 'package:hrms_admin/components/quickinfo.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with title and button
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Attendance",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AddBtn(
                      text: "Report",
                      onBtnTap: () {},
                      icon: Icon(
                        Icons.print_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Row with containers aligned at the top
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      width: 250, // Calculate width dynamically
                      height: 150, // Adjust height as needed
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(226, 216, 255, 0.482),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: QuickInfo(
                        icon: Icon(Icons.person),
                        title: "Total Employees",
                        remainder: "200",
                        totalCount: "200",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      width: 250, // Calculate width dynamically
                      height: 150, // Adjust height as needed
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(226, 216, 255, 0.482),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: QuickInfo(
                        icon: Icon(Icons.person),
                        title: "Total Employees",
                        remainder: "200",
                        totalCount: "200",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      width: 250, // Calculate width dynamically
                      height: 150, // Adjust height as needed
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(226, 216, 255, 0.482),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: QuickInfo(
                        icon: Icon(Icons.person),
                        title: "Total Employees",
                        remainder: "200",
                        totalCount: "200",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      width: 250, // Calculate width dynamically
                      height: 150, // Adjust height as needed
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(226, 216, 255, 0.482),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: QuickInfo(
                        icon: Icon(Icons.person),
                        title: "Total Employees",
                        remainder: "200",
                        totalCount: "200",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Row with one empty column and one column with two rows
          Expanded(
            child: Row(
              children: [
                // Empty column
                Expanded(
                  flex: 3,
                  child: Container()),

                // Column with two rows
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blueGrey,
                          margin: const EdgeInsets.all(10),
                          child: Center(child: Text("Row 1", style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blueGrey[700],
                          margin: const EdgeInsets.all(10),
                          child: Center(child: Text("Row 2", style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
