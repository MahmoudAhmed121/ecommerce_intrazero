import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
    required this.itemSize,
    required this.ignoreGestures,
    required this.currentRating,
  });

  final double itemSize;
  final bool ignoreGestures;
  final double? currentRating;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: currentRating ?? 0.0,
      direction: Axis.horizontal,
      allowHalfRating: false,
      ignoreGestures: ignoreGestures,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: SvgPicture.asset('assets/images/star_two.svg'),
        half: SvgPicture.asset('assets/images/star_two.svg'),
        empty: SvgPicture.asset('assets/images/empty_star.svg'),
      ),
      glowColor: Theme.of(context).scaffoldBackgroundColor,
      itemSize: itemSize,
      onRatingUpdate: (rating) {
        debugPrint(rating.toString());
      },
    );
  }
}
