import 'package:assessment/add_item_page.dart';
import 'package:flutter/material.dart';

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items to Sale'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
      Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Item Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Item Name',
                hintText: 'e.g. Chocolate Cake',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Quantity and Unit Row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Unit',
                      border: OutlineInputBorder(),
                    ),
                    items: ['kg', 'litre', 'piece']
                        .map((String unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit),
                            ))
                        .toList(),
                    onChanged: (value) {
                      // Handle unit change
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Rate and Tax Status Row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Rate (Price/Unit)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Tax',
                      border: OutlineInputBorder(),
                    ),
                    items: ['With Tax', 'Without Tax']
                        .map((String taxOption) => DropdownMenuItem(
                              value: taxOption,
                              child: Text(taxOption),
                            ))
                        .toList(),
                    onChanged: (value) {
                      // Handle tax option change
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            // Save & New and Save Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                    ),
                    onPressed: () {
                      // Handle Save & New button press
                    },
                    child: Text(
                      'Save & New',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                   onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SalesPage()), // Navigate to SalePage
          );
        },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
