import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:tripdo/pages/home_page.dart';
import 'package:tripdo/pages/create_page.dart';
import 'package:tripdo/pages/profile_page.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {

  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  List<Widget> items = [
    const HomePage(),
    const CreatePage(),
    const ProfilePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(items.length, (index) => items[index]),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        color: Theme.of(context).colorScheme.primary,
        notchBottomBarController: _controller,
        removeMargins: true,
        durationInMilliSeconds: 100,
        showLabel: false,
        notchColor: Theme.of(context).colorScheme.primary,
        kIconSize: 24.0,
        kBottomRadius: 0.0,
        bottomBarItems: <BottomBarItem> [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.home,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            itemLabel: 'home',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.create,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.create,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            itemLabel: 'create',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.person,
              size: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            itemLabel: 'profile',
          ),
        ],
        onTap: (int index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}