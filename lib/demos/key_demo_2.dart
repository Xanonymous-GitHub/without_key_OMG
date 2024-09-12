import 'package:flutter/material.dart';
import 'package:key_sharing/utils/reactive_random_color.dart';

import '../constants.dart';

final class StatefulContainer extends StatefulWidget {
  const StatefulContainer({super.key});

  @override
  State<StatefulContainer> createState() => _StatefulContainerState();
}

final class _StatefulContainerState extends State<StatefulContainer> {
  final ReactiveRandomColor _randomColor = ReactiveRandomColor();

  Color get color => _randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: squareSize,
      height: squareSize,
      color: color,
    );
  }
}

final List<Padding> squareWithPaddingKeyInSquare = [
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.amber,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StatefulContainer(key: UniqueKey()),
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.red,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StatefulContainer(key: UniqueKey()),
        ),
      ),
    ),
  ),
];

final List<Padding> squareWithPaddingKeyInPadding = [
  Padding(
    key: UniqueKey(),
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.amber,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: StatefulContainer(),
        ),
      ),
    ),
  ),
  Padding(
    key: UniqueKey(),
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.red,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: StatefulContainer(),
        ),
      ),
    ),
  ),
];

final class KeyDemo2 extends StatefulWidget {
  const KeyDemo2({super.key});

  @override
  State<KeyDemo2> createState() => _KeyDemo2State();
}

class _KeyDemo2State extends State<KeyDemo2> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool enableStatefulKey = false;

  void swapSquareWithPadding(List<Padding> paddings) {
    paddings.insert(0, paddings.removeLast());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Stateful Squares with Padding, Key in Squares',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: squareWithPaddingKeyInSquare,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        swapSquareWithPadding(squareWithPaddingKeyInSquare);
                      });
                    },
                    icon: const Icon(Icons.compare_arrows),
                    label: const Text('Switch Squares'),
                  ),
                ],
              ),
              // -----
              const SizedBox(
                height: 40.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Stateful Squares with Padding, Key in Paddings',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'GoogleSans',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: squareWithPaddingKeyInPadding,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        swapSquareWithPadding(squareWithPaddingKeyInPadding);
                      });
                    },
                    icon: const Icon(Icons.compare_arrows),
                    label: const Text('Switch Squares'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
