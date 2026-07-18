import 'package:flutter/material.dart';

class NobelionBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NobelionBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: "Dashboard",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: "Fleet",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.inventory),
          label: "Orders",
        ),

       BottomNavigationBarItem(
  icon: Icon(Icons.map),
  label: "Map",
),

        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),

      ],
    );
  }
}