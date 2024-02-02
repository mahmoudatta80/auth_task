import 'package:auth_task/core/routes/extensions.dart';
import 'package:auth_task/core/routes/routes.dart';
import 'package:auth_task/core/utils/show_toast.dart';
import 'package:auth_task/core/widgets/custom_button.dart';
import 'package:auth_task/features/register/data/model/register_request_model.dart';
import 'package:auth_task/features/register/presentation/logic/register_bloc/register_bloc.dart';
import 'package:auth_task/features/register/presentation/ui/widgets/already_have_an_account.dart';
import 'package:auth_task/features/register/presentation/ui/widgets/get_started.dart';
import 'package:auth_task/features/register/presentation/ui/widgets/register_form_fields.dart';
import 'package:auth_task/features/register/presentation/ui/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = context.read<RegisterBloc>();
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
                const GetStarted(),
                const SizedBox(height: 60),
                const RegisterFormFields(),
                const TermsAndConditions(),
                const SizedBox(height: 50),
                BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (registerResponseModel) {
                        showToast(text: registerResponseModel.message ?? '');
                        context.pushNamed(Routes.welcome);
                      },
                      failure: (errorMessage) => showToast(text: errorMessage),
                    );
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        if (registerBloc.formKey.currentState!.validate()) {
                          RegisterRequestModel registerRequestModel =
                              RegisterRequestModel({
                            'password': registerBloc.passwordController.text,
                            'email': registerBloc.emailController.text,
                            'name': registerBloc.nameController.text,
                            'phone': registerBloc.phoneController.text,
                          });
                          registerBloc.add(
                            RegisterEvent.requestRegisterEvent(
                              registerRequestModel,
                            ),
                          );
                        }
                      },
                      requestLoading: registerBloc.requestLoading,
                    );
                  },
                ),
                const SizedBox(height: 20),
                const AlreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
