import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/lint_rules/button_semantics_rule.dart';
import 'src/lint_rules/custom_switch_semantics_rule.dart';
import 'src/lint_rules/text_field_semantics_rule.dart';
import 'src/lint_rules/text_semantics_rule.dart';

// This is the entrypoint of the plugin.
PluginBase createPlugin() => _SemanticsLint();

class _SemanticsLint extends PluginBase {
  // List of rules the analyzer can check for the codebase.
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        TextSemanticsRule(),
        ButtonSemanticsRule(),
        CustomSwitchSemanticsRule(),
        TextFieldSemanticsRule(),
      ];
}
