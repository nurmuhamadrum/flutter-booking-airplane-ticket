import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/theme.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destinations;
  const ChooseSeatPage(this.destinations, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 65),
        child: Text(
          'Select Your \nFavorite Seat',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // NOTE: AVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6, left: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_available.png'),
                ),
              ),
            ),
            Text('Available', style: blackTextStyle),
            // NOTE: SELECTED
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6, left: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_selected.png'),
                ),
              ),
            ),
            Text('Selected', style: blackTextStyle),
            // NOTE: UNAVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6, left: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_unavailable.png'),
                ),
              ),
            ),
            Text('Unavailable', style: blackTextStyle),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: keyWhiteColor,
            ),
            child: Column(
              children: [
                // NOTE: ALFABET
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          ' ',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                // NOTE: SEAT 1
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A1'),
                      SeatItem(id: 'B1'),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '1',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(id: 'C1'),
                      SeatItem(id: 'D1'),
                    ],
                  ),
                ),
                // NOTE: SEAT 2
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A2'),
                      SeatItem(id: 'B2'),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(id: 'C2'),
                      SeatItem(id: 'D2'),
                    ],
                  ),
                ),
                // NOTE: SEAT 3
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A3'),
                      SeatItem(id: 'B3'),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '3',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(id: 'C3'),
                      SeatItem(id: 'D3'),
                    ],
                  ),
                ),
                // NOTE: SEAT 4
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A4'),
                      SeatItem(id: 'B4'),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(id: 'C4'),
                      SeatItem(id: 'D4'),
                    ],
                  ),
                ),
                // NOTE: SEAT 5
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A5'),
                      SeatItem(id: 'B5'),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(id: 'C5'),
                      SeatItem(id: 'D5'),
                    ],
                  ),
                ),

                // NOTE: YOUR SEAT
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat: ',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // NOTE: TOTAL
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: ',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        'IDR ${NumberFormat.decimalPattern('id').format(state.length * destinations.price)}',
                        style: purpleTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return CustomButton(
        margin: EdgeInsets.only(top: 30, bottom: 46),
        title: 'Continue to Checkout',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutPage()),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: keyBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [title(), seatStatus(), selectSeat(), checkoutButton()],
      ),
    );
  }
}
