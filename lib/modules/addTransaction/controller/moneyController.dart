import 'package:expensemanager/data/model/transactionModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MoneyController extends GetxController {
  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  RxString transactiontype = "Income".obs;
  RxInt availableBalance = 0.obs;
  RxInt incomeBalance = 0.obs;
  RxInt expenseBalance = 0.obs;
  RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  void addTransaction() {
    final int? amount = int.tryParse(amountController.text);
    if (amount == null) {
      Get.snackbar("Error", "Invalid amount");
    }
    TransactionModel newTransaction = new TransactionModel(
      id: DateTime.now().toIso8601String(),
      amount: (int.parse(amountController.text)),
      title: titleController.text,
      note: noteController.text,
      transactionType: transactiontype.value,
    );

    if (transactiontype.value == "Income") {
      incomeBalance.value += amount!;
      availableBalance.value += amount;
    } else {
      expenseBalance.value += amount!;
      availableBalance.value -= amount;
    }

    transactions.add(newTransaction);
    amountController.clear();
    titleController.clear();
    noteController.clear();
  }

  void printData() {
    print(transactions[0].title);
  }
}
