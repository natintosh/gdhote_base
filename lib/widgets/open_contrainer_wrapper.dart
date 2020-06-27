import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerWrapper<T> extends StatelessWidget {
  final OpenContainerBuilder<T> openContainer;
  final CloseContainerBuilder closeBuilder;
  final Color cardColor;

  const OpenContainerWrapper({
    Key key,
    @required this.openContainer,
    @required this.closeBuilder,
    @required this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: closeBuilder,
      openBuilder: openContainer,
      tappable: false,
      transitionType: ContainerTransitionType.fadeThrough,
      openColor: Theme.of(context).scaffoldBackgroundColor,
      closedColor: cardColor,
    );
  }
}
