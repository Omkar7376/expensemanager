import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/moneyController.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    MoneyController moneyController = Get.put(MoneyController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey,
        title: Text(
          "Add New Transaction",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Obx(
                    () => DropdownButton(
                      dropdownColor: Colors.white,
                      value: moneyController.transactiontype.value,
                      items: [
                        DropdownMenuItem(
                            value: "Income", child: Text("Income")),
                        DropdownMenuItem(
                            value: "Expense", child: Text("Expense")),
                      ],
                      onChanged: (value) {
                        moneyController.transactiontype.value = value!;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: moneyController.amountController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.currency_rupee, color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                hintText: "Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: moneyController.titleController,
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title, color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                hintText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: moneyController.noteController,
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.note, color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                hintText: "Note",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                moneyController.addTransaction();
                moneyController.printData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Add Transaction",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
