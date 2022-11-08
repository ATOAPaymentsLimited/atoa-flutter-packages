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
      body: Padding(
        padding: EdgeInsets.all(8.sp),
        child: SafeArea(
          child: Column(
            children: [
              const Text("Custom Navigation Grid"),
              SizedBox(
                height: 20.sp,
              ),
              GridView.count(
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
                    title: "Transactions",
                    bgColor: Colors.blue,
                    icon: const Icon(Icons.poll_rounded),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
