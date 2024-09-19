import 'package:assessment/add_item_page.dart';
import 'package:assessment/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assessment/item_page.dart';

class SalePage extends StatefulWidget {
  @override
  _SalePageState createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  String paymentMethod = "Credit";
  final _customerController = TextEditingController();
  final _billingController = TextEditingController();
  final _phoneController = TextEditingController();
  final _invoiceNumber = "23-24-01 16"; // example invoice number
  final _date = "17/09/2024"; // example date
  final _firmName = "xianinfotech LLP"; // example firm name
  double totalAmount = 0.0; // Example total amount

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sale'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Settings action
            },
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Invoice No: $_invoiceNumber"),
                Text("Date: $_date"),
              ],
            ),
            SizedBox(height: 8.0),
            Text("Firm Name: $_firmName"),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: paymentMethod,
              items: [
                DropdownMenuItem(
                  child: Text("Credit"),
                  value: "Credit",
                ),
                DropdownMenuItem(
                  child: Text("Cash"),
                  value: "Cash",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  paymentMethod = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Payment Method',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _customerController,
              decoration: InputDecoration(
                labelText: "Customer *",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _billingController,
              decoration: InputDecoration(
                labelText: "Billing Name (Optional)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddItemPage()), // Navigate to AddItemPage
                );
              },
              icon: Icon(Icons.add),
              label: Text('Add Items (Optional)'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Total Amount: ₹$totalAmount"),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Save & New logic (implement as per requirement)
                    },
                    child: Text('Save & New'),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SalesPage()), // Navigate to SalePage
          );
                      // Save sale and return to HomePage with the new sale
                      final newSale = Sale(
                        customerName: _customerController.text,
                        billingName: _billingController.text,
                        phoneNumber: _phoneController.text,
                        subtotal: totalAmount, // Example total amount
                      );
                      // Navigator.pop(context, newSale); // Return the sale object to HomePage
                    },
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
