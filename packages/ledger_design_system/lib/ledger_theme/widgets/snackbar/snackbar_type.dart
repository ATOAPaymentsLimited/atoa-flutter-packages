import 'package:flutter/material.dart';

@immutable
class SnackbarType {
  const SnackbarType.error(
    this.title, {
    this.description,
    this.ctaText,
    this.onCTA,
    this.loading = false,
    this.headerIcon,
    this.headerText,
  })  : type = SnackbarTypeEnum.error,
        assert(
          (ctaText == null && onCTA == null) ||
              (ctaText != null && onCTA != null),
          '`ctaText` and `onCTA` both should be provide or none at all',
        ),
        assert(
          (headerIcon == null && headerText == null) ||
              (headerIcon != null && headerText != null),
          '`headerText` and `headerIcon` both should be provide or none at all',
        );

  const SnackbarType.success(
    this.title, {
    this.description,
    this.ctaText,
    this.onCTA,
    this.loading = false,
    this.headerIcon,
    this.headerText,
  })  : type = SnackbarTypeEnum.success,
        assert(
          (ctaText == null && onCTA == null) ||
              (ctaText != null && onCTA != null),
          '`ctaText` and `onCTA` both should be provide or none at all',
        ),
        assert(
          (headerIcon == null && headerText == null) ||
              (headerIcon != null && headerText != null),
          '`headerText` and `headerIcon` both should be provide or none at all',
        );

  const SnackbarType.info(
    this.title, {
    this.description,
    this.ctaText,
    this.onCTA,
    this.loading = false,
    this.headerIcon,
    this.headerText,
  })  : type = SnackbarTypeEnum.info,
        assert(
          (ctaText == null && onCTA == null) ||
              (ctaText != null && onCTA != null),
          '`ctaText` and `onCTA` both should be provide or none at all',
        ),
        assert(
          (headerIcon == null && headerText == null) ||
              (headerIcon != null && headerText != null),
          '`headerText` and `headerIcon` both should be provide or none at all',
        );

  final bool loading;
  final String title;
  final String? description;
  final String? ctaText;
  final VoidCallback? onCTA;
  final SnackbarTypeEnum type;
  final Widget? headerIcon;
  final String? headerText;
}

enum SnackbarTypeEnum { error, success, info }
