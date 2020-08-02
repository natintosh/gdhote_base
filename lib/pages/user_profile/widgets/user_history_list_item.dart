import 'package:flutter/material.dart';

class UserHistoryListItem extends StatelessWidget {
  final String status;
  final VoidCallback onTap;

  const UserHistoryListItem({
    Key key,
    @required this.status,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.175,
      width: double.infinity,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 12.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: buildStatusAvatar(status),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '30th, Match 2020',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStatusAvatar(String status) {
    return status == 'new'
        ? CircleAvatar(
            backgroundColor: Color(0xFF7dd140),
            child: Icon(
              Icons.new_releases,
              color: Colors.white,
            ),
          )
        : CircleAvatar(
            backgroundColor: Color(0xFF76b73f),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          );
  }
}
