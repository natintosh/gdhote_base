import 'package:flutter/material.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class QuantityView extends StatefulWidget {
  final ScrollController controller;

  const QuantityView({
    Key key,
    @required this.controller,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<QuantityView> {
  final List<String> quantities = [
    '0.25',
    '0.50',
    '0.60',
    '0.75',
    '1.00',
    '1.50',
    '2.50',
    '5.00',
    '7.50',
    '10.00',
    '15.00',
    '20.00',
    '25.00',
    '50.00'
  ];

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

class _WidgetView extends WidgetView<QuantityView, _Controller> {
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Quantities',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                controller: widget.controller,
                itemCount: state.quantities.length,
                itemBuilder: (BuildContext context, int index) {
                  String value = state.quantities[index];
                  return RadioListTile<String>(
                    value: value,
                    groupValue: state.groupValue,
                    onChanged: state.updateGroupValue,
                    title: Text('$value Litres'),
                    controlAffinity: ListTileControlAffinity.trailing,
                  );
                },
              ),
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
