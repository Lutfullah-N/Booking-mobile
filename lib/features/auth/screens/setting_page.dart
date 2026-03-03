import 'package:booking/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int selectedIndex = 0;

  final List<String> titles = [
    "Change Language",
    "Logout",
    "Brightness Mode",
    "Delete Account"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Setting',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        children: [
          /// 🔹 LEFT SIDE (Sidebar)
          SizedBox(
            width: 250,
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  selected: selectedIndex == index,
                  leading: const Icon(Icons.settings),
                  title: Text(titles[index]),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),

          /// 🔹 VERTICAL DIVIDER
          const VerticalDivider(
            width: 1,
            thickness: 1,
          ),

          /// 🔹 RIGHT SIDE (Content Area)
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return const Text("Change Language Screen");
      case 1:
        return const Text("Logout Screen");
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Dark Mode',
              style: TextStyle(fontSize: 18),
            ),
            Switch(
              value: context.watch<ThemeProvider>().isDarkMode,
              onChanged: (value) {
                context.read<ThemeProvider>().togglethem(value);
              },
            )
          ],
        );
      case 3:
        return const Text("Delete Account Screen");
      default:
        return const Text("Select an option");
    }
  }
}
