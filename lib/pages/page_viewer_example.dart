import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../widgets/page_view_widget.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          Text("Skip",style: TextStyle(
            decorationThickness: 4, ),),
          SizedBox(width:5)
        ],
      ),

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: <Widget>[
              PageViewWidget(imagepath: 'assets/images/badges.png', title: 'Certification and Badges', subtitle: 'Earn a certificate after completion of every course', currentPageIndex:  _tabController.index , onUpdateCurrentPageIndex:   updateCurrentPageIndex,),
              PageViewWidget(imagepath: 'assets/images/progress.png', title: 'Progress Tracking', subtitle: 'Check your Progress of every course', currentPageIndex:  _tabController.index , onUpdateCurrentPageIndex:updateCurrentPageIndex,),
              PageViewWidget(imagepath: 'assets/images/offline.png', title: 'Offline Access', subtitle: 'Make your course available offline', currentPageIndex: _tabController.index , onUpdateCurrentPageIndex: updateCurrentPageIndex),
              PageViewWidget(imagepath: 'assets/images/catalog.png', title: 'Course Catalog', subtitle: 'View in which courses you are enrolled', currentPageIndex:  _tabController.index , onUpdateCurrentPageIndex: updateCurrentPageIndex),



            ],
          ),

        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
   
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

 
}
