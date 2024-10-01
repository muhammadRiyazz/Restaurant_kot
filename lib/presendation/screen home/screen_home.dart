import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20home/finished_orders.dart';
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
          leading: Padding(
            padding: const EdgeInsets.only(left: 15,bottom: 8,top: 8),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black38),borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(right: 8,left: 4),
                child: Image.asset('assets/img/logo/logoa.png'),
              )),
          ),
          backgroundColor: appbarbg,
          title: const Center(child: Text('Home')),
          actions: [
            IconButton(padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      // return SettingsPage();
                      return ProfileManagementPage();
                    },
                  ));
                },
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black38),borderRadius: BorderRadius.circular(10)),
                  
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.person),
                    )),
                ))
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
                    FinishedOrders(), // 3 tab content
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
