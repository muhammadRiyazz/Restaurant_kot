import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';

class ProductChoosingPage extends StatefulWidget {
  @override
  _ProductChoosingPageState createState() => _ProductChoosingPageState();
}

class _ProductChoosingPageState extends State<ProductChoosingPage> {
  // Sample product list
  List<Product> products = [
    Product(
        'Malabari Biriyani ',
        100.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
    Product(
        'Priperi Chicken',
        150.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
    Product(
        'Malabar Chicken Mandhi',
        200.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
    Product(
        'Priperi Chicken',
        150.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
    Product(
        'Priperi Chicken',
        150.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
  ];

  // Selected products
  List<Product> selectedProducts = [];

  // Search query
  String searchQuery = '';

  // Selected category
  String? selectedCategory;

  // Method to filter products based on search query
  List<Product> get filteredProducts {
    if (searchQuery.isEmpty) {
      return products;
    } else {
      return products
          .where((product) =>
              product.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  // Method to navigate to the selected products page
  void navigateToSelectedProductsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedProductsPage(selectedProducts),
      ),
    );
  }

  // Method to show category selection bottom sheet
  void showCategoryBottomSheet() async {
    final selectedCategory = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return CategoryBottomSheet();
      },
    );

    if (selectedCategory != null) {
      setState(() {
        this.selectedCategory = selectedCategory;
      });
    }
  }

  // Method to handle long press and input custom quantity
  void showQuantityInput(Product product) {
    TextEditingController quantityController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Quantity'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter quantity"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  product.quantity = int.parse(quantityController.text);
                  if (!selectedProducts.contains(product)) {
                    selectedProducts.add(product);
                  } else {
                    // Update the quantity of the existing product
                    selectedProducts.firstWhere((p) => p == product).quantity =
                        product.quantity;
                  }
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
        backgroundColor: appbarbg,
        title: Center(
            child: Text(
          'Select Products',
          style: TextStyle(fontSize: 18),
        )),
        actions: [
          // Navigation to selected products page
          SizedBox(
            width: 60,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: boxbgwhite, borderRadius: BorderRadius.circular(0)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        child: InkWell(
                          onTap: () {
                            showCategoryBottomSheet();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'All Category',
                                style: TextStyle(
                                    color: mainclr,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_drop_up_rounded,
                                color: mainclr,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: const Color.fromARGB(255, 234, 234, 234),
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true, // Fills the background
                          fillColor: mainclrbg, // Set background color to white
                          labelText: 'Search',
                          labelStyle: TextStyle(
                            color: mainclr, // Set label color to green
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: mainclr, // Set icon color to green
                          ),
                          // Remove any visible borders and add 15.0 radius
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Rounded corners with radius 15
                            borderSide: BorderSide.none, // No border
                          ),
                          // When the TextField is focused, keep the borderless style
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Rounded corners with radius 15
                            borderSide: BorderSide.none, // No border on focus
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Rounded corners with radius 15
                            borderSide:
                                BorderSide.none, // No border when enabled
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(backgroundColor: mainclr,
      color: mainclrbg,
      onRefresh: () async {
        log('message');
      },
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                color: boxbgwhite,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        height: 100,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: boxbgclr,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            product.image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        product.name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text('₹ ${product.price}/-'),
                                      ),
                                      trailing: Container(
                                          decoration: BoxDecoration(
                                              color: mainclrbg,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('Biriyani'),
                                          )),
                                      onLongPress: () {
                                        showQuantityInput(product);
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        height: 0,
                                        color: const Color.fromARGB(
                                            255, 240, 240, 240),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5, right: 10, top: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Container(
                                                  decoration: BoxDecoration(
                                                      color: mainclr,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 6),
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                              onPressed: () {
                                                setState(() {
                                                               if (product.quantity == 1) {
                                          // Remove the product if its quantity is 1
                                          selectedProducts.remove(product);
                                        }
                                                  if (product.quantity > 0)
                                                    product.quantity--;
                        
                                          
                                                });
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                '${product.quantity}',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Container(
                                                  decoration: BoxDecoration(
                                                      color: mainclr,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 6),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                              onPressed: () {
                                                setState(() {
                                                  product.quantity++;
                                                  if (!selectedProducts
                                                      .contains(product)) {
                                                    selectedProducts.add(product);
                                                  } else {
                                                    // Update the quantity of the existing product
                                                    selectedProducts
                                                            .firstWhere((p) =>
                                                                p == product)
                                                            .quantity =
                                                        product.quantity;
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            selectedProducts.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 7, right: 10, left: 10),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: mainclr,
                          ),
                          child: ListTile(
                            onTap: () {
                              // navigateToSelectedProductsPage();
                            },
                            title: Text(
                              '${selectedProducts.length} Items Added',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'View',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

// Product model
class Product {
  String name;
  double price;
  String image;
  int quantity;

  Product(this.name, this.price, this.image, this.quantity);
}

// Selected Products Page
class SelectedProductsPage extends StatelessWidget {
  final List<Product> selectedProducts;

  SelectedProductsPage(this.selectedProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Products'),
      ),
      body: ListView.builder(
        itemCount: selectedProducts.length,
        itemBuilder: (context, index) {
          final product = selectedProducts[index];
          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.name),
            subtitle: Text('Quantity: ${product.quantity}'),
          );
        },
      ),
    );
  }
}

// Bottom Sheet for Category Selection
class CategoryBottomSheet extends StatelessWidget {
  final List<Category> categories = [
    Category('Category 1',
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg'),
    Category('Category 2',
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg'),
    Category('Category 3',
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg'),
    Category('Category 1',
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg'),
    Category('Category 2',
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg'),
    Category('Category 3',
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg'),
    Category('Category 1',
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg'),
    Category('Category 2',
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * 0.9, // Max height 90% of screen
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          // Handle grip (optional)
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
            margin: EdgeInsets.only(bottom: 16),
          ),
          // Title
          Text(
            'Select Category',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          // GridView of Categories
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: .9,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    // Return the selected category and close bottom sheet
                    Navigator.pop(context, category.name);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(category.image,
                                height: 80, fit: BoxFit.fill),
                          ),
                          SizedBox(height: 8),
                          Text(category.name),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Category model
class Category {
  String name;
  String image;

  Category(this.name, this.image);
}
