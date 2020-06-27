import 'package:flutter/material.dart';
import 'package:gdhote/models/signin/signin_model.dart';
import 'package:gdhote/pages/dashboard/dashboard_page.dart';
import 'package:gdhote/pages/signup/siginup_page.dart';
import 'package:gdhote/services/gdhote_api_service.dart';
import 'package:gdhote/utils/helpers/scaffold_helper.dart';
import 'package:gdhote/utils/helpers/theme_wrapper.dart';
import 'package:gdhote/utils/regexps/regexps.dart';
import 'package:gdhote/utils/views/widget_view.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tuple/tuple.dart';

class SignInPage extends StatefulWidget {
  static const String SignInPageRouteName = '/signin';

  @override
  _Controller createState() => _Controller();
}

class _Controller extends State<SignInPage> {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isPasswordObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  void signInButtonOnPressed() {
    if (this.formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      this.buildPayloadAndSendRequest();
    }
  }

  void forgotPasswordButtonOnPressed() {}

  void emailFormFieldEditingComplete() {
    FocusScope.of(context).requestFocus(passwordFocusNode);
  }

  String emailFormFieldValidator(String value) {
    if (value.isEmpty) return 'Email address is empty';
    if (!RegExpHelper.emailRegExp.hasMatch(value))
      return 'Invalid email address';
    return null;
  }

  void passwordFormFieldEditingComplete() {
    FocusScope.of(context).unfocus();
  }

  String passwordFormFieldValidator(String value) {
    if (value.isEmpty) return 'Password is empty';
    return null;
  }

  void setPasswordVisibility() {
    setState(() {
      this.isPasswordObscure = !this.isPasswordObscure;
    });
  }

  void openCreateNewAccountPage() {
    Navigator.pushNamed(context, SignUpPage.SiginUpPageRouteName);
  }

  void buildPayloadAndSendRequest() async {
    SignInModel payload = SignInModel(
      userName: emailController.text,
      password: passwordController.text,
    );

    Tuple2<bool, String> response =
        await GdhoteApiService.loginUser(signInModel: payload);

    this.validateResponse(response);

    setState(() {
      isLoading = false;
    });
  }

  void validateResponse(Tuple2<bool, String> response) async {
    ScaffoldHelper.showSnackBar(
      key: this.scaffoldKey,
      message: response.item2,
      isSuccess: response.item1,
    );

    if (response.item1) {
      await Future.delayed(Duration(milliseconds: 4000));
      Navigator.pushReplacementNamed(
          context, DashboardPage.DashboardPageRouteName);
    }
  }
}

class _WidgetView extends WidgetView<SignInPage, _Controller> {
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
              child: Text(
                'Welcome',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Container(
              child: ThemeWrapper(
                primaryColor: const Color(0xFF2196F3),
                child: TextFormField(
                  controller: state.emailController,
                  focusNode: state.emailFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: state.emailFormFieldEditingComplete,
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
                  onEditingComplete: state.passwordFormFieldEditingComplete,
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
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    onPressed: state.forgotPasswordButtonOnPressed,
                    child: Text('Forgot Password')),
                Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: state.isLoading ? null : state.signInButtonOnPressed,
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
            Row(
              children: <Widget>[
                FlatButton(
                  onPressed: state.openCreateNewAccountPage,
                  child: Text('Create New Account'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
