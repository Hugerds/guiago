import 'package:flutter/material.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/item_tab_bar_widget.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          32,
        ),
        color: darkRed,
      ),
      child: TabBar(
        onTap: (_) {
          setState(() {});
        },
        controller: _tabController,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            32,
          ),
          color: white,
        ),
        unselectedLabelColor: Colors.black,
        tabs: [
          ItemTabBarWidget(active: _tabController.index == 0, icon: Icons.location_on, label: 'ir agora'),
          ItemTabBarWidget(
            active: _tabController.index == 1,
            icon: Icons.calendar_today,
            label: 'ir outro dia',
          ),
        ],
      ),
    );
  }
}
