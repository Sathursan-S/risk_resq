import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  CustomAppBar({required this.scaffoldKey, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 4, 7),
          ),
        ),
      ),
      leading: GestureDetector(
        child: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 0, 4, 7),
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            //FirebaseAuth.instance.signOut();
          },
          icon: const Icon(
            Icons.logout,
            color: Color.fromARGB(255, 0, 4, 7),
          ),
        ),
      ],
    );
  }
}


