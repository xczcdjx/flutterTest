import 'package:flutter/material.dart';
import 'package:fluttertest/state/appState.dart';
import 'package:fluttertest/study/shopDemo/shopPage.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.read<AppState>().toggleMode();
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ...List.generate(3, (i) {
                double c = (3 - i) * 100;
                return Container(
                  width: c,
                  height: c,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[c.toInt()]),
                );
              }),
              Text('Touch me')
            ],
          ),
        ),
      ),
    );
  }
}
