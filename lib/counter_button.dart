library counter_button;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///Counter button class
class CounterButton extends StatefulWidget {
  ///Constructor for the counter button
  const CounterButton(
      {Key? key,
      required this.count,
      required this.onChange,
      required this.loading,
      this.countColor = Colors.black,
      this.addIcon = const Icon(Icons.add),
      this.removeIcon = const Icon(Icons.remove),
      this.buttonColor = Colors.black,
      this.progressColor = Colors.black})
      : super(key: key);

  ///Value of the counter displayed in the center
  final int count;

  ///Color of the counter value
  final Color countColor;

  ///Value change callback when the buttons are pressed
  final ValueChanged<int> onChange;

  ///For showing the linear progress indicator
  final bool loading;

  ///Color of the progress indicator
  final Color progressColor;

  ///Color of the icon button
  final Color buttonColor;

  ///Add button icon
  ///default: Icons.add
  final Icon addIcon;

  ///Remove button icon
  ///default: Icons.remove
  final Icon removeIcon;

  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.loading)
                LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(widget.progressColor),
                  backgroundColor: Colors.transparent,
                ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: IconButton(
                        onPressed: widget.loading
                            ? null
                            : () {
                                widget.onChange(widget.count - 1);
                              },
                        icon: widget.removeIcon,
                        padding: EdgeInsets.zero,
                        color: widget.buttonColor,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
                        return currentChild!;
                      },
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        final Animation<Offset> inAnimation =
                            Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation);
                        final Animation<Offset> outAnimation =
                            Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(animation);

                        if (child.key.toString() == widget.count.toString()) {
                          return ClipRect(
                            child: SlideTransition(position: inAnimation, child: child),
                          );
                        } else {
                          return ClipRect(
                            child: SlideTransition(position: outAnimation, child: child),
                          );
                        }
                      },
                      child: SizedBox(
                        key: Key(widget.count.toString()),
                        width: 32.0,
                        height: 32.0,
                        child: Center(
                          child: Text(
                            widget.count.toString(),
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: widget.countColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: IconButton(
                        onPressed: widget.loading
                            ? null
                            : () {
                                widget.onChange(widget.count + 1);
                              },
                        icon: widget.addIcon,
                        padding: EdgeInsets.zero,
                        color: widget.buttonColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
