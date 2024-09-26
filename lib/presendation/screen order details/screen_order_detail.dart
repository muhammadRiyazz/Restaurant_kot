import 'package:flutter/material.dart';

class Orderr {
  final String id;
  final String time;
  final List<OrderItem> items;

  Orderr({
    required this.id,
    required this.time,
    required this.items,
  });
}

class OrderItem {
  final String name;
  final String image;
  int quantity;

  OrderItem({
    required this.name,
    required this.image,
    required this.quantity,
  });
}

class OrderDetailsPage extends StatefulWidget {
  final Orderr order;

  OrderDetailsPage({required this.order});

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late List<OrderItem> _items;
  bool _isPrintKOTEnabled = false;
  bool _isNewItemButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _items = widget.order.items;
  }

  void _changeQuantity(OrderItem item, int change) {
    setState(() {
      item.quantity += change;
      if (item.quantity < 0) item.quantity = 0; // Prevent negative quantity
      _isPrintKOTEnabled = _items.any((i) => i.quantity > 0);
      _isNewItemButtonEnabled = _items.every((i) => i.quantity > 0);
    });
  }

  void _changeTable() {
    // Logic to change the table, show a dialog or navigation for table selection
    // Example confirmation dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Table'),
          content: Text('Select a new table'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _printKOT() {
    // Logic to handle KOT printing based on added and canceled items
    print('Printing KOT...');
  }

  void _printBill() {
    // Logic to navigate to the bill page
    print('Navigating to Bill Page...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            Text('Order Number: ${widget.order.id}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Order Time: ${widget.order.time}',
                style: TextStyle(fontSize: 16)),
            // TextButton(
            //   onPressed: _changeTable,
            //   child: Text('Change Table'),
            // ),
            // SizedBox(height: 16.0),

            // // Item List
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _items.length,
            //     itemBuilder: (context, index) {
            //       final item = _items[index];
            //       return ListTile(
            //         leading: Image.network(item.image,
            //             width: 50,
            //             height: 50), // Replace with asset image if needed
            //         title: Text(item.name),
            //         subtitle: Text('Ordered Quantity: ${item.quantity}'),
            //         trailing: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             IconButton(
            //               icon: Icon(Icons.add),
            //               onPressed: () => _changeQuantity(item, 1),
            //             ),
            //             IconButton(
            //               icon: Icon(Icons.remove),
            //               onPressed: () => _changeQuantity(item, -1),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),

            // // Print KOT Button
            // ElevatedButton(
            //   onPressed: _isPrintKOTEnabled ? _printKOT : null,
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.all(16.0),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: Text('Print KOT'),
            // ),

            // SizedBox(height: 8.0),

            // // New Item Button
            // ElevatedButton(
            //   onPressed: _isNewItemButtonEnabled
            //       ? () {
            //           // Logic to navigate to new item selection
            //           print('Navigating to New Item Selection...');
            //         }
            //       : null,
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.all(16.0),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: Text('New Item'),
            // ),

            // SizedBox(height: 8.0),

            // // Print Bill Button
            // ElevatedButton(
            //   onPressed: _printBill,
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.all(16.0),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: Text('Print Bill'),
            // ),
          ],
        ),
      ),
    );
  }
}
