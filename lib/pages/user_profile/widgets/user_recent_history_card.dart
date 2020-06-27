import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:time_ago_provider/time_ago_provider.dart' as timeAgo;

class UserRecentHistoryCard extends StatelessWidget {
  final String status;
  final String filledBy;
  final String updatedOn;
  final VoidCallback onTap;

  const UserRecentHistoryCard({
    Key key,
    @required this.status,
    @required this.filledBy,
    @required this.updatedOn,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: <Widget>[
                  Container(
                    color: getCardColor(status),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.minHeight * 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black12,
                            Colors.black45,
                          ],
                          stops: [
                            0.0,
                            0.1,
                            0.6,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset(getSvgPath(status)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        status,
                        style: Theme.of(context).accentTextTheme.headline6,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Filled by:',
                            style: Theme.of(context).accentTextTheme.bodyText2,
                          ),
                          Text(
                            filledBy,
                            style: Theme.of(context).accentTextTheme.bodyText2,
                          ),
                          SizedBox(
                            height: constraints.minHeight * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                getDate(updatedOn),
                                style:
                                    Theme.of(context).accentTextTheme.bodyText2,
                              ),
                              Text(
                                getTimeAgo(updatedOn),
                                style:
                                    Theme.of(context).accentTextTheme.bodyText2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onTap,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String getSvgPath(String status) {
    return status == 'new'
        ? 'assets/svg/illustration_loading.svg'
        : 'assets/svg/illustration_completed.svg';
  }

  String getDate(String timeStamp) {
    DateTime dateTime = DateTime.parse(timeStamp);

    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  String getTimeAgo(String timeStamp) {
    DateTime dateTime = DateTime.parse(timeStamp);
    return timeAgo.format(dateTime, locale: 'en_short');
  }

  Color getCardColor(String status) {
    return status == 'new' ? Color(0xFF4E4E60) : Color(0xFF00962A);
  }
}
