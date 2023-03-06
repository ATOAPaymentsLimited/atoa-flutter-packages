import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../fixes/add_semantics_label_fix.dart';

class TextSemanticsRule extends DartLintRule {
  TextSemanticsRule() : super(code: _code);

  // Message to be shown for this semantic rule
  static const _code = LintCode(
    name: 'text_semanticLabel_property_missing',
    problemMessage: 'Missing semanticsLabel property',
    errorSeverity: ErrorSeverity.ERROR,
  );

  // Check whether widget is has semanticsLabel property
  // else report to the dart analyzer
  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // InstanceCreationExpression refer to the widgets in the widget tree.
    context.registry.addInstanceCreationExpression((node) {
      if (node.staticType!.element!.displayName == 'Text') {
        ArgumentList argumentList = node.argumentList;

        bool containsSemanticsLabel = false;

        for (var argument in argumentList.arguments) {
          if (argument.toString().contains('semanticsLabel')) {
            containsSemanticsLabel = true;
          }
        }

        if (!containsSemanticsLabel) {
          reporter.reportErrorForNode(code, node);
        }
      }
    });
  }

  // Retrieve quick fix for this semantic rule
  @override
  List<Fix> getFixes() => [AddSemanticsLabelFix()];
}
