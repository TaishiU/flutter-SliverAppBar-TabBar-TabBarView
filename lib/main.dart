import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabViewTwo(),
    );
  }
}

class TabViewTwo extends StatefulWidget {
  @override
  _TabViewTwoState createState() => _TabViewTwoState();
}

class _TabViewTwoState extends State<TabViewTwo> {
  List<Tab> _tabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      Tab(
        icon: Icon(Icons.map),
        text: "Tab1",
      ),
      Tab(
        icon: Icon(Icons.camera_alt),
        text: "Tab2",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("TabViewTwo"),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    tabs: _tabs,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                  ),
                ),
                pinned: true,
              )
            ];
          },
          body: TabBarView(
            children: ["ABCDE", "12345"]
                .map((value) => Center(
                      child: Text("$value"),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      child: tabBar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
