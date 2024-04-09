import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BAppBar({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 90,
            ), // Ícone do avatar
            onPressed: () {},
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Olá,',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(style: const TextStyle(fontSize: 18), "\$2000,00"),
          )
        ],
      ),
      leadingWidth: double.maxFinite,
    );
  }
}
