import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:key_sharing/themes.dart';
import 'package:key_sharing/widgets/demo_squares.dart';

final DemoSquares demoSquares = DemoSquares();

class KeyDemo1 extends StatefulWidget {
  const KeyDemo1({Key? key}) : super(key: key);

  @override
  _KeyDemo1State createState() => _KeyDemo1State();
}

class _KeyDemo1State extends State<KeyDemo1>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool enableStatefulKey = false;

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
                      label: Text('Switch Squares'),
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
                      label: Text('Switch Squares'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterSwitch(
                          width: 60.0,
                          height: 30.0,
                          valueFontSize: 10.0,
                          toggleSize: 20.0,
                          value: enableStatefulKey,
                          borderRadius: 30.0,
                          padding: 4.0,
                          showOnOff: true,
                          activeColor: MyTheme.SpecialLimeGreen,
                          onToggle: (val) {
                            setState(() {
                              enableStatefulKey = val;
                              val
                                  ? demoSquares.enableStatefulKey()
                                  : demoSquares.disableStatefulKey();
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Text(
                            'Key',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'GoogleSans',
                            ),
                          ),
                        ),
                      ],
                    ),
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
