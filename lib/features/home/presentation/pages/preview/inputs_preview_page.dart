import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class InputsPreviewPage extends StatelessWidget {
  const InputsPreviewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(title: Text(context.l10n.inputs), centerTitle: true),
      body: Padding(
        padding: 24.edgeHorizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            24.paddingVertical,
            Text(
              context.l10n.inputsPreviewDescription,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            24.paddingVertical,
            // divider
            Divider(),
            24.paddingVertical,
            Text(
              "Basic TextField - Outlined",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // outlined active
            BasicTextField.outlined(
              field: 'outlined_active',
              labelText: 'active',
              hintText: 'hint text',
            ),
            16.paddingVertical,
            // outlined disabled
            BasicTextField.outlined(
              field: 'outlined_disabled',
              labelText: 'disabled',
              hintText: 'hint text',
              state: BasicTextFieldState.disabled,
            ),
            // outlined error
            16.paddingVertical,
            BasicTextField.outlined(
              field: 'outlined_error',
              labelText: 'error',
              hintText: 'hint text',
              validationUIError: ValidationUIError(
                code: "error_code",
                message: "This is an error message",
                errors: [
                  ValidatorField(
                    fieldName: 'outlined_error',
                    message: 'This is an error message for the field',
                  ),
                ],
              ),
            ),
            16.paddingVertical,
            // divider
            Divider(),
            16.paddingVertical,
            Text(
              "Basic TextField - Underline",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,

            // underline active
            BasicTextField.underline(
              field: 'underline_active',
              labelText: 'active',
              hintText: 'hint text',
            ),
            16.paddingVertical,
            // underline disabled
            BasicTextField.underline(
              field: 'underline_disabled',
              labelText: 'disabled',
              hintText: 'hint text',
              state: BasicTextFieldState.disabled,
            ),
            16.paddingVertical,
            // underline error
            BasicTextField.underline(
              field: 'underline_error',
              labelText: 'error',
              hintText: 'hint text',
              validationUIError: ValidationUIError(
                code: "error_code",
                message: "This is an error message",
                errors: [
                  ValidatorField(
                    fieldName: 'underline_error',
                    message: 'This is an error message for the field',
                  ),
                ],
              ),
            ),
            24.paddingVertical,
          ],
        ),
      ),
    );
  }
}
