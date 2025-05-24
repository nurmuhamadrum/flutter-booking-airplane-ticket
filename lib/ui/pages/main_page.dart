import 'package:airplane/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: keyWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_home.png',
                isSelected: true,
              ),
              CustomBottomNavigationItem(imageUrl: 'assets/icon_booking.png'),
              CustomBottomNavigationItem(imageUrl: 'assets/icon_card.png'),
              CustomBottomNavigationItem(imageUrl: 'assets/icon_settings.png'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: keyBackgroundColor,
      body: Stack(children: [Text('Main Page'), customBottomNavigation()]),
    );
  }
}
