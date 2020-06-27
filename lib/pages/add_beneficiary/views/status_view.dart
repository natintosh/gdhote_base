import 'package:flutter/material.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class StatusView extends StatefulWidget {
  final ScrollController controller;

  const StatusView({
    Key key,
    @required this.controller,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<StatusView> {
  final List<String> status = ['Member', 'Grace seeker'];

  String groupValue;

  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  void updateGroupValue(String value) {
    setState(() {
      groupValue = value;
    });
  }

  void selectButtonPressed() {
    Navigator.pop(context, groupValue);
  }
}

class _WidgetView extends WidgetView<StatusView, _Controller> {
  final _Controller state;

  _WidgetView(this.state) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Status',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Divider(),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              controller: widget.controller,
              itemCount: state.status.length,
              itemBuilder: (BuildContext context, int index) {
                String value = state.status[index];
                return RadioListTile<String>(
                  value: value,
                  groupValue: state.groupValue,
                  onChanged: state.updateGroupValue,
                  title: Text('$value'),
                  controlAffinity: ListTileControlAffinity.trailing,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              onPressed: state.selectButtonPressed,
              child: Text('SELECT'),
            ),
          ),
        ],
      ),
    );
  }
}
