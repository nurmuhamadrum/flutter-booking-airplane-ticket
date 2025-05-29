import 'package:airplane/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  // NOTE: 0 = AVAILABLE, 1 = SELECTED, 2 = UNAVAILABLE
  final bool isAvailable;
  final String id;
  const SeatItem({super.key, this.isAvailable = true, required this.id});

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelectSeat(id);

    backgroundColor() {
      if (!isAvailable) {
        return keyUnavailableColor;
      } else {
        if (isSelected) {
          return keyPrimaryColor;
        } else {
          return keyAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return keyUnavailableColor;
      } else {
        return keyPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'You',
            style: whiteTextStyle.copyWith(fontWeight: semiBold),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor(), width: 2),
        ),
        child: child(),
      ),
    );
  }
}
