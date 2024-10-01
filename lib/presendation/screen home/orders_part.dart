import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';
import '../screen order details/screen_order_detail.dart';

class Order {
  final String id;
  final String time;
  final int itemCount;
  final double totalPrice;

  Order({
    required this.id,
    required this.time,
    required this.itemCount,
    required this.totalPrice,
  });
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Order> orders = [
    Order(id: '001', time: '10:30 AM', itemCount: 3, totalPrice: 150.0),
    Order(id: '002', time: '11:00 AM', itemCount: 2, totalPrice: 100.0),
    Order(id: '003', time: '11:30 AM', itemCount: 5, totalPrice: 250.0),
    Order(id: '004', time: '12:00 PM', itemCount: 4, totalPrice: 200.0),
    // Add more sample orders here
  ];

  List<bool> isSelected = [];
  bool isMultiSelectMode = false;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(orders.length, false);
  }

  void _onLongPress(int index) {
    setState(() {
      isMultiSelectMode = true;
      isSelected[index] = !isSelected[index]; // Toggle the selection
    });
  }

  void _onTap(int index) {
    if (isMultiSelectMode) {
      setState(() {
        isSelected[index] = !isSelected[index];
      });
    } else {
      // Navigate to order details page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDetailsPage(
            order: Orderr(id: '1', time: '10:10 AM', items: [
              OrderItem(
                name: 'Biriyani',
                image:
                    'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                quantity: 5,
              ),
              OrderItem(
                name: 'Chicken Periperi Mandhi',
                image:
                    'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                quantity: 5,
              ),
              OrderItem(
                name: 'Chicken Biriyani',
                image:
                    'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                quantity: 5,
              ),
            ]),
          ),
        ),
      );
    }
  }

  void mergeOrders() {
    final selectedOrders = orders
        .asMap()
        .entries
        .where((entry) => isSelected[entry.key])
        .map((entry) => entry.value)
        .toList();
    log('Merging Orders: ${selectedOrders.map((o) => o.id).join(', ')}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Running Orders',
          style: TextStyle(fontSize: 19),
        ),
        actions: [
          if (isMultiSelectMode)
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  isMultiSelectMode = false;
                  isSelected = List<bool>.filled(orders.length, false);
                });
              },
            ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: mainclr,
        color: mainclrbg,
        onRefresh: () async {
          log('message');
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 1;
            double width = constraints.maxWidth;

            // Show 2 tiles per row if the width is more than 600px (typical tablet size)
            if (width >= 600) {
              crossAxisCount = 2;
            }

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2.8,
                    ),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return Card(margin: EdgeInsets.all(3),
                    
                    elevation: 5,borderOnForeground: true,shadowColor: const Color.fromARGB(255, 255, 255, 255),
                        child: InkWell(
                          onTap: () => _onTap(index),
                          onLongPress: () => _onLongPress(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: boxbgwhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Container(
                                            width: 5,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: mainclr,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTile(
                                              splashColor: Colors.transparent,
                                              tileColor: Colors.transparent,
                                              onTap: () => _onTap(index),
                                              leading: isMultiSelectMode
                                                  ? Checkbox(
                                                      activeColor: mainclr,
                                                      value: isSelected[index],
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isSelected[index] =
                                                              value!;
                                                        });
                                                      },
                                                    )
                                                  :  Container(
                                                    decoration: BoxDecoration(color: mainclr,borderRadius: BorderRadius.circular(10)),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(10.0),
                                                      child: Icon(Icons.restaurant,color: Color.fromARGB(255, 255, 255, 255),),
                                                    )),

                                              title: Text(
                                                'Order ID: ${orders[index].id}',
                                                style:
                                                    const TextStyle(fontSize: 17),
                                              ),
                                              subtitle: Text(
                                                'Items: ${orders[index].itemCount}, Total: ₹${orders[index].totalPrice}',
                                              ),
                                              trailing: Container(
                                                decoration: BoxDecoration(
                                                  color: mainclr,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(12.0),
                                                  child: Text(
                                                    'TBv3 1',
                                                    style: TextStyle(
                                                      color: const Color.fromARGB(255, 255, 255, 255),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Color.fromARGB(255, 236, 236, 236),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.timer_sharp,
                                              color: Color.fromARGB(
                                                  255, 204, 204, 204),
                                              size: 18,
                                            ),
                                            SizedBox(width: 6),
                                            Text(orders[index].time),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (isMultiSelectMode &&
                    isSelected.where((selected) => selected).length >= 2)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MainButton(
                      label: 'Merge & Print',
                      onpress: () {
                        mergeOrders();
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
