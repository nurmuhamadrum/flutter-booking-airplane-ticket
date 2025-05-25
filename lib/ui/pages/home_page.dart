import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdie,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/image_profile.png'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCard(
                title: 'Lake Ciliwung',
                city: 'Bekasi',
                imageUrl: 'assets/image_destination_1.png',
                rating: 4.5,
              ),
              DestinationCard(
                title: 'Lake Cimahi',
                city: 'Cimahi',
                imageUrl: 'assets/image_destination_2.png',
                rating: 4.8,
              ),
              DestinationCard(
                title: 'Pantai Kejawanan',
                city: 'Cirebon',
                imageUrl: 'assets/image_destination_3.png',
                rating: 4.2,
              ),
              DestinationCard(
                title: 'Gereja Tua',
                city: 'Bandung',
                imageUrl: 'assets/image_destination_4.png',
                rating: 4.6,
              ),
              DestinationCard(
                title: 'Pohon Dewa',
                city: 'Surabaya',
                imageUrl: 'assets/image_destination_5.png',
                rating: 3.1,
              ),
            ],
          ),
        ),
      );
    }

    Widget newDestination() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            DestinationTile(
              title: 'Danau Beratan',
              city: 'Singaraja',
              imageUrl: 'assets/image_destination_6.png',
              rating: 4.2,
            ),
            DestinationTile(
              title: 'Sydney',
              city: 'Australia',
              imageUrl: 'assets/image_destination_7.png',
              rating: 4.7,
            ),
            DestinationTile(
              title: 'Roma',
              city: 'Italia',
              imageUrl: 'assets/image_destination_8.png',
              rating: 4.3,
            ),
            DestinationTile(
              title: 'Hill Hey',
              city: 'Monaco',
              imageUrl: 'assets/image_destination_9.png',
              rating: 4.2,
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [header(), popularDestination(), newDestination()],
    );
  }
}
