import 'package:flutter/material.dart';

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

class OrdersPage extends StatelessWidget {
  final String tableName;
  final List<Order> orders;

  OrdersPage({required this.tableName, required this.orders});

  void _navigateToOrderDetails(BuildContext context, Order order) {
    // Navigate to the Order Details Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsPage(order: order),
      ),
    );
  }

  void _navigateToProductChoosing(BuildContext context) {
    // Logic to navigate to the product choosing page
    print('Navigating to Product Choosing Page...');
    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ProductChoosingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders - $tableName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            Text('Table: $tableName', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Total Orders: ${orders.length}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16.0),

            // Order List
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return ListTile(
                    title: Text('Order Number: ${order.id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order Time: ${order.time}'),
                        Text('Item Count: ${order.itemCount}'),
                        Text('Total Price: ₹${order.totalPrice.toStringAsFixed(2)}'),
                      ],
                    ),
                    onTap: () => _navigateToOrderDetails(context, order),
                  );
                },
              ),
            ),

            // New Order Button
            ElevatedButton(
              onPressed: () => _navigateToProductChoosing(context),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('New Order'),
            ),
          ],
        ),
      ),
    );
  }
}

// Assuming OrderDetailsPage is defined elsewhere
class OrderDetailsPage extends StatelessWidget {
  final Order order;

  OrderDetailsPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details - ${order.id}'),
      ),
      body: Center(
        child: Text('Order details go here...'), // Implement the order details here
      ),
    );
  }
}
