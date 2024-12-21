import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tictactoe/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tic",
                    style: GoogleFonts.ptSans(
                      color: Color(0xFF1F9AA1),
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Tac",
                    style: GoogleFonts.ptSans(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Toe",
                    style: GoogleFonts.ptSans(
                      color: Color(0xFFC7981E),
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Lottie.asset(
                'lib/images/intro.json',
                repeat: false,
              ),
            ),
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFF909090)),
                      color: Color(0xFF4B4B4B),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    child: Text(
                      "O'yinni boshlash",
                      style: GoogleFonts.ptSans(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
