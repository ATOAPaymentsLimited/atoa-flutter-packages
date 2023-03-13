import 'package:analyzer/error/error.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// Fix to wrap widget with Semantics widget
class WrapSwitchWithSemanticsFix extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
    // InstanceCreationExpression refer to the widgets in the widget tree.
    context.registry.addInstanceCreationExpression((node) {
      // Check whether Button or CustomSwitch or TextField widget
      // is wrapped with Semantics widget or not.
      if (node.staticType!.element!.displayName != 'CustomSwitch' ||
          node.parent!.parent!.parent!.beginToken.toString() == 'Semantics') {
        return;
      }

      // We verify that the variable declaration is where our warning is located
      if (!analysisError.sourceRange.intersects(node.sourceRange)) return;

      // We define one edit, giving it a message which will show-up in the IDE.
      final changeBuilder = reporter.createChangeBuilder(
        message: 'Wrap with Semantics widget',
        priority: 1,
      );

      // Wrap the widget with Semantics widget in the codebase
      changeBuilder.addDartFileEdit((builder) async {
        builder.addSimpleInsertion(
          analysisError.sourceRange.offset,
          """Semantics(
            button: true, 
            enabled: true, 
            label: "${node.argumentList.arguments[0].toString().split(' ').last}",
            child: """,
        );
        builder.addSimpleInsertion(
          analysisError.sourceRange.end,
          ")",
        );
      });
    });
  }
}
