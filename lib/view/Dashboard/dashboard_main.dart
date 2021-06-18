import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout/Widgets/HomePage/category_card.dart';
import 'package:workout/Widgets/HomePage/health_tips.dart';
import 'package:workout/Widgets/HomePage/appbar_dashboard.dart';
import 'package:workout/Widgets/HomePage/Slider/slider_dashboard.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                appbarDashboard(),
                Expanded(flex: 2, child: dashBoardSlider()),
                categoryCard(),
                Expanded(flex: 2, child: categoryHomeCard(context)),
                Expanded(flex: 2, child: healthNews()),
              ],
            ),
          )),
    );
  }
}
