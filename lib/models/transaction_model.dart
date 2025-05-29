import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int amountOfTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  const TransactionModel({
    required this.destination,
    this.id = '',
    this.amountOfTraveler = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        destination: DestinationModel.fromJson(
          json['destination']['id'],
          json['destination'],
        ),
        id: id,
        amountOfTraveler: json['amountOfTraveler'] ?? 0,
        selectedSeat: json['selectedSeat'] ?? '',
        insurance: json['insurance'] ?? false,
        vat: json['vat'] ?? 0,
        refundable: json['refundable'] ?? false,
        price: json['price'] ?? 0,
        grandTotal: json['grandTotal'] ?? 0,
      );

  @override
  List<Object?> get props => [
    destination,
    amountOfTraveler,
    selectedSeat,
    insurance,
    refundable,
    vat,
    price,
    grandTotal,
  ];
}
