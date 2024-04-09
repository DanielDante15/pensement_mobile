import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pensement_mobile/components/AppBar/AppBar.dart';
import 'package:pensement_mobile/contexts/UserContext.dart';
import 'package:pensement_mobile/pages/expenses/expense_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.id,
  });

  final String? id;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int currentIndex = 0;
  final userStore = UserContext();

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex);
    userStore.getUserById(widget.id.toString());
    userStore.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (userStore.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: BAppBar(title: userStore.user['name']),
        endDrawer: const Drawer(),
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
                return ExpenseListScreen(id: userStore.user['id']);
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
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_right_arrow_left),
              label: 'Dívidas',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled),
              label: 'Tela2',
            ),
          ],
        ),
      );
    }
  }
}
