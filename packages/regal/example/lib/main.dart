import 'package:bot_toast/bot_toast.dart';
import 'package:example/screens/ledger_colors_screen.dart';
import 'package:example/screens/snackbar_screen.dart';
import 'package:example/widgets/ledger_buttons.dart';
import 'package:example/widgets/regal_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:regal/regal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/typography_screen.dart';

late final SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Regal.enableTracking = false;
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) => RegalThemeProvider(
        prefs: prefs,
        builder: (context, themeMode, child) => MaterialApp(
          title: 'Custom Home Grid',
          themeMode: themeMode,
          theme: kThemeData,
          darkTheme: kDarkThemeData,
          builder: BotToastInit(),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _bankIconUrls = [
    "https://1000logos.net/wp-content/uploads/2016/10/Barclays-Logo.png",
    "https://www.financialexpress.com/wp-content/uploads/2022/08/HSBC-Bank.jpg",
    "https://d3atsf3fgek2rw.cloudfront.net/content/uploads/2013/09/LLOYS.jpg",
    "https://financialit.net/sites/default/files/nwlogostposcmyk-1.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4FJuUznkKg2vGQBdDMiqMX-k5bW4-n4HJJTkiXaDz193UhEZzEVTRZ5ZUvcgSmC09XLw&usqp=CAU",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Banco_Santander_Logotipo.svg/2560px-Banco_Santander_Logotipo.svg.png",
  ];

  List<String> offerImgUrl = [
    "https://images.ctfassets.net/lzny33ho1g45/T5qqQQVznbZaNyxmHybDT/b76e0ff25a495e00647fa9fa6193a3c2/best-url-shorteners-00-hero.png?w=1520&fm=jpg&q=30&fit=thumb&h=760",
    "https://s17233.pcdn.co/blog/wp-content/uploads/2022/02/SMS-Phone-graphic@2x.png",
    "https://t4.ftcdn.net/jpg/02/61/01/87/360_F_261018762_f15Hmze7A0oL58Uwe7SrDKNS4fZIjLiF.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        final state = context.select((ThemeMode mode) => mode);
        return CupertinoSegmentedControl<ThemeMode>(
          children: Map.fromEntries(
            ThemeMode.values.map(
              (e) => MapEntry(
                  e,
                  Padding(
                    padding: Spacing.tiny.all,
                    child: Text(e.name),
                  )),
            ),
          ),
          groupValue: state,
          onValueChanged: context.themeModeNotifier.onValueChanged,
        );
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: Spacing.small.x,
          child: Column(
            children: [
              Spacing.medium.yBox,
              RegalTextField(
                label: 'Test label',
                controller: TextEditingController(),
              ),
              Form(
                child: RegalTextField(
                  label: 'Test label',
                  controller: TextEditingController(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              RegalButton.primary(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LedgerColorsScreen(),
                  ));
                },
                label: ('Ledger Colors'),
                trackLabel: 'Go to Ledger Colors',
              ),
              Spacing.medium.yBox,
              RegalButton.primary(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TypographyScreen(),
                  ));
                },
                label: ('Typography'),
                trackLabel: 'Go to typography',
              ),
              Spacing.medium.yBox,
              RegalButton.primary(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SnackbarScreen(),
                  ));
                },
                label: ('Snackbar'),
                trackLabel: 'Go to snackbar',
              ),
              Spacing.medium.yBox,
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
              ),
              Spacing.large.yBox,
              RegalSwitch(
                trackLabel: 'Switch',
                value: true,
                onChanged: (t) {},
                semanticsLabel: 'Switch',
              ),
              Spacing.large.yBox,
              const RegalButtons(),
              Spacing.large.yBox,
              const LedgerButtons(),
              Spacing.large.yBox,
              SupportedBankSlider(bankIconUrlList: _bankIconUrls),
              Spacing.large.yBox,
              CarouselSlider(
                offersListCount: offerImgUrl.length,
                options: CarouselOptions(),
                offersItemWidgetBuilder: (context, index) {
                  return CarouselItemWidget(
                    imageUrl: offerImgUrl[index],
                  );
                },
              ),
              Spacing.large.yBox,
              CarouselSlider(
                options: CarouselOptions(),
                indicatorOptions: const IndicatorOptions(
                  activeColor: Colors.red,
                ),
                offersListCount: offerImgUrl.length,
                offersItemWidgetBuilder: (context, index) {
                  return CarouselItemWidget(
                    imageUrl: offerImgUrl[index],
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
