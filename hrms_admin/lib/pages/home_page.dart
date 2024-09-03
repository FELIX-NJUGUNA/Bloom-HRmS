import 'package:flutter/material.dart';
import 'package:hrms_admin/components/add_btn.dart';
import 'package:hrms_admin/components/event_notif.dart';
import 'package:hrms_admin/components/leave_employees.dart';
import 'package:hrms_admin/components/quickinfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';
  bool _sortAscending = true;
  int _sortColumnIndex = 0;

  List<Map<String, String>> _employeesOnLeave = [
    {'name': 'Felix Njugush', 'leaveType': 'Education', 'duration': '10 JUNE'},
    {'name': 'John Doe', 'leaveType': 'Sick Leave', 'duration': '12 JUNE'},
    // Add more data as needed
  ];

  List<Map<String, String>> _events = List.generate(
    7,
    (index) => {
      'title': 'Event ${index + 1}',
      'details': 'Details of event ${index + 1}',
    },
  );

  void _sort<T>(Comparable<T> Function(Map<String, String> record) getField, int columnIndex, bool ascending) {
    setState(() {
      _employeesOnLeave.sort((a, b) {
        if (!ascending) {
          final Map<String, String> c = a;
          a = b;
          b = c;
        }
        final Comparable<T> aField = getField(a);
        final Comparable<T> bField = getField(b);
        return Comparable.compare(aField, bField);
      });
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = _employeesOnLeave.where((employee) {
      return employee['name']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             employee['leaveType']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          // Section 1
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container 1
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome back Felix"),
                          Text("Good Morning", style: Theme.of(context).textTheme.headlineMedium),
                        ],
                      ),
                    ),
                  ),

                  // Container 2
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        _buildQuickInfo(
                          context,
                          icon: Icons.person,
                          title: "Total Employees",
                          remainder: "200",
                          totalCount: "200",
                          color: Color.fromRGBO(226, 216, 255, 0.482),
                        ),
                        const SizedBox(width: 10),
                        _buildQuickInfo(
                          context,
                          icon: Icons.note,
                          title: "On Leave",
                          remainder: "10",
                          totalCount: "200",
                          color: Color.fromRGBO(216, 255, 218, 0.49),
                        ),
                        const SizedBox(width: 10),
                        _buildQuickInfo(
                          context,
                          icon: Icons.punch_clock_outlined,
                          title: "Today's Attendance",
                          remainder: "200",
                          totalCount: "200",
                          color: Color.fromRGBO(255, 216, 216, 0.486),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Section 2
          Expanded(
            child: Row(
              children: [
                // Attendance graph
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Attendance Overview",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // News and events
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("News & Events", style: Theme.of(context).textTheme.headlineSmall),
                          AddBtn(
                            text: "Add Event",
                            onBtnTap: () {},
                            icon: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView(
                          children: _events.map((event) {
                            return Card(
                              elevation: 4.0,
                              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                title: Text(event['title']!),
                                subtitle: Text(event['details']!),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Section 3
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              children: [
                // Employees on leave
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Employees On Leave", style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Search bar
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Search Employees",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _searchQuery = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView(
                              children: filteredEmployees.map((employee) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
                                  ),
                                  child: ListTile(
                                    title: Text(employee['name']!),
                                    subtitle: Text(employee['leaveType']!),
                                    trailing: Text(employee['duration']!),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Employees container
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Theme.of(context).colorScheme.secondary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Employees", style: TextStyle(fontSize: 20)),
                              AddBtn(
                                text: "View All",
                                onBtnTap: () {},
                                icon: Icon(Icons.keyboard_arrow_left, color: Theme.of(context).colorScheme.secondary),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Add content for employees list if needed
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // My Tasks container
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("My Tasks", style: TextStyle(fontSize: 20)),
                                  AddBtn(
                                    text: "Add Task",
                                    onBtnTap: () {},
                                    icon: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Add task list content here if needed
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickInfo(BuildContext context, {required IconData icon, required String title, required String remainder, required String totalCount, required Color color}) {
    return Flexible(
      child: Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(
          color: color,
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
}
