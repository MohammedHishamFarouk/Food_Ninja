import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';
import 'package:food_ninja/view/screens/chat/chat_screen.dart';
import 'package:food_ninja/view/screens/homePageSections/home_screen.dart';
import 'package:food_ninja/view/screens/infoScreen/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../core/constants/assets.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    ProfileScreen(),
    SizedBox(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state is FilterLoadingState
            ? const HomeScreen()
            : Scaffold(
                body: Stack(
                  children: [
                    _pages[_currentIndex],
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: GNav(
                              gap: 15,
                              tabBackgroundColor:
                                  ColorManager.blendedGreen.withOpacity(0.3),
                              backgroundColor: Colors.grey.shade900,
                              tabBorderRadius: 16,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              tabMargin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              selectedIndex: _currentIndex,
                              onTabChange: (value) {
                                setState(() {
                                  if (value == 2) {
                                    Navigator.of(context)
                                        .pushNamed('cartScreen');
                                  }
                                  _currentIndex = value;
                                });
                              },
                              tabs: [
                                GButton(
                                  icon: Icons.face,
                                  leading: SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: const AssetImage(
                                          AssetFolder.homeIcon),
                                      color: ColorManager.blendedGreen
                                          .withOpacity(0.4),
                                    ),
                                  ),
                                  text: screenWidth <= 385 ? '' : 'Home',
                                ),
                                GButton(
                                  icon: Icons.face,
                                  leading: const SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage(AssetFolder.profileIcon),
                                    ),
                                  ),
                                  text: screenWidth <= 385 ? '' : 'Profile',
                                ),
                                GButton(
                                  icon: Icons.face,
                                  leading: const SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage(AssetFolder.cartIcon),
                                    ),
                                  ),
                                  text: screenWidth <= 385 ? '' : 'Cart',
                                ),
                                GButton(
                                  icon: Icons.face,
                                  leading: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: const AssetImage(
                                          AssetFolder.chatIcon),
                                      color: ColorManager.blendedGreen
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                  text: screenWidth <= 385 ? '' : 'Chat',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }
}
