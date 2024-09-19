import 'package:assessment/homescreen.dart';
import 'package:flutter/material.dart';

class SalesPage extends StatefulWidget {
  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  TextEditingController customerController = TextEditingController();
  TextEditingController billingController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sale'),
        leading: GestureDetector(
          onTap: (){
             Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
        actions: [
          Icon(Icons.settings),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Invoice and Date Information
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Invoice No: 23-24-01', style: TextStyle(fontSize: 16)),
                  Text('Date: 17/09/2024', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 10),
              // Firm Name
              Text('Firm Name: xianinfotech LLP',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

              // Customer Name Field
              TextField(
                controller: customerController,
                decoration: InputDecoration(
                  labelText: 'Customer *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Billing Name Field (Optional)
              TextField(
                controller: billingController,
                decoration: InputDecoration(
                  labelText: 'Billing Name (Optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Phone Number Field
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),

              // Billed Items Section
              Text(
                'Billed Items',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('.in domain renewal fee', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Qty: 1', style: TextStyle(fontSize: 16)),
                          Text('Subtotal: ₹690', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount: 0%', style: TextStyle(fontSize: 16)),
                          Text('Tax: 0%', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Subtotal and other summary details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Qty: 1.0', style: TextStyle(fontSize: 16)),
                  Text('Subtotal: ₹690', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),

              // Save buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Save & New logic
                    },
                    child: Text('Save & New'),
                  ),
                  ElevatedButton(
                      onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()), // Navigate to SalePage
          );
        },
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
