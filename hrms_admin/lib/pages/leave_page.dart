import 'package:flutter/material.dart';
import 'package:hrms_admin/components/add_btn.dart';
import 'package:hrms_admin/components/quickinfo.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.colorScheme.secondary;

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
                    "Leaves",
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                AddBtn(
                  text: "Export Data",
                  onBtnTap: () {
                    // Add your export data functionality here
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left_sharp,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),

          // Row with containers aligned at the top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickInfo(
                  context,
                  icon: Icons.person,
                  title: "Sick Leave",
                  remainder: "1",
                  totalCount: "200",
                  backgroundColor: const Color.fromRGBO(226, 216, 255, 0.482),
                ),
                _buildQuickInfo(
                  context,
                  icon: Icons.check_box_rounded,
                  title: "Annual Leave",
                  remainder: "100",
                  totalCount: "200",
                  backgroundColor: const Color.fromRGBO(217, 255, 216, 0.478),
                ),
                _buildQuickInfo(
                  context,
                  icon: Icons.assignment_late,
                  title: "Casual Leave",
                  remainder: "20",
                  totalCount: "200",
                  backgroundColor: const Color.fromRGBO(255, 216, 216, 0.478),
                ),
                _buildQuickInfo(
                  context,
                  icon: Icons.close_rounded,
                  title: "Maternity Leave",
                  remainder: "30",
                  totalCount: "200",
                  backgroundColor: const Color.fromRGBO(255, 239, 216, 0.475),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: Row(
              children: [
                _buildContainer(
                  context,
                  title: "Applied Leaves",
                  borderColor: borderColor,
                  child: _buildAppliedLeavesList(),
                ),
                const SizedBox(width: 10),
                _buildContainer(
                  context,
                  title: "Employees On Leave",
                  borderColor: borderColor,
                  child: _buildEmployeesOnLeaveList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickInfo(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String remainder,
    required String totalCount,
    required Color backgroundColor,
  }) {
    return Flexible(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: QuickInfo(
          icon: Icon(icon),
          title: title,
          remainder: remainder,
          totalCount: totalCount,
        ),
      ),
    );
  }

  Widget _buildContainer(
    BuildContext context, {
    required String title,
    required Color borderColor,
    required Widget child,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppliedLeavesList() {
    // Sample data
    final leaves = [
      {"name": "John Doe", "designation": "Software Engineer", "dates": "01 Aug - 10 Aug"},
      {"name": "Jane Smith", "designation": "Project Manager", "dates": "15 Aug - 20 Aug"},
    ];

    return ListView.builder(
      itemCount: leaves.length,
      itemBuilder: (context, index) {
        final leave = leaves[index];
        return ListTile(
          title: Text(leave["name"]!),
          subtitle: Text("Designation: ${leave["designation"]!}\nLeave Dates: ${leave["dates"]!}"),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          tileColor: Colors.grey[200],
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.check, color: Colors.green),
                onPressed: () {
                  // Add approve action
                },
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  // Add reject action
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmployeesOnLeaveList() {
    // Sample data
    final employeesOnLeave = [
      {"name": "Alice Brown", "designation": "HR Specialist", "dates": "01 Aug - 05 Aug"},
      {"name": "Bob Johnson", "designation": "Accountant", "dates": "10 Aug - 15 Aug"},
    ];

    return ListView.builder(
      itemCount: employeesOnLeave.length,
      itemBuilder: (context, index) {
        final employee = employeesOnLeave[index];
        return ListTile(
          title: Text(employee["name"]!),
          subtitle: Text("Designation: ${employee["designation"]!}\nLeave Dates: ${employee["dates"]!}"),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          tileColor: Colors.grey[100],
        );
      },
    );
  }
}
