import 'package:doctor/auth/presentation/screens/onBoardingThird.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingSecond extends StatefulWidget {
  const OnBoardingSecond({super.key});

  @override
  State<OnBoardingSecond> createState() => _OnBoardingSecondState();
}

class _OnBoardingSecondState extends State<OnBoardingSecond> {
  @override
  void initState() {
    super.initState();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnBoardingThird(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: SizedBox(
          height: size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 30, right: 6, left: 6, bottom: 6),
                height: size.height * 0.33,
                width: size.width * 0.6,
                child: Image.asset(
                  'assets/Group 175-2.png',
                  fit: BoxFit.fill,
                  width: size.width,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              SizedBox(
                  width: size.width * 0.88,
                  child: Text(
                    'إستلم الروشتة الخاصة بك وإحفظها على حسابك',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.radley(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey.shade900),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                  width: size.width * 0.88,
                  child: Text(
                    'الروشتة و العلاج لن يضيعا بعد الآن لان حسابك يتيح لك أن تحفظ كل روشتاتك و فحوصاتك',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.radley(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey.shade700),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              // Expanded(
              //   child: Center(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         TextButton(
              //             onPressed: () {
              //               // Navigator.push(context,
              //               //     MaterialPageRoute(builder: (context) {
              //               //   return const SignUp();//TODO:signup page to route to
              //               // }));
              //             },
              //             child: const Text(
              //               'تخطي',
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             )),
              //         RichText(
              //           text: TextSpan(
              //             text: '●',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.grey.shade200),
              //             children: <TextSpan>[
              //               TextSpan(
              //                   text: '●',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.grey.shade700)),
              //               TextSpan(
              //                   text: '●',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.grey.shade200)),
              //             ],
              //           ),
              //         ),
              //         TextButton(
              //             onPressed: () {
              //               Navigator.of(context).push(_createRoute());
              //             },
              //             child: const Text(
              //               'التالي',
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ))
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        )),
      ),
    );
  }
}
