import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:pensement_mobile/components/Button/button.dart';
import 'package:pensement_mobile/contexts/AuthContext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nuvigator = Nuvigator.of(context);
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: Text("Tela1")),
                  BButton(
                      onPress: () {
                        final instance = AuthContext.service;
                        instance.removeToken();
                        nuvigator!.pushReplacementNamed('login');
                      },
                      text: 'Log out')
                ],
              );
            case 1:
              return const Center(child: Text("Tela2"));
            default:
              return const Center(child: Text("Tela1"));
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Tela1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars_rounded),
            label: 'Tela2',
          ),
        ],
      ),
    );
  }
}
