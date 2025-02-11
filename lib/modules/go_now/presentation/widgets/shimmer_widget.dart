import 'package:flutter/material.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/shared/presentation/widgets/horizontal_spacing_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/vertical_spacing_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: firstGradient,
              highlightColor: secondGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 32.h,
              ),
            ),
            const VerticalSpacing(3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    width: 20.w,
                    height: 8.h,
                  ),
                ),
                const HorizontalSpacing(5),
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: firstGradient,
                    highlightColor: secondGradient,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 16.h,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpacing(3),
            Shimmer.fromColors(
              baseColor: firstGradient,
              highlightColor: secondGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 32.h,
              ),
            ),
            const VerticalSpacing(1),
            Shimmer.fromColors(
              baseColor: firstGradient,
              highlightColor: secondGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 8.h,
              ),
            ),
            const VerticalSpacing(1),
            Shimmer.fromColors(
              baseColor: firstGradient,
              highlightColor: secondGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 12.h,
              ),
            ),
            const VerticalSpacing(1),
            Shimmer.fromColors(
              baseColor: firstGradient,
              highlightColor: secondGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 8.h,
              ),
            ),
            const VerticalSpacing(1),
            Shimmer.fromColors(
              baseColor: firstGradient,
              highlightColor: secondGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 8.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
