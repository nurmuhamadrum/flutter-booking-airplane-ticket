import 'package:airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              height: 211,
              width: 300,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: keyPrimaryColor.withAlpha((0.5 * 255).round()),
                    blurRadius: 50,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(fontWeight: light),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_plane.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Pay',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 41),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(fontWeight: light),
                  ),
                  Text(
                    'IDR ${NumberFormat.decimalPattern('id').format(state.user.balance)}',
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
