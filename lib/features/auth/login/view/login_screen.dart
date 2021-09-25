import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/lang/lang_keys.dart';
import '../../../../core/extensions/context/context_extensions_shelf.dart';
import '../../../../core/extensions/string/image_path_extensions.dart';
import '../../../../core/widgets/text-form-fields/custom_text_form_field.dart';
import '../../../../core/widgets/texts/base_text.dart';
import '../view-model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<LoginViewModel>(
        bodyBuilder: bodyBuilder,
      );

  Widget bodyBuilder(BuildContext context) => Container(
        padding: context.verticalHigh,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(flex: 3, child: 'logo'.pngLogo),
            const Spacer(flex: 4),
            Expanded(
                child: BaseText(LangKeys.welcome, color: context.primaryColor)),
            const Spacer(),
            Expanded(flex: 5, child: _getForm(context)),
            const Spacer(flex: 3),
            Expanded(
                flex: 2,
                child: BaseText(LangKeys.welcome, color: context.primaryColor)),
          ],
        ),
      );

  Form _getForm(BuildContext context) {
    final LoginViewModel model = context.read<LoginViewModel>();
    return Form(
      key: model.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomTextField(
            controller: model.emailController,
            hintText: 'Email',
            prefixIcon: Icons.email_outlined,
          ),
          SizedBox(height: context.height * 4),
          CustomTextField(
            controller: model.passwordController,
            hintText: 'Password',
            prefixIcon: Icons.password_outlined,
            isObscured: true,
          ),
        ],
      ),
    );
  }
}
