import 'package:aventude_assignment/app/shared/keyboard_handler.dart';
import 'package:flutter/material.dart';

class ButtonWithProgressIndicator extends StatelessWidget with DismissKeyboard {
  final String title;
  final bool hasBorder;
  final VoidCallback? onTap;
  final bool isBusy;
  final bool shouldDismissKeyboard;

  ButtonWithProgressIndicator({
    Key? key,
    required this.title,
    this.hasBorder = false,
    this.onTap,
    this.isBusy = false,
    this.shouldDismissKeyboard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder
              ? Colors.white
              : Theme.of(context).buttonTheme.colorScheme!.secondary,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: Theme.of(context).buttonTheme.colorScheme!.secondary,
                  width: 1.0,
                )
              : const Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          onTap: () {
            if (shouldDismissKeyboard) {
              dismissKeyboard(context);
            }

            if (!isBusy && onTap != null) {
              onTap!();
            }
          },
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 60.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: hasBorder
                          ? Theme.of(context).buttonTheme.colorScheme!.secondary
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                (isBusy)
                    ? Positioned(
                        right: 8.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(hasBorder
                              ? Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .secondary
                              : Colors.white),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
