import 'package:auth_task/core/routes/extensions.dart';
import 'package:auth_task/core/routes/routes.dart';
import 'package:auth_task/core/utils/show_toast.dart';
import 'package:auth_task/core/widgets/custom_button.dart';
import 'package:auth_task/features/login/data/model/login_request_model.dart';
import 'package:auth_task/features/login/presentation/logic/login_bloc/login_bloc.dart';
import 'package:auth_task/features/login/presentation/ui/widgets/login_form_fields.dart';
import 'package:auth_task/features/login/presentation/ui/widgets/welcom_back.dart';
import 'package:auth_task/features/login/presentation/ui/widgets/register_now.dart';
import 'package:auth_task/features/login/presentation/ui/widgets/remember_me_and_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = context.read<LoginBloc>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 40,
            end: 30,
            start: 30,
            bottom: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const WelcomeBack(),
                const SizedBox(height: 60),
                const LoginFormFields(),
                const RememberMeAndForgetPassword(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (loginResponseModel) =>
                          context.pushNamed(Routes.welcome),
                      failure: (errorMessage) => showToast(text: errorMessage),
                    );
                  },
                  builder: (context, state) => CustomButton(
                    onPressed: () {
                      if (loginBloc.formKey.currentState!.validate()) {
                        LoginRequestModel loginRequestModel =
                            LoginRequestModel({
                          'password': loginBloc.passwordController.text,
                          'email': loginBloc.emailController.text,
                        });
                        loginBloc.add(
                          LoginEvent.requestLoginEvent(loginRequestModel),
                        );
                      }
                    },
                    requestLoading: loginBloc.requestLoading,
                  ),
                ),
                const SizedBox(height: 20),
                const RegisterNow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
