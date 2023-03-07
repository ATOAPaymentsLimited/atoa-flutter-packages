import 'package:analyzer/error/error.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// Fix to add semanticsLabel property for Text widget
class AddSemanticsLabelFix extends DartFix {
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
      if (node.staticType!.element!.displayName != 'Text') return;

      // We verify that the variable declaration is where our warning is located
      // if (!analysisError.sourceRange.intersects(node.sourceRange)) return;

      // We define one edit, giving it a message which will show-up in the IDE.
      final changeBuilder = reporter.createChangeBuilder(
        message: 'Add semanticsLabel property',
        priority: 1,
      );

      // Add semanticsLabel property with the value set to the
      // first property of Text widget.
      changeBuilder.addDartFileEdit((builder) async {
        builder.addSimpleInsertion(
          analysisError.sourceRange.end - 1,
          "semanticsLabel: ${node.argumentList.arguments[0].toString().split(' ').last},",
        );
      });
    });
  }
}
