// ignore_for_file: use_build_context_synchronously

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project/features/profile/ganti_avatar_pages.dart';
import 'package:project/services/firebase_auth_services.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/authentication/widgets/loading_widget.dart';

import '../styles/button_styles.dart';
import '../styles/color.dart';
import '../styles/text_styles.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _hidePassword = true;
  bool _hideRetypePassword = true;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _nameTextFieldController = TextEditingController();
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();
  final _retypePasswordTextFieldController = TextEditingController();

  @override
  void dispose() {
    _nameTextFieldController.dispose();
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    _retypePasswordTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AuthLoading()
        : Material(
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Text(
                    "Daftar",
                    style: TextStyles.headline4,
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColor.blackLight),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                body: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSizedBox(20.0),
                              logoPage(),
                              verticalSizedBox(20.0),
                              textFieldLabel("Nama"),
                              TextFormField(
                                controller: _nameTextFieldController,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: AppColor.whiteDarkest,
                                    ),
                                  ),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? "Nama ga boleh kosong"
                                    : null,
                              ),
                              textFieldLabel("Email"),
                              TextFormField(
                                controller: _emailTextFieldController,
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: AppColor.whiteDarkest,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email ga boleh kosong";
                                  } else if (!EmailValidator.validate(value)) {
                                    return "Email kamu ga valid";
                                  }
                                  return null;
                                },
                              ),
                              textFieldLabel("Password"),
                              TextFormField(
                                controller: _passwordTextFieldController,
                                autofocus: false,
                                obscureText: _hidePassword,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(_hidePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () => setState(
                                        () => _hidePassword = !_hidePassword),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: AppColor.whiteDarkest)),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? "Password ga boleh kosong"
                                    : null,
                              ),
                              textFieldLabel("Konfirmasi Password"),
                              TextFormField(
                                  controller:
                                      _retypePasswordTextFieldController,
                                  autofocus: false,
                                  obscureText: _hideRetypePassword,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(_hideRetypePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () => setState(() =>
                                            _hideRetypePassword =
                                                !_hideRetypePassword)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: AppColor.whiteDarkest)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Konfirmasi lagi password kamu";
                                    } else if (_passwordTextFieldController
                                            .text.isNotEmpty &&
                                        (_passwordTextFieldController.text !=
                                            value)) {
                                      return "Password konfirmasi ga sama";
                                    }
                                    return null;
                                  }),
                              verticalSizedBox(30.0),
                              Container(
                                padding: const EdgeInsets.only(bottom: 20),
                                width: double.infinity,
                                height: 70,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() => isLoading = true);
                                      String result =
                                          await AuthMethods().signUpUser(
                                        name: _nameTextFieldController.text,
                                        email: _emailTextFieldController.text,
                                        password:
                                            _passwordTextFieldController.text,
                                      );
                                      if (result != "success") {
                                        setState(() => isLoading = false);
                                        ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.danger,
                                            title: "Gagal Mendaftar !",
                                            text: result,
                                          ),
                                        );
                                        return;
                                      }
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GantiAvatarPages(
                                            from: "register",
                                          ),
                                        ),
                                        (route) => false,
                                      );
                                    }
                                  },
                                  style: PrimaryButtons
                                      .filledButtonStylePrimaryBase,
                                  child: Text(
                                    "DAFTAR",
                                    style: TextStyles.button.copyWith(
                                      color: AppColor.whiteBase,
                                    ),
                                  ),
                                ),
                              ),
                              verticalSizedBox(70.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
