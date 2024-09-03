import 'package:flutter/material.dart';
import 'package:hrms_admin/components/add_btn.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  int _currentPage = 0;
  int _rowsPerPage = 10;
  bool _sortAscending = true;
  int _sortColumnIndex = 0;

  // Dummy data for employees with passport field
  final List<Map<String, dynamic>> _employees = List.generate(
    100,
    (index) => {
      'name': 'Employee $index',
      'designation': 'Designation $index',
      'email': 'employee$index@mail.com',
      'mobile': '+25470000000',
      'department': 'Department $index',
      'doj': '01/01/2020',
      'passport': 'P${index.toString().padLeft(6, '0')}', // Example passport number
    },
  );

  void _sort<T>(Comparable<T> Function(Map<String, dynamic> employee) getField, int columnIndex, bool ascending) {
    _employees.sort((a, b) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with title and buttons
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Employees",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                AddBtn(
                  text: "Add Employees",
                  onBtnTap: () {
                    // Implement add employees functionality
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(width: 10),
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
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search Employees",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Implement search functionality
              },
            ),
          ),
          // Employee Table
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: PaginatedDataTable(
                header: Text('Employee List'),
                columns: [
                  DataColumn(
                    label: Text('Passport'),
                    onSort: (columnIndex, ascending) => _sort<String>((e) => e['passport'] ?? '', columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Name'),
                    onSort: (columnIndex, ascending) => _sort<String>((e) => e['name'] ?? '', columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Designation'),
                    onSort: (columnIndex, ascending) => _sort<String>((e) => e['designation'] ?? '', columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Email'),
                    onSort: (columnIndex, ascending) => _sort<String>((e) => e['email'] ?? '', columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Mobile'),
                    onSort: (columnIndex, ascending) => _sort<String>((e) => e['mobile'] ?? '', columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Department'),
                    onSort: (columnIndex, ascending) => _sort<String>((e) => e['department'] ?? '', columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Date of Joining'),
                    onSort: (columnIndex, ascending) => _sort<String>((e) => e['doj'] ?? '', columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Action'),
                  ),
                ],
                source: _EmployeeDataSource(_employees),
                rowsPerPage: _rowsPerPage,
                onRowsPerPageChanged: (rowsPerPage) {
                  setState(() {
                    _rowsPerPage = rowsPerPage ?? _rowsPerPage;
                  });
                },
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmployeeDataSource extends DataTableSource {
  _EmployeeDataSource(this.employees);

  final List<Map<String, dynamic>> employees;

  @override
  DataRow? getRow(int index) {
    if (index >= employees.length) return null;
    final employee = employees[index];
    return DataRow(
      cells: [
        DataCell(Text(employee['passport'] ?? 'N/A')),
        DataCell(Text(employee['name'] ?? 'N/A')),
        DataCell(Text(employee['designation'] ?? 'N/A')),
        DataCell(Text(employee['email'] ?? 'N/A')),
        DataCell(Text(employee['mobile'] ?? 'N/A')),
        DataCell(Text(employee['department'] ?? 'N/A')),
        DataCell(Text(employee['doj'] ?? 'N/A')),
        DataCell(
          ElevatedButton(
            onPressed: () {
              // Implement view details functionality
            },
            child: Text("More"),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => employees.length;

  @override
  int get selectedRowCount => 0;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
