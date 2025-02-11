import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:guia_go/core/config/typography.dart';
import 'package:guia_go/core/constants/assets.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/go_now/data/models/motel_model.dart';
import 'package:guia_go/modules/shared/presentation/widgets/button_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/text_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/vertical_spacing_widget.dart';

class MotelWithDiscountCarouselWidget extends StatefulWidget {
  const MotelWithDiscountCarouselWidget({required this.motelWithDiscountList, super.key});
  final List<MotelModel> motelWithDiscountList;

  @override
  State<MotelWithDiscountCarouselWidget> createState() => _MotelWithDiscountCarouselWidgetState();
}

class _MotelWithDiscountCarouselWidgetState extends State<MotelWithDiscountCarouselWidget> {
  CarouselSliderController carouselController = CarouselSliderController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacing(1),
        Expanded(
          child: CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              },
            ),
            items: widget.motelWithDiscountList
                .map(
                  (e) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                    margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        if (e.suiteWithDiscount?.photo != null)
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                e.suiteWithDiscount!.photo!,
                                fit: BoxFit.cover,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(flameIcon, height: 24, width: 24),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            e.fantasia ?? '',
                                            fontSize: context.font_12sp,
                                            textColor: font,
                                            fontWeight: bold,
                                          ),
                                          TextWidget(
                                            e.bairro ?? '',
                                            fontSize: context.font_08sp,
                                            textColor: font,
                                            fontWeight: mediumBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: .5.h),
                                  color: background,
                                  child: Column(
                                    children: [
                                      TextWidget(
                                        e.periodWithDiscount?.formattedDiscount ?? '',
                                        fontWeight: bold,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: .5.h, horizontal: 2.w),
                                        child: Container(
                                          color: white,
                                          height: .1.h,
                                          width: double.infinity,
                                        ),
                                      ),
                                      TextWidget(
                                        e.minorValueFormatted ?? '',
                                        fontSize: context.font_08sp,
                                        fontWeight: mediumBold,
                                      ),
                                    ],
                                  ),
                                ),
                                ButtonWidget(
                                  title: 'reservar',
                                  onPressed: () {},
                                  color: discountLabel,
                                  height: 5.h,
                                  width: double.infinity,
                                  complementText: Padding(
                                    padding: EdgeInsets.only(left: 1.w),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        DotsIndicator(
          dotsCount: widget.motelWithDiscountList.length,
          position: current,
          decorator: DotsDecorator(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            size: const Size(8, 8),
            activeSize: const Size(12, 12),
          ),
        ),
      ],
    );
  }
}
