import 'package:custom_navigation_card/custom_navigation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp(
          title: 'Custom Home Grid',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Custom Navigation Card",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20.sp),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 100.sp / 73.sp,
                  crossAxisSpacing: 17.5.sp,
                  mainAxisSpacing: 16.sp,
                  shrinkWrap: true,
                  children: [
                    CustomNavigationCard(
                      title: "Transactions",
                      icon: const Icon(Icons.poll_rounded),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      title: "Scan QR",
                      backgroundColor: const Color(0xff2767C6),
                      foregroundColor: Colors.white,
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      highlightCard: true,
                      title: "Transactions",
                      icon: const Icon(Icons.poll_rounded),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      highlightCard: true,
                      chipTitle: "44",
                      title: "Transactions",
                      icon: const Icon(Icons.poll_rounded),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      showFocusLines: true,
                      title: "Transactions",
                      icon: const Icon(Icons.ac_unit_rounded),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      chipTitle: "3",
                      title: "Rewards",
                      icon: const Icon(Icons.gif_box_rounded),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      showFocusLines: true,
                      focusLinesgradientColor: Colors.blueAccent,
                      title: "Tips",
                      icon: const Icon(Icons.savings_outlined),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      highlightCard: true,
                      title: "Analytics",
                      icon: const Icon(Icons.analytics_outlined),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      showFocusLines: true,
                      focusLinesgradientColor: Colors.redAccent,
                      highlightCard: true,
                      borderColor: Colors.redAccent,
                      title: "Settings",
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      title: "Scan QR",
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      highlightCard: true,
                      borderColor: Colors.purpleAccent.withOpacity(0.4),
                      title: "Rewards",
                      icon: const Icon(Icons.gif_box_rounded),
                      onPressed: () {},
                    ),
                    CustomNavigationCard(
                      showFocusLines: true,
                      title: "Transactions",
                      icon: const Icon(Icons.ac_unit_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),
              const Text(
                "Custom Navigation Card . Tile",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20.sp),
              CustomNavigationCard.tile(
                title: "Settings",
                subTitle: "Manage your app settings",
                icon: Container(
                  height: 48.sp,
                  width: 48.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Center(
                    child: Icon(Icons.settings),
                  ),
                ),
                onPressed: () {},
              ),
              CustomNavigationCard.tile(
                title: "About",
                subTitle: "About your app",
                icon: Container(
                  height: 48.sp,
                  width: 48.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Center(
                    child: Icon(Icons.info),
                  ),
                ),
                onPressed: () {},
              ),
              CustomNavigationCard.tile(
                title: "Manage",
                subTitle: "App Lock, Manage",
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
                subTitleTextColor: Colors.black87,
                icon: Container(
                  height: 48.sp,
                  width: 48.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: const Center(
                    child: Icon(Icons.info),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
