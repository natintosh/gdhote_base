import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gdhote/pages/signin/signin_page.dart';
import 'package:gdhote/utils/paints/star_shape_paint.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class SplashScreenPage extends StatefulWidget {
  static const SplashScreenRouteName = '/';

  @override
  State<StatefulWidget> createState() => _SplashScreenController();
}

class _SplashScreenController extends State<SplashScreenPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        this.splashScreenWait();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _SplashScreenView(this);
  }

  void splashScreenWait() async {
    await Future.delayed(
      Duration(
        milliseconds: 3000,
      ),
    );

    Navigator.pushReplacementNamed(context, SignInPage.SignInPageRouteName);
  }
}

class _SplashScreenView
    extends WidgetView<SplashScreenPage, _SplashScreenController> {
  final _SplashScreenController state;

  _SplashScreenView(this.state) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.only(bottom: 24.0),
        child: Stack(
          children: <Widget>[
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: StarShapePaint(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'GDHOTE',
                style: Theme.of(context).accentTextTheme.headline5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
