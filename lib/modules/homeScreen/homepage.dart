import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../addTransaction/controller/moneyController.dart';
import '../addTransaction/view/addTransaction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MoneyController moneyController = Get.put(MoneyController());
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          "Money Manager",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTransactionPage());
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 400,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Available Balance",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Obx(
                    () => Text(
                      "Rs. ${moneyController.availableBalance.value}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 250,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Income",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Obx(
                                () => Text(
                                  "Rs. ${moneyController.incomeBalance.value}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: 250,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Expense",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Obx(
                                () => Text(
                                  "Rs. ${moneyController.expenseBalance.value}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(children: [Text("Recent Transactions")]),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: moneyController.transactions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      //height: 80,
                      decoration: BoxDecoration(
                        //color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.receipt,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                moneyController.transactions[index].title,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(moneyController.transactions[index].note),
                            ],
                          ),
                          Spacer(),
                          Text(
                            moneyController
                                        .transactions[index].transactionType ==
                                    "Expense"
                                ? "-"
                                : "+",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: moneyController.transactions[index]
                                          .transactionType ==
                                      "Expense"
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                          Icon(Icons.currency_rupee,
                              color: moneyController.transactions[index]
                                          .transactionType ==
                                      "Expense"
                                  ? Colors.red
                                  : Colors.green,
                              size: 18),
                          Text(
                            moneyController.transactions[index].amount
                                .toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: moneyController.transactions[index]
                                            .transactionType ==
                                        "Expense"
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
