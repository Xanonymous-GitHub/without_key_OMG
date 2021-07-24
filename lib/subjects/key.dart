import 'package:flutter/material.dart';
import 'package:key_sharing/widgets/demoSquares.dart';

final DemoSquares demoSquares = DemoSquares();

class KeySubject extends StatefulWidget {
  const KeySubject({Key? key}) : super(key: key);

  @override
  _KeySubjectState createState() => _KeySubjectState();
}

class _KeySubjectState extends State<KeySubject> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stateless Squares',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'GoogleSans',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: demoSquares.extractStateless,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          demoSquares.switchStatelessColor();
                        });
                      },
                      icon: Icon(Icons.compare_arrows),
                      label: Text('Switch Color'),
                    )
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stateful Squares',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'GoogleSans',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: demoSquares.extractStateful,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          demoSquares.switchStatefulColor();
                        });
                      },
                      icon: Icon(Icons.compare_arrows),
                      label: Text('Switch Color'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            demoSquares.regenerateStateless();
            demoSquares.regenerateStateful();
          });
        },
        child: const Icon(Icons.cached),
      ),
    );
  }
}
