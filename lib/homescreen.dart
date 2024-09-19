import 'package:assessment/sale_page.dart';
import 'package:flutter/material.dart';

// Define common colors and styles as constants
const kPrimaryColor = Colors.red;
const kSecondaryColor = Colors.amber;
const kTextColor = Colors.black;
const kButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List to hold sales data
  List<Sale> salesList = [];

  // Method to add a new sale
  void addSale(Sale sale) {
    setState(() {
      salesList.add(sale);
    });
  }

  // Method for handling navigation taps
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildHeaderButtons(),
          buildSearchBar(),
          Expanded(
            child: salesList.isEmpty
                ? Center(child: Text('No sales available. Add a new sale!'))
                : buildSalesList(),
          ),
          buildAddSaleButton(), // Only Add New Sale button
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  // AppBar
  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'xianinfotech LLP',
        style: TextStyle(color: kTextColor),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        const Icon(Icons.notifications),
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.green),
          onPressed: () {},
        ),
      ],
    );
  }

  // Header Buttons
  Padding buildHeaderButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildHeaderButton('Transaction Details', Colors.red.shade100),
          buildHeaderButton('Party Details', Colors.grey.shade200),
        ],
      ),
    );
  }

  TextButton buildHeaderButton(String label, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      child: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: kTextColor,
        backgroundColor: backgroundColor,
        shape: kButtonShape,
      ),
    );
  }

  // Search Bar
  Padding buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search for a transaction',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // Sales List
  ListView buildSalesList() {
    return ListView.builder(
      itemCount: salesList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(salesList[index].customerName),
          subtitle: Text(
              'Phone: ${salesList[index].phoneNumber} | Total: ₹${salesList[index].subtotal}'),
        );
      },
    );
  }

  // Add Sale Button
  Padding buildAddSaleButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () async {
          final sale = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SalePage()),
          );
          if (sale != null) {
            addSale(sale);
          }
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add New Sale',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: kButtonShape,
          minimumSize: Size(double.infinity, 50), // Make button full width
        ),
      ),
    );
  }

  // Bottom Navigation Bar
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Items',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.crop),
          label: 'Get Premium',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      onTap: _onItemTapped,
    );
  }
}

// Sale model to store sale details
class Sale {
  final String customerName;
  final String billingName;
  final String phoneNumber;
  final double subtotal;

  Sale({
    required this.customerName,
    required this.billingName,
    required this.phoneNumber,
    required this.subtotal,
  });
}
