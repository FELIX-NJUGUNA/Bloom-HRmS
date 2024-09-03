import 'package:flutter/material.dart';
import 'package:hrms_admin/components/add_btn.dart';
import 'package:hrms_admin/components/quickinfo.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool _sortAscending = true;
  int _sortColumnIndex = 0;
  String _searchQuery = '';

  // Dummy data for attendance records
List<Map<String, dynamic>> _attendanceRecords = List.generate(
  50,
  (index) => {
    'name': 'Employee $index',
    'department': 'Department $index',
    'timeIn': '8:00am',
    'timeOut': '5:00pm',
    'status': index % 3 == 0 ? 'ABSENT' : (index % 5 == 0 ? 'LATE' : 'ON-TIME'),
    'apology': index % 2 == 0 ? 'Yes' : 'No',
  },
);


  // Filtered lists for absentee records with and without apology
  List<Map<String, dynamic>> _absentWithApology = [];
  List<Map<String, dynamic>> _absentWithoutApology = [];

  void _sort<T>(Comparable<T> Function(Map<String, dynamic> record) getField, int columnIndex, bool ascending) {
    _attendanceRecords.sort((a, b) {
      if (!ascending) {
        final Map<String, dynamic> c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aField = getField(a);
      final Comparable<T> bField = getField(b);
      return Comparable.compare(aField, bField);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  void _filterAttendanceRecords() {
    setState(() {
      _absentWithApology = _attendanceRecords.where((record) {
        return record['status'] == 'ABSENT' &&
               record['apology'] == 'Yes' &&
               (record['name']!.toLowerCase().contains(_searchQuery) ||
                record['department']!.toLowerCase().contains(_searchQuery));
      }).toList();

      _absentWithoutApology = _attendanceRecords.where((record) {
        return record['status'] == 'ABSENT' &&
               record['apology'] == 'No' &&
               (record['name']!.toLowerCase().contains(_searchQuery) ||
                record['department']!.toLowerCase().contains(_searchQuery));
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _filterAttendanceRecords();
  }

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
                AddBtn(
                  text: "Export Data",
                  onBtnTap: () {
                    // Implement export data functionality
                  },
                  icon: Icon(
                    Icons.file_download,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),

          // Update the Quick Info section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickInfo(
                  context,
                  icon: Icons.person,
                  title: "Total Attendance",
                  remainder: _attendanceRecords.length.toString(),
                  totalCount: "200",
                  backgroundColor: Color.fromRGBO(226, 216, 255, 0.482),
                ),
                const SizedBox(width: 10,),
                _buildQuickInfo(
                  context,
                  icon: Icons.check_box_rounded,
                  title: "Reported On-Time",
                  remainder: _attendanceRecords.where((record) => record['status'] == 'ON-TIME').length.toString(),
                  totalCount: "200",
                  backgroundColor: Color.fromRGBO(217, 255, 216, 0.478),
                ),
                const SizedBox(width: 10,),
                _buildQuickInfo(
                  context,
                  icon: Icons.assignment_late,
                  title: "Reported Late",
                  remainder: _attendanceRecords.where((record) => record['status'] == 'LATE').length.toString(),
                  totalCount: "200",
                  backgroundColor: Color.fromRGBO(255, 216, 216, 0.478),
                ),
                const SizedBox(width: 10,),
                _buildQuickInfo(
                  context,
                  icon: Icons.close_rounded,
                  title: "Absent",
                  remainder: _attendanceRecords.where((record) => record['status'] == 'ABSENT').length.toString(),
                  totalCount: "200",
                  backgroundColor: Color.fromRGBO(255, 239, 216, 0.475),
                ),
              ],
            ),
          ),


          const SizedBox(height: 10),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search Attendance",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                  _filterAttendanceRecords();
                });
              },
            ),
          ),

          // Attendance Table in a Row with additional containers
          Expanded(
            child: Row(
              children: [
                // Attendance Table
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: PaginatedDataTable(
                      header: Text('Attendance Records'),
                      columns: [
                        DataColumn(
                          label: Text('Name'),
                          onSort: (columnIndex, ascending) => _sort<String>((e) => e['name'] as String, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: Text('Department'),
                          onSort: (columnIndex, ascending) => _sort<String>((e) => e['department'] as String, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: Text('Time In'),
                          onSort: (columnIndex, ascending) => _sort<String>((e) => e['timeIn'] as String, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: Text('Time Out'),
                          onSort: (columnIndex, ascending) => _sort<String>((e) => e['timeOut'] as String, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: Text('Status'),
                          onSort: (columnIndex, ascending) => _sort<String>((e) => e['status'] as String, columnIndex, ascending),
                        ),
                      ],
                      source: _AttendanceDataSource(_attendanceRecords),
                      rowsPerPage: 10,
                      onRowsPerPageChanged: (rowsPerPage) {
                        setState(() {
                          // Handle rows per page change
                        });
                      },
                    ),
                  ),
                ),
                // Additional Column for Absent Employees
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // Absent Employees with Apology
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Absent with Apology",
                                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  children: _absentWithApology.map((record) {
                                    return ListTile(
                                      title: Text(record['name']),
                                      subtitle: Text(record['department']),
                                      trailing: Text(record['status']),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Absent Employees without Apology
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Absent without Apology",
                                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  children: _absentWithoutApology.map((record) {
                                    return ListTile(
                                      title: Text(record['name']),
                                      subtitle: Text(record['department']),
                                      trailing: Text(record['status']),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
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
}

class _AttendanceDataSource extends DataTableSource {
  _AttendanceDataSource(this.attendanceRecords);

  final List<Map<String, dynamic>> attendanceRecords;

  @override
  DataRow? getRow(int index) {
    if (index >= attendanceRecords.length) return null;
    final record = attendanceRecords[index];
    return DataRow(
      cells: [
        DataCell(Text(record['name'] as String)),
        DataCell(Text(record['department'] as String)),
        DataCell(Text(record['timeIn'] as String)),
        DataCell(Text(record['timeOut'] as String)),
        DataCell(
          Container(
            decoration: BoxDecoration(
              color: _getStatusColor(record['status'] as String),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                record['status'] as String,
                style: TextStyle(
                  color: _getStatusColor(record['status'] as String).computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => attendanceRecords.length;

  @override
  int get selectedRowCount => 0;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "ON-TIME":
        return Color.fromARGB(255, 140, 218, 143);
      case "LATE":
        return Color.fromARGB(255, 255, 205, 128);
      default:
        return Color.fromARGB(255, 255, 105, 97);
    }
  }
}

