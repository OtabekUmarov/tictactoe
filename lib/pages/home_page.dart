import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> myList = List.filled(9, '');
  List<int> winnerCheckList = [];
  bool isQueueX = true;
  String isWinner = '';
  int xPlayerWinnerCount = 0;
  int oPlayerWinnerCount = 0;
  int filledBoxCount = 0;

  void _onTapUser(int index) {
    setState(() {
      if (myList[index].isEmpty) {
        if (isQueueX) {
          myList[index] = 'x';
        } else {
          myList[index] = '0';
        }
        isQueueX = !isQueueX;
        filledBoxCount++;
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    // 1-qatorni tekshirish
    if (myList[0] != '' && myList[0] == myList[1] && myList[0] == myList[2]) {
      _winnerDialog();
      winnerCheckList = [0, 1, 2];
    }
    // 2-qatorni tekshirish
    if (myList[3] != '' && myList[3] == myList[4] && myList[3] == myList[5]) {
      _winnerDialog();
      winnerCheckList = [3, 4, 5];
    }
    // 3-qatorni tekshirish
    if (myList[6] != '' && myList[6] == myList[7] && myList[6] == myList[8]) {
      _winnerDialog();
      winnerCheckList = [6, 7, 8];
    }

    // 1-ustunni tekshirish
    if (myList[0] != '' && myList[0] == myList[3] && myList[0] == myList[6]) {
      _winnerDialog();
      winnerCheckList = [0, 3, 6];
    }
    // 2-ustunni tekshirish
    if (myList[1] != '' && myList[1] == myList[4] && myList[1] == myList[7]) {
      _winnerDialog();
      winnerCheckList = [1, 4, 7];
    }
    // 3-ustunni tekshirish
    if (myList[2] != '' && myList[2] == myList[5] && myList[2] == myList[8]) {
      _winnerDialog();
      winnerCheckList = [2, 5, 8];
    }

    // dioganalni tekshirish
    if (myList[6] != '' && myList[6] == myList[4] && myList[6] == myList[2]) {
      _winnerDialog();
      winnerCheckList = [6, 4, 2];
    }
    if (myList[0] != '' && myList[0] == myList[4] && myList[0] == myList[8]) {
      _winnerDialog();
      winnerCheckList = [0, 4, 8];
    } else if (filledBoxCount == 9 && winnerCheckList.isEmpty) {
      _drawDialog();
    }
  }

  void _winnerDialog() {
    setState(() {
      if (isQueueX) {
        oPlayerWinnerCount++;
        isWinner = 'o';
      } else {
        xPlayerWinnerCount++;
        isWinner = 'x';
      }
    });
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Color(0xFF091314).withValues(alpha: 0.9),
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF4B4B4B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Stack(
          alignment: Alignment.center,
          children: [
            if (isWinner != '')
              Center(
                child: Image.asset(
                  isWinner == 'x'
                      ? 'lib/images/big-x.png'
                      : 'lib/images/big-o.png',
                  height: 220,
                ),
              ),
            Column(
              children: [
                SizedBox(width: 500),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isWinner != '')
                      Image.asset(
                        isWinner == 'x'
                            ? 'lib/images/x.png'
                            : 'lib/images/o.png',
                        height: 30,
                      ),
                    SizedBox(width: 16),
                    Text(
                      "O'YINCHI",
                      style: GoogleFonts.ptSans(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF4F4F4),
                      ),
                    ),
                  ],
                ),
                if (isWinner != '')
                  Lottie.asset(
                    isWinner == 'x'
                        ? 'lib/images/winner-x.json'
                        : 'lib/images/winner-o.json',
                    repeat: false,
                    reverse: false,
                    height: 220,
                  ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _resetGame();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFF909090)),
                      color: Color(0xFF091314),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    child: Text(
                      "Qayta o'ynash",
                      style: GoogleFonts.ptSans(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _drawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF4B4B4B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Column(
          children: [
            SizedBox(width: 500),
            Text(
              "DURRANG",
              style: GoogleFonts.ptSans(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color(0xFFF4F4F4),
              ),
            ),
            Lottie.asset(
              'lib/images/draw.json',
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                _resetGame();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF909090)),
                  color: Color(0xFF091314),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Text(
                  "Qayta o'ynash",
                  style: GoogleFonts.ptSans(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _resetGame() {
    setState(() {
      myList = List.filled(9, '');
      filledBoxCount = 0;
      winnerCheckList = [];
    });
  }

  void _fullResetGame() {
    _resetGame();
    setState(() {
      isWinner = '';
      isQueueX = true;
      xPlayerWinnerCount = 0;
      oPlayerWinnerCount = 0;
    });
  }

  TextStyle playerTitleStyle = GoogleFonts.ptSans(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  TextStyle countTextStyle = GoogleFonts.ptSans(
    fontSize: 26,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/x.png',
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text("O'YINCHI", style: playerTitleStyle),
                            ],
                          ),
                          Text('$xPlayerWinnerCount', style: countTextStyle),
                        ],
                      ),
                    ),
                    // SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/o.png',
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text("O'YINCHI", style: playerTitleStyle),
                            ],
                          ),
                          // Text("O", style: textIconleStyle),
                          Text('$oPlayerWinnerCount', style: countTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 390,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF272727),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _onTapUser(index);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: Color(0xFF343434),
                          ),
                          margin: myList[index] != ''
                              ? EdgeInsets.all(3)
                              : EdgeInsets.all(1),
                          child: Center(
                            child: myList[index] != ''
                                ? Image.asset(
                                    myList[index] == 'x'
                                        ? 'lib/images/x.png'
                                        : 'lib/images/o.png',
                                    height: 40,
                                  )
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NAVBAT",
                            style: GoogleFonts.ptSans(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF343434),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Image.asset(
                              isQueueX
                                  ? 'lib/images/x.png'
                                  : 'lib/images/o.png',
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "DA",
                            style: GoogleFonts.ptSans(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      TextButton(
                        onPressed: _fullResetGame,
                        child: Text(
                          "O'yinni qaytadan boshlash",
                          style: GoogleFonts.ptSans(
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
