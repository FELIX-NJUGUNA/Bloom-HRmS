import 'package:flutter/material.dart';
import 'package:hrms_admin/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _emailNotifications = true;
  bool _pushNotifications = false;
  bool _darkMode = false;
  String _selectedLanguage = 'English';


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Settings", style: Theme.of(context).textTheme.headlineMedium,),
        
      ),
      
      body: ListView(
        children: [
          const SizedBox(height: 20,),
          // Account Settings Section
          _buildSection(
            context,
            title: 'Account Settings',
            children: [
              _buildListTile(
                context,
                icon: Icons.person,
                title: 'Profile',
                subtitle: 'Update your profile details',
                onTap: () {
                  // Handle profile update action
                },
              ),
              _buildListTile(
                context,
                icon: Icons.lock,
                title: 'Change Password',
                subtitle: 'Update your account password',
                onTap: () {
                  // Handle change password action
                },
              ),
            ],
          ),
          // Notification Settings Section
          _buildSection(
            context,
            title: 'Notification Settings',
            children: [
              _buildSwitchTile(
                title: 'Email Notifications',
                subtitle: 'Receive notifications via email',
                value: _emailNotifications,
                onChanged: (value) {
                  setState(() {
                    _emailNotifications = value;
                  });
                },
              ),
              _buildSwitchTile(
                title: 'Push Notifications',
                subtitle: 'Receive push notifications',
                value: _pushNotifications,
                onChanged: (value) {
                  setState(() {
                    _pushNotifications = value;
                  });
                },
              ),
            ],
          ),
          // General Settings Section
          _buildSection(
            context,
            title: 'General Settings',
            children: [
              _buildDropdownTile(
                title: 'Language',
                subtitle: _selectedLanguage,
                items: ['English', 'Spanish', 'French', 'German'],
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
              ),
              _buildSwitchTile(
                title: 'Dark Mode',
                subtitle: 'Enable dark mode for the app',
                value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _darkMode = value;
                    //Provider.of<ThemeProvider>(context, listen: false).toggleThemes();
                  });
                },
              ),
              _buildListTile(
                context,
                icon: Icons.info,
                title: 'About',
                subtitle: 'About this application',
                onTap: () {
                  // Handle about page action == insert pop up dialog box
                  
                  
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required List<Widget> children}) {
    return ExpansionTile(
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black87)),
      children: children,
    );
  }

  Widget _buildListTile(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({required String title, required String subtitle, required bool value, required ValueChanged<bool> onChanged}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildDropdownTile({required String title, required String subtitle, required List<String> items, required ValueChanged<String?> onChanged}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: DropdownButton<String>(
        value: subtitle,
        items: items.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        )).toList(),
        onChanged: onChanged,
      ),
    );
  }
}


