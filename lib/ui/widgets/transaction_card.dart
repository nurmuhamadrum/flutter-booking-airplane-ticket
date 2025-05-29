import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/ui/widgets/booking_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/theme.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: keyWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(transaction.destination.imageUrl),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_star.png'),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ],
          ),

          // NOTE: BOOKING DETAIL
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // NOTE: DETAIL ITEM
          BookingDetailItem(
            title: 'Traveler',
            valueText: '${transaction.amountOfTraveler} Person',
            valueColor: keyBlackColor,
          ),
          BookingDetailItem(
            title: 'Seat',
            valueText: transaction.selectedSeat,
            valueColor: keyBlackColor,
          ),
          BookingDetailItem(
            title: 'Insurance',
            valueText: transaction.insurance ? 'YES' : 'NO',
            valueColor: transaction.insurance ? keyGreenColor : keyRedColor,
          ),
          BookingDetailItem(
            title: 'Refundable',
            valueText: transaction.refundable ? 'YES' : 'NO',
            valueColor: transaction.refundable ? keyGreenColor : keyRedColor,
          ),
          BookingDetailItem(
            title: 'VAT',
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            valueColor: keyBlackColor,
          ),
          BookingDetailItem(
            title: 'Price',
            valueText:
                'IDR ${NumberFormat.decimalPattern('id').format(transaction.price)}',
            valueColor: keyBlackColor,
          ),
          BookingDetailItem(
            title: 'Grand Total',
            valueText:
                'IDR ${NumberFormat.decimalPattern('id').format(transaction.grandTotal)}',
            valueColor: keyPrimaryColor,
          ),
        ],
      ),
    );
  }
}
