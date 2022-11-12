import 'package:custom_offer_carousel/custom_offer_carousel.dart';
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
          title: "Custom Offer's Carousel",
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
  List<String> offerImgUrl = [
    "https://images.ctfassets.net/lzny33ho1g45/T5qqQQVznbZaNyxmHybDT/b76e0ff25a495e00647fa9fa6193a3c2/best-url-shorteners-00-hero.png?w=1520&fm=jpg&q=30&fit=thumb&h=760",
    "https://s17233.pcdn.co/blog/wp-content/uploads/2022/02/SMS-Phone-graphic@2x.png",
    "https://t4.ftcdn.net/jpg/02/61/01/87/360_F_261018762_f15Hmze7A0oL58Uwe7SrDKNS4fZIjLiF.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.sp),
              const Text(
                "Custom Offer's Carousel",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20.sp, width: double.infinity),
              CustomOffersSliderWidget(
                offersListCount: offerImgUrl.length,
                offersItemWidgetBuilder: (context, index) {
                  return CustomOffersItemWidget(
                    imageUrl: offerImgUrl[index],
                    onTap: () {},
                  );
                },
              ),
              SizedBox(height: 32.sp),
              CustomOffersSliderWidget(
                options: const OffersCarouselOptions(viewportFraction: 0.82),
                indicatorOptions: const OffersIndicatorOptions(
                  activeColor: Colors.red,
                ),
                offersListCount: offerImgUrl.length,
                offersItemWidgetBuilder: (context, index) {
                  return CustomOffersItemWidget(
                    imageUrl: offerImgUrl[index],
                    onTap: () {},
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
