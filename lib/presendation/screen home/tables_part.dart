import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20orders/screen_orders.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';

class Tablespart extends StatelessWidget {
  Tablespart({super.key});

  // Sample options for expansion tile
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
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
            // GridView.builder after selection

            GridView.builder(
              shrinkWrap: true, // Make GridView as small as needed
              physics:
                  const NeverScrollableScrollPhysics(), // Disable GridView scrolling
              padding: const EdgeInsets.symmetric(vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: 12, // Example number of items
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
Navigator.push(context, MaterialPageRoute(builder:  (context) {
  return ProductChoosingPage();
},));
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return OrdersPage(
                    //       tableName: 'tb 1',
                    //       orders: [
                    //         Order(
                    //             id: '1',
                    //             time: '10 : 10 Am',
                    //             itemCount: 5,
                    //             totalPrice: 2000),  Order(
                    //             id: '1',
                    //             time: '10 : 10 Am',
                    //             itemCount: 5,
                    //             totalPrice: 2000),  Order(
                    //             id: '1',
                    //             time: '10 : 10 Am',
                    //             itemCount: 5,
                    //             totalPrice: 2000),  Order(
                    //             id: '1',
                    //             time: '10 : 10 Am',
                    //             itemCount: 5,
                    //             totalPrice: 2000),
                    //       ],
                    //     );
                    //   },
                    // ));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                                              color: boxbgwhite,

                        borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Image.asset('assets/img/table/table.png'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: mainclr),
                                child: const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    'TB 1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '10 : 30 Am',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 0,
                              ),
                            ],
                          ),
                          Row(
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
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
