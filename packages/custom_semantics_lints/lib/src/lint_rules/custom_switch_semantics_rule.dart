import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../fixes/wrap_switch_with_semantics_widget_fix.dart';

class CustomSwitchSemanticsRule extends DartLintRule {
  CustomSwitchSemanticsRule() : super(code: _code);

  // Message to be shown for this semantic rule
  static const _code = LintCode(
    name: 'custom_switch_semantics_widget_missing',
    uniqueName: 'custom_switch_semantics_widget_missing',
    problemMessage: 'Custom switch should be wrapped with Semantics widget',
    errorSeverity: ErrorSeverity.ERROR,
  );

  // Check whether widget is wrapped with Semantics widget
  // else report to the dart analyzer
  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // InstanceCreationExpression refer to the widgets in the widget tree.
    context.registry.addInstanceCreationExpression((node) {
      if (node.staticType!.element!.displayName == 'CustomSwitch' &&
          node.parent!.parent!.parent!.beginToken.toString() != 'Semantics') {
        reporter.reportErrorForNode(code, node);
      }
    });
  }

  // Retrieve quick fix for this semantic rule
  @override
  List<Fix> getFixes() => [WrapSwitchWithSemanticsFix()];
}
