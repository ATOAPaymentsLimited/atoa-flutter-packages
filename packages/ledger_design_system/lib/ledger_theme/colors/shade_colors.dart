import 'dart:ui';

import 'package:ledger_design_system/ledger_theme/colors/abstract_color_system.dart';

/// These are the main neutral, brand and semantic colors that make up the majority of the colors used in the design system and components.
class NeutralColors {
  NeutralColors._({required this.grey});
  NeutralColors.light() : grey = Grey.light();
  NeutralColors.dark() : grey = Grey.dark();
  final Grey grey;

  NeutralColors copyWith({Grey? grey}) =>
      NeutralColors._(grey: grey ?? this.grey);

  NeutralColors lerp(covariant NeutralColors? other, double t) {
    if (other is! NeutralColors) return this;
    return NeutralColors._(grey: grey.lerp(other.grey, t));
  }
}

/// These are the main brand and semantic colors that make up the majority of the colors used in the design system and components.
class BrandColors {
  BrandColors._({required this.primary});
  BrandColors.light() : primary = Primary.light();
  BrandColors.dark() : primary = Primary.dark();
  final Primary primary;
  BrandColors copyWith({Primary? primary}) =>
      BrandColors._(primary: primary ?? this.primary);

  BrandColors lerp(covariant BrandColors? other, double t) {
    if (other is! BrandColors) return this;
    return BrandColors._(primary: primary.lerp(other.primary, t));
  }
}

/// The brand color is your "primary" color, and is used across all interactive elements such as buttons, links, inputs, etc. This color can define the overall feel and can elicit emotion.
class Primary extends ShadeColorSystem {
  Primary._(
    this._shade10,
    this._shade50,
    this._shade100,
    this._shade200,
    this._shade300,
    this._shade400,
    this._shade500,
    this._shade600,
    this._shade700,
    this._shade800,
    this._shade900,
  );
  Primary.light()
      : _shade10 = const Color(0xFFFFF6F8),
        _shade50 = const Color(0xFFFCEAED),
        _shade100 = const Color(0xFFF6BDC7),
        _shade200 = const Color(0xFFF19DAC),
        _shade300 = const Color(0xFFEB7086),
        _shade400 = const Color(0xFFE7546E),
        _shade500 = const Color(0xFFE42646),
        _shade600 = const Color(0xFFCD2543),
        _shade700 = const Color(0xFFA01D35),
        _shade800 = const Color(0xFF7C1729),
        _shade900 = const Color(0xFF5F111F);
  Primary.dark()
      : _shade10 = const Color(0xFF2D060E),
        _shade50 = const Color(0xFF470B16),
        _shade100 = const Color(0xFF60101E),
        _shade200 = const Color(0xFF7D1425),
        _shade300 = const Color(0xFF9B162D),
        _shade400 = const Color(0xFFB21934),
        _shade500 = const Color(0xFFE42646),
        _shade600 = const Color(0xFFC66878),
        _shade700 = const Color(0xFFCA8D96),
        _shade800 = const Color(0xFFCB9DA5),
        _shade900 = const Color(0xFFD5C2C5);
  final Color _shade10;
  final Color _shade50;
  final Color _shade100;
  final Color _shade200;
  final Color _shade300;
  final Color _shade400;
  final Color _shade500;
  final Color _shade600;
  final Color _shade700;
  final Color _shade800;
  final Color _shade900;
  @override
  Color get shade10 => _shade10;

  @override
  Color get shade50 => _shade50;

  @override
  Color get shade100 => _shade100;

  @override
  Color get shade200 => _shade200;

  @override
  Color get shade300 => _shade300;

  @override
  Color get shade400 => _shade400;

  @override
  Color get shade500 => _shade500;

  @override
  Color get shade600 => _shade600;

  @override
  Color get shade700 => _shade700;

  @override
  Color get shade800 => _shade800;

  @override
  Color get shade900 => _shade900;

  @override
  Primary copyWith({
    Color? shade10,
    Color? shade50,
    Color? shade100,
    Color? shade200,
    Color? shade300,
    Color? shade400,
    Color? shade500,
    Color? shade600,
    Color? shade700,
    Color? shade800,
    Color? shade900,
  }) =>
      Primary._(
        shade10 ?? this.shade10,
        shade50 ?? this.shade50,
        shade100 ?? this.shade100,
        shade200 ?? this.shade200,
        shade300 ?? this.shade300,
        shade400 ?? this.shade400,
        shade500 ?? this.shade500,
        shade600 ?? this.shade600,
        shade700 ?? this.shade700,
        shade800 ?? this.shade800,
        shade900 ?? this.shade900,
      );

  @override
  Primary lerp(covariant Primary? other, double t) {
    if (other is! Primary) return this;
    return Primary._(
      Color.lerp(shade10, other.shade10, t) ?? shade10,
      Color.lerp(shade50, other.shade50, t) ?? shade50,
      Color.lerp(shade100, other.shade100, t) ?? shade100,
      Color.lerp(shade200, other.shade200, t) ?? shade200,
      Color.lerp(shade300, other.shade300, t) ?? shade300,
      Color.lerp(shade400, other.shade400, t) ?? shade400,
      Color.lerp(shade500, other.shade500, t) ?? shade500,
      Color.lerp(shade600, other.shade600, t) ?? shade600,
      Color.lerp(shade700, other.shade700, t) ?? shade700,
      Color.lerp(shade800, other.shade800, t) ?? shade800,
      Color.lerp(shade900, other.shade900, t) ?? shade900,
    );
  }
}

/// Grey is a neutral color and is the foundation of the color system.
/// Almost everything in UI design
/// — text, form fields, backgrounds, dividers —
/// are usually grey.
///
/// Grey 10 → Hover state on white cards
/// Grey 50 → Default card background
class Grey extends ShadeColorSystem {
  Grey._(
    this._shade10,
    this._shade50,
    this._shade100,
    this._shade200,
    this._shade300,
    this._shade400,
    this._shade500,
    this._shade600,
    this._shade700,
    this._shade800,
    this._shade900,
  );
  Grey.light()
      : _shade10 = const Color(0xFFFBFCFC),
        _shade50 = const Color(0xFFF6F8F9),
        _shade100 = const Color(0xFFF2F5F6),
        _shade200 = const Color(0xFFEAEEF0),
        _shade300 = const Color(0xFFCED7DD),
        _shade400 = const Color(0xFF97A6B2),
        _shade500 = const Color(0xFF6A8090),
        _shade600 = const Color(0xFF475664),
        _shade700 = const Color(0xFF29333A),
        _shade800 = const Color(0xFF1B2228),
        _shade900 = const Color(0xFF151B20);
  Grey.dark()
      : _shade10 = const Color(0xFF1D1D1D),
        _shade50 = const Color(0xFF242424),
        _shade100 = const Color(0xFF2E2E2E),
        _shade200 = const Color(0xFF404040),
        _shade300 = const Color(0xFF585858),
        _shade400 = const Color(0xFF707070),
        _shade500 = const Color(0xFF888888),
        _shade600 = const Color(0xFFCACACA),
        _shade700 = const Color(0xFFE2E2E2),
        _shade800 = const Color(0xFFF3F3F3),
        _shade900 = const Color(0xFFF8F8F8);

  final Color _shade10;
  final Color _shade50;
  final Color _shade100;
  final Color _shade200;
  final Color _shade300;
  final Color _shade400;
  final Color _shade500;
  final Color _shade600;
  final Color _shade700;
  final Color _shade800;
  final Color _shade900;
  @override
  Color get shade10 => _shade10;

  @override
  Color get shade50 => _shade50;

  @override
  Color get shade100 => _shade100;

  @override
  Color get shade200 => _shade200;

  @override
  Color get shade300 => _shade300;

  @override
  Color get shade400 => _shade400;

  @override
  Color get shade500 => _shade500;

  @override
  Color get shade600 => _shade600;

  @override
  Color get shade700 => _shade700;

  @override
  Color get shade800 => _shade800;

  @override
  Color get shade900 => _shade900;

  @override
  Grey copyWith({
    Color? shade10,
    Color? shade50,
    Color? shade100,
    Color? shade200,
    Color? shade300,
    Color? shade400,
    Color? shade500,
    Color? shade600,
    Color? shade700,
    Color? shade800,
    Color? shade900,
  }) =>
      Grey._(
        shade10 ?? this.shade10,
        shade50 ?? this.shade50,
        shade100 ?? this.shade100,
        shade200 ?? this.shade200,
        shade300 ?? this.shade300,
        shade400 ?? this.shade400,
        shade500 ?? this.shade500,
        shade600 ?? this.shade600,
        shade700 ?? this.shade700,
        shade800 ?? this.shade800,
        shade900 ?? this.shade900,
      );

  @override
  Grey lerp(covariant Grey? other, double t) {
    if (other is! Grey) return this;
    return Grey._(
      Color.lerp(shade10, other.shade10, t) ?? shade10,
      Color.lerp(shade50, other.shade50, t) ?? shade50,
      Color.lerp(shade100, other.shade100, t) ?? shade100,
      Color.lerp(shade200, other.shade200, t) ?? shade200,
      Color.lerp(shade300, other.shade300, t) ?? shade300,
      Color.lerp(shade400, other.shade400, t) ?? shade400,
      Color.lerp(shade500, other.shade500, t) ?? shade500,
      Color.lerp(shade600, other.shade600, t) ?? shade600,
      Color.lerp(shade700, other.shade700, t) ?? shade700,
      Color.lerp(shade800, other.shade800, t) ?? shade800,
      Color.lerp(shade900, other.shade900, t) ?? shade900,
    );
  }
}
