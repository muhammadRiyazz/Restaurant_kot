import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20orders%20from%20table/order_list_table.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';

class Tablespart extends StatelessWidget {
  Tablespart({super.key});

  // Sample options for expansion tile
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of grid columns based on screen width
    int crossAxisCount = screenWidth < 600
        ? 2
        : 3; // 2 columns for phones, 4 columns for tablets

    return RefreshIndicator(
      backgroundColor: mainclr,
      color: mainclrbg,
      onRefresh: () async {
        log('message');
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ListView with ExpansionTile
            ListView(
              shrinkWrap: true, // Makes ListView as small as possible
              physics:
                  const NeverScrollableScrollPhysics(), // Disable ListView scrolling (handled by SingleChildScrollView)
              children: [
                ExpansionTile(
                  collapsedBackgroundColor: boxbgwhite,
                  backgroundColor: boxbgwhite,
                  leading: Icon(
                    Icons.line_weight_sharp,
                    color: mainclr,
                  ),
                  title: const Text('Choose Floor'),
                  children: options.map((option) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListTile(
                        title: Text(option),
                        onTap: () {},
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            // GridView.builder with dynamic columns
            GridView.builder(
              shrinkWrap: true, // Make GridView as small as needed
              physics:
                  const NeverScrollableScrollPhysics(), // Disable GridView scrolling
              padding: const EdgeInsets.symmetric(vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.1,
                crossAxisCount: crossAxisCount, // Dynamic number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 12, // Example number of items
              itemBuilder: (context, index) {
                return Card(margin: EdgeInsets.all(3),
                    
                    elevation: 5,borderOnForeground: true,shadowColor: const Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProductChoosingPage();
                          },
                        ));
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ScreenOrdersList();
                          },
                        ));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: boxbgwhite,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Table 0$index',
                              style: TextStyle(
                                  color: mainclr,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Divider(height: 0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: mainclr,
                                ),
                                child: Center(
                                  child: Container(
                                      width: 60,
                                      decoration: BoxDecoration(color:  index == 0 || index == 1 || index == 2
                                                ? mainclr:Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: mainclr)),
                                      height: 45,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                            index == 0 || index == 1 || index == 2
                                                ? Image.asset(
                                                    'assets/img/table/tableicon.png',
                                                    fit: BoxFit.contain,
                                                    color: Colors.white,
                                                  )
                                                : Image.asset(
                                                    'assets/img/table/emptytable.png',
                                                    fit: BoxFit.contain,
                                                    // color: Colors.white,
                                                  ),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '5 Orders',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '10 : 30 Am',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 0,
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '₹ 2500',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
