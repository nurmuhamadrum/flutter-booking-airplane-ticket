import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final CollectionReference _transactionReference = FirebaseFirestore.instance
      .collection('transactions');

  // set data user to firestore firebase
  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'amounOfTraveler': transaction.amountOfTraveler,
        'selectedSeat': transaction.selectedSeat,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
          e.id,
          e.data() as Map<String, dynamic>,
        );
      }).toList();
      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
