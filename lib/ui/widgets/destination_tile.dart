import 'package:airplane/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DestinationTile extends StatelessWidget {
  final String title;
  final String city;
  final String imageUrl;
  final double rating;

  const DestinationTile({
    super.key,
    required this.title,
    required this.city,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        ),
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: keyWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    city,
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
                Text(rating.toString(), style: blackTextStyle.copyWith(fontWeight: medium)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
