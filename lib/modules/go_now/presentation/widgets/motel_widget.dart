import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:guia_go/core/config/typography.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/go_now/data/models/motel_model.dart';
import 'package:guia_go/modules/shared/presentation/widgets/horizontal_spacing_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/text_widget.dart';
import 'package:guia_go/modules/shared/presentation/widgets/vertical_spacing_widget.dart';

class MotelWidget extends StatelessWidget {
  const MotelWidget(this.motel, {super.key});
  final MotelModel motel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: const BoxDecoration(
        color: secondPartBackgroundColor,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (motel.logo != null)
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      motel.logo!,
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const HorizontalSpacing(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    motel.fantasia ?? '',
                    fontWeight: mediumBold,
                    fontSize: context.font_16sp,
                  ),
                  TextWidget(
                    motel.bairro ?? '',
                  ),
                  const VerticalSpacing(0.5),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .25.h),
                        decoration: BoxDecoration(
                          color: yellowRating.withAlpha((255.0 * 0.1).round()),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: yellowRating),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: yellowRating, size: 16),
                            const HorizontalSpacing(1),
                            TextWidget(
                              motel.media?.toString() ?? '',
                              fontSize: context.font_10sp,
                              fontWeight: mediumBold,
                            ),
                          ],
                        ),
                      ),
                      const HorizontalSpacing(3),
                      TextWidget(
                        '${motel.qtdAvaliacoes ?? ''} avaliações',
                        fontSize: context.font_10sp,
                        fontWeight: mediumBold,
                      ),
                      const HorizontalSpacing(1),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: font,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const HorizontalSpacing(2),
              const Icon(Icons.favorite, color: favoriteIconNotselected, size: 24),
            ],
          ),
          const VerticalSpacing(1),
          ExpandablePageView(
            children: (motel.suites ?? [])
                .map(
                  (suite) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            if (suite.photo != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  suite.photo!,
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: double.infinity,
                                ),
                              ),
                            const VerticalSpacing(2),
                            TextWidget(
                              suite.nome ?? '',
                              fontWeight: mediumBold,
                              fontSize: context.font_16sp,
                            ),
                            const VerticalSpacing(1),
                          ],
                        ),
                      ),
                      const VerticalSpacing(1),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final totalWidth = constraints.maxWidth;
                            final iconSize = 48 + 2.w;
                            const spacing = 10.0;

                            final textPainter = TextPainter(
                              text: TextSpan(
                                text: 'ver todos',
                                style: TextStyle(
                                  color: seeAll,
                                  fontWeight: mediumBold,
                                  fontSize: context.font_12sp,
                                ),
                              ),
                              maxLines: 1,
                              textDirection: TextDirection.ltr,
                            )..layout();
                            final buttonWidth = textPainter.width + 1 + 16;

                            final maxIcons = ((totalWidth - buttonWidth) / (iconSize + spacing)).floor();

                            final visibleIcons =
                                suite.categoriaItens?.where((e) => e.icone != null).take(maxIcons).toList() ?? [];

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...visibleIcons.map((e) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: spacing),
                                    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: .5.h),
                                    decoration: BoxDecoration(
                                      color: backgroundSeeAll,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Image.network(
                                      e.icone!,
                                      height: 48,
                                      width: 48,
                                    ),
                                  );
                                }),
                                Row(
                                  children: [
                                    TextWidget(
                                      'ver\ntodos',
                                      textAlign: TextAlign.right,
                                      textColor: disabledFont,
                                      fontWeight: mediumBold,
                                      fontSize: context.font_12sp,
                                    ),
                                    const HorizontalSpacing(1),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: disabledFont,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      ...suite.periodos?.map(
                            (suite) => Column(
                              children: [
                                const VerticalSpacing(1),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                TextWidget(
                                                  suite.tempoFormatado ?? '',
                                                  fontSize: context.font_14sp,
                                                ),
                                                if (suite.desconto != null) ...[
                                                  const HorizontalSpacing(3),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 2.w,
                                                      vertical: .25.h,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: white,
                                                      borderRadius: BorderRadius.circular(12),
                                                      border: Border.all(color: discountLabel),
                                                    ),
                                                    child: TextWidget(
                                                      suite.discountValue ?? '',
                                                      fontSize: context.font_10sp,
                                                      fontWeight: mediumBold,
                                                      textColor: discountLabel,
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                if (suite.desconto != null) ...[
                                                  TextWidget(
                                                    suite.formattedValue!,
                                                    textColor: disabledFont,
                                                    textDecoration: TextDecoration.lineThrough,
                                                    fontSize: context.font_16sp,
                                                  ),
                                                  const HorizontalSpacing(5),
                                                ],
                                                TextWidget(
                                                  suite.formattedTotalValue ?? '',
                                                  fontSize: context.font_16sp,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const HorizontalSpacing(5),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: disabledFont,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ) ??
                          [],
                      const VerticalSpacing(1),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
