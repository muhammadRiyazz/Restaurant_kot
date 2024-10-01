import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20home/tables_part.dart';
import 'package:restaurant_kot/presendation/screen%20profile/screen_profile.dart';
import 'package:restaurant_kot/presendation/screen%20login/screen_settings.dart';

import 'orders_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: mainclrbg,
        appBar: AppBar(
          backgroundColor: appbarbg,
          title: Center(child: const Text('Home')),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      // return SettingsPage();
                      return ProfileManagementPage();
                    },
                  ));
                },
                icon: Icon(Icons.person))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
          child: Column(
            children: [
              // Custom styled TabBar with background, border, and selected tab color
              Container(
                decoration: BoxDecoration(
                  color: boxbgwhite,
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                ),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBar(
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        color: mainclr, // Selected tab background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                      labelColor: Colors.white, // Selected text color
                      unselectedLabelColor:
                          Colors.black, // Unselected text color
                      indicatorSize:
                          TabBarIndicatorSize.tab, // Full width of the tab
                      tabs: const [
                        Tab(text: 'Tables'),
                        Tab(text: 'Orders'),
                        Tab(text: 'Bills'),
                      ],
                    )),
              ),
              SizedBox(
                height: 12,
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    Tablespart(), // First tab content
                    OrderPage(), // Second tab content
                    OrderPage(), // Second tab content
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// First Tab Content
