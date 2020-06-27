import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdhote/utils/paints/cloud_shape_paint.dart';

class DashboardCard extends StatelessWidget {
  final String assetPath;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    Key key,
    @required this.assetPath,
    @required this.title,
    @required this.color,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: color,
      child: InkWell(
        onTap: onTap,
        child: CustomPaint(
          painter: CloudShapePaint(),
          child: Stack(
            children: [
              SvgPicture.asset(assetPath),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).accentTextTheme.headline6,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
