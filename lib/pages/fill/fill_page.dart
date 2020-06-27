import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdhote/pages/fill/views/quantity_view.dart';
import 'package:gdhote/utils/helpers/theme_wrapper.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class FillPage extends StatefulWidget {
  static const FillPageRouteName = '/fill-page';

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<FillPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  final FocusNode quantityFocusNode = FocusNode();
  final FocusNode commentFocusNode = FocusNode();

  @override
  void initState() {
    quantityFocusNode.addListener(quantityFocusNodeListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  void submitButtonPressed() {
    Navigator.pop(context);
  }

  void openQuantitySelector() async {
    String quantity = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          builder: (BuildContext context, ScrollController controller) {
            return QuantityView(
              controller: controller,
            );
          },
        );
      },
    );

    if (quantity != null) {
      quantityController.text = '$quantity';
    }
  }

  void quantityFocusNodeListener() {
    FocusScope.of(context).unfocus();
  }
}

class _WidgetView extends WidgetView<FillPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill'),
      ),
      body: Container(
        child: Form(
          key: state.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            children: <Widget>[
              Container(
                child: ThemeWrapper(
                  primaryColor: const Color(0xFF2196F3),
                  child: TextFormField(
                    controller: state.quantityController,
                    focusNode: state.quantityFocusNode,
                    onTap: state.openQuantitySelector,
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Quantity',
                      suffixText: 'LITRES',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                child: ThemeWrapper(
                  primaryColor: const Color(0xFF2196F3),
                  child: TextFormField(
                    controller: state.commentController,
                    focusNode: state.commentFocusNode,
                    maxLines: 7,
                    decoration: InputDecoration(
                      filled: true,
                      alignLabelWithHint: true,
                      labelText: 'Comment',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              RaisedButton(
                onPressed: state.submitButtonPressed,
                child: Text('SUBMIT'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
