import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_admin/pages/attendance_page.dart';
import 'package:hrms_admin/pages/employees_page.dart';
import 'package:hrms_admin/pages/home_page.dart';
import 'package:hrms_admin/pages/leave_page.dart';
import 'package:hrms_admin/pages/settings_page.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late List<CollapsibleItem> _items;
  bool _isCollapsed = true;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _items = _generateItems;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: "Home",
        icon: CupertinoIcons.home,
        onPressed: () => _navigateToPage(0),
        isSelected: true,
      ),
      CollapsibleItem(
        text: "Attendance",
        icon: CupertinoIcons.time,
        onPressed: () => _navigateToPage(1),
      ),
      CollapsibleItem(
        text: "Employees",
        icon: CupertinoIcons.person,
        onPressed: () => _navigateToPage(2),
      ),
      CollapsibleItem(
        text: "Leaves",
        icon: CupertinoIcons.briefcase,
        onPressed: () => _navigateToPage(3),
      ),
      CollapsibleItem(
        text: "Settings",
        icon: CupertinoIcons.settings,
        onPressed: () => _navigateToPage(4),
      ),
      CollapsibleItem(
        text: "Logout",
        icon: CupertinoIcons.back,
        onPressed: () {
          // Handle logout
        },
      ),
    ];
  }

  void _navigateToPage(int index) {
    setState(() {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isCollapsed = !_isCollapsed;
                  });
                },
                icon: SvgPicture.asset(
                  'lib/assets/images/bloom.svg',
                  height: 30,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 650), // Adjusted padding
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                    prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.onBackground),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications, color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  // Handle notification icon press
                },
              ),
              IconButton(
                icon: Icon(Icons.account_circle, color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  // Handle profile icon press
                },
              ),
              SizedBox(width: 8),
            ],
            elevation: 0,
          ),
        ),
      ),
      body: Row(
        children: [
          Container(
            width: _isCollapsed ? 75 : 220, // Collapsed and expanded width
            child: CollapsibleSidebar(
              isCollapsed: _isCollapsed,
              items: _items,
              showTitle: false,
              sidebarBoxShadow: [], // Removed shadow
              backgroundColor: Theme.of(context).colorScheme.secondary,
              showToggleButton: false,
              unselectedIconColor: Theme.of(context).colorScheme.inversePrimary,
              unselectedTextColor: Theme.of(context).colorScheme.inversePrimary,
              iconSize: 24, // Smaller icon size for minimalistic look
              selectedIconColor: Theme.of(context).colorScheme.secondary,
              textStyle: TextStyle(
                fontSize: 16
              ),
              body: Container(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageView(
                controller: _pageController,
                children: [
                  HomePage(),
                  AttendancePage(),
                  EmployeesPage(),
                  LeavePage(),
                  SettingsPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
