import 'package:flutter/material.dart';
import 'package:gdhote/gdhote_app.dart';
import 'package:gdhote/models/create_user/create_user_model.dart';
import 'package:gdhote/services/gdhote_api_service.dart';
import 'package:gdhote/utils/helpers/scaffold_helper.dart';
import 'package:gdhote/utils/helpers/theme_wrapper.dart';
import 'package:gdhote/utils/regexps/regexps.dart';
import 'package:gdhote/utils/views/widget_view.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tuple/tuple.dart';

class SignUpPage extends StatefulWidget {
  static const SiginUpPageRouteName = "/signup";

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  void requestNextFocus(FocusNode node) {
    if (node != null) {
      FocusScope.of(context).requestFocus(node);
    } else {
      FocusScope.of(context).unfocus();
    }
  }

  String emailFormFieldValidator(String value) {
    if (value.isEmpty) return 'Email address is empty';
    if (!RegExpHelper.emailRegExp.hasMatch(value))
      return 'Invalid email address';
    return null;
  }

  String passwordFormFieldValidator(String value) {
    if (value.isEmpty) return 'Password is empty';
    return null;
  }

  void signUpButtonOnPressed() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      this.buildPayloadAndSendRequest();
    }
  }

  String confirmPasswordFormFieldValidator(String value) {
    if (value.isEmpty) return 'Password confirmation is empty';
    if (value != this.passwordController.text) return 'Passwords do not match';
    return null;
  }

  void setPasswordVisibility() {
    setState(() {
      this.isPasswordObscure = !this.isPasswordObscure;
    });
  }

  void setConfirmPasswordVisibility() {
    setState(() {
      this.isConfirmPasswordObscure = !this.isConfirmPasswordObscure;
    });
  }

  String fistNameValidator(String value) {
    if (value.isEmpty) return 'First name is empty';

    return null;
  }

  String lastNameValidate(String value) {
    if (value.isEmpty) return 'Last name is empty';

    return null;
  }

  String phoneNumberValidator(String value) {
    if (value.isEmpty)
      return 'Phone number is empty';
    else if (value.length < 11) return 'Verify the phone number is valid';

    return null;
  }

  void buildPayloadAndSendRequest() async {
    final CreateUserModel payload = CreateUserModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneNumberController.text,
      emailAddress: emailController.text,
      password: confirmPasswordController.text,
    );

    Tuple2<bool, String> response = await GdhoteApiService.createUser(
      createUserModel: payload,
    );

    this.validateResponse(response);

    setState(() {
      isLoading = false;
    });
  }

  void validateResponse(Tuple2<bool, String> response) async {
    ScaffoldHelper.showSnackBar(
      key: GdhoteApp.globalScaffoldKey,
      message: response.item2,
      isSuccess: response.item1,
    );

    if (response.item1) {
      Navigator.pop(context);
    }
  }
}

class _WidgetView extends WidgetView<SignUpPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: state.scaffoldKey,
      body: Form(
        key: state.formKey,
        child: ListView(
          padding: MediaQuery.of(context).padding.copyWith(left: 24, right: 24),
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Fill in your information below.',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              child: ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.firstNameController,
                  focusNode: state.firstNameFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onEditingComplete: () =>
                      state.requestNextFocus(state.lastNameFocusNode),
                  validator: state.fistNameValidator,
                  decoration: InputDecoration(
                    labelText: 'First name',
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              child: ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.lastNameController,
                  focusNode: state.lastNameFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onEditingComplete: () =>
                      state.requestNextFocus(state.phoneNumberFocusNode),
                  validator: state.lastNameValidate,
                  decoration: InputDecoration(
                    labelText: 'Last name',
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              child: ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.phoneNumberController,
                  focusNode: state.phoneNumberFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  onEditingComplete: () =>
                      state.requestNextFocus(state.emailFocusNode),
                  validator: state.phoneNumberValidator,
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              child: ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.emailController,
                  focusNode: state.emailFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () =>
                      state.requestNextFocus(state.passwordFocusNode),
                  validator: state.emailFormFieldValidator,
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              child: ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.passwordController,
                  focusNode: state.passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  onEditingComplete: () =>
                      state.requestNextFocus(state.confirmPasswordFocusNode),
                  validator: state.passwordFormFieldValidator,
                  obscureText: state.isPasswordObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    suffixIcon: IconButton(
                      icon: Icon(state.isPasswordObscure
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: state.setPasswordVisibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              child: ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.confirmPasswordController,
                  focusNode: state.confirmPasswordFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  onEditingComplete: () => state.requestNextFocus(null),
                  validator: state.confirmPasswordFormFieldValidator,
                  obscureText: state.isPasswordObscure,
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    suffixIcon: IconButton(
                      icon: Icon(state.isConfirmPasswordObscure
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: state.setConfirmPasswordVisibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(),
                Card(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: state.isLoading ? null : state.signUpButtonOnPressed,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: state.isLoading
                          ? SizedBox(
                              width: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .fontSize,
                              height: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .fontSize,
                              child: LoadingIndicator(
                                indicatorType: Indicator.lineSpinFadeLoader,
                                color: Colors.white,
                              ),
                            )
                          : Icon(
                              Icons.arrow_forward,
                              size: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .fontSize,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
