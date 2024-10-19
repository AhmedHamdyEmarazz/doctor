import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingThird extends StatefulWidget {
  const OnBoardingThird({super.key});

  @override
  State<OnBoardingThird> createState() => _OnBoardingThirdState();
}

class _OnBoardingThirdState extends State<OnBoardingThird> {
  @override
  void initState() {
    super.initState();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnBoardingThird() //TODO:signup page to route to,
      ,
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
                  'assets/Group 175-3.png',
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
                    'ابحث بالتخصص و المنطقة',
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
                    'اختر التخصص الذي تبحث عنه والمنطقة الاقرب لك و ابحث ستجد مجموعة من اشطر الدكاترة',
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
              //               //   return const SignUp();
              //               // }));//TODO:signup page to route to
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
              //                       color: Colors.grey.shade200)),
              //               TextSpan(
              //                   text: '●',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.grey.shade700)),
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
