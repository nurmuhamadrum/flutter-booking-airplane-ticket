import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  // NOTE: 0 = AVAILABLE, 1 = SELECTED, 2 = UNAVAILABLE
  final int status;
  const SeatItem({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (status) {
        case 0:
          return keyAvailableColor;
        case 1:
          return keyPrimaryColor;
        case 2:
          return keyUnavailableColor;
        default:
          return keyUnavailableColor;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return keyPrimaryColor;
        case 1:
          return keyPrimaryColor;
        case 2:
          return keyUnavailableColor;
        default:
          return keyUnavailableColor;
      }
    }

    child() {
      switch (status) {
        case 0:
          return SizedBox();
        case 1:
          return Center(
            child: Text(
              'You',
              style: whiteTextStyle.copyWith(fontWeight: semiBold),
            ),
          );
        case 2:
          return SizedBox();
        default:
          return SizedBox();
      }
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor(), width: 2),
      ),
      child: child(),
    );
  }
}
