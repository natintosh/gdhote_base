import 'package:flutter/material.dart';
import 'package:gdhote/pages/add_beneficiary/views/status_view.dart';
import 'package:gdhote/utils/helpers/theme_wrapper.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class AddBeneficiaryPage extends StatefulWidget {
  static const String AddUserPageRouteName = '/add-user';

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<AddBeneficiaryPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode statusFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    statusFocusNode.addListener(statusFocusNodeListener);
    return _WidgetView(this);
  }

  void addButtonOnPressed() {
    closePage();
  }

  void closePage() {
    Navigator.of(context).pop();
  }

  void statusFocusNodeListener() {
    FocusScope.of(context).unfocus();
  }

  void openBeneficiaryStatusSelector() async {
    String status = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatusView(
          controller: null,
        );
      },
    );

    if (status != null) {
      statusController.text = status;
    }
  }
}

class _WidgetView extends WidgetView<AddBeneficiaryPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add beneficiary'),
      ),
      body: Container(
        child: Form(
          key: state.formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            children: <Widget>[
              ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.firstNameController,
                  focusNode: state.firstNameFocusNode,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'First name',
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.lastNameController,
                  focusNode: state.lastNameFocusNode,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Last name',
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.statusController,
                  focusNode: state.statusFocusNode,
                  onTap: state.openBeneficiaryStatusSelector,
                  readOnly: true,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Status',
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              RaisedButton(
                onPressed: state.addButtonOnPressed,
                child: Text('ADD'),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
