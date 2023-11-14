import 'package:flutter/material.dart';

class CommonBottomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.access_time),
        label: 'Time',
      )
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}


// class CommonAppBar extends AppBar {

//   @override
//   Widget build(BuildContext context) {
//     return AppBar();
//   }
// }
