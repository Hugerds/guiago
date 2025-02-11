import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/go_now/presentation/providers/go_now_provider.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/filter_widget.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/header_widget.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/map_button_widget.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/motel_widget.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/motel_with_discount_carousel_widget.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/shimmer_widget.dart';
import 'package:provider/provider.dart';

class GoNowPage extends StatefulWidget {
  const GoNowPage({super.key});

  @override
  State<GoNowPage> createState() => _GoNowPageState();
}

class _GoNowPageState extends State<GoNowPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(context.read<GoNowProvider>().getMotelList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryRed,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const MapButtonWidget(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: primaryRed,
              ),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: firstPartBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 85.h,
                child: RefreshIndicator(
                  onRefresh: () async => context.read<GoNowProvider>().getMotelList(),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Consumer<GoNowProvider>(
                      builder: (context, provider, child) {
                        if (provider.isLoading) {
                          return const ShimmerWidget();
                        }
                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: SizedBox(
                                height: 30.h,
                                child: MotelWithDiscountCarouselWidget(
                                  motelWithDiscountList: provider.motelWithDiscountList,
                                ),
                              ),
                            ),
                            const PinnedHeaderSliver(
                              child: FilterWidget(),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final motel = provider.motelList[index];
                                  return MotelWidget(motel);
                                },
                                childCount: provider.motelList.length,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const HeaderWidget(),
          ],
        ),
      ),
    );
  }
}
