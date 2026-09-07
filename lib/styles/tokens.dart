import 'package:flutter/material.dart';
import 'swatches.dart';

/// Alter Design System Semantic Theme Tokens
/// Mapped to Figma Variable definitions and Swatches (Light Mode).
abstract class AlterSemanticTokens {
  // Text Tokens
  /// Figma: VariableID:103:9007 -> black (#000000)
  static const Color textPrimary = AlterColors.black;

  /// Figma: VariableID:103:9008 -> colors/gray/600 (#4A5565)
  static const Color textSecondary = AlterColors.colorsGray600;

  /// Figma: VariableID:103:9014 -> colors/gray/400 (#99A1AF)
  static const Color textDisabled = AlterColors.colorsGray400;

  /// Figma: VariableID:103:9013 -> white (#FFFFFF)
  static const Color textInverse = AlterColors.white;

  /// Figma: VariableID:103:9012 -> colors/yellow/600 (#D08700)
  static const Color textCaution = AlterColors.colorsYellow600;

  /// Figma: VariableID:103:9011 -> colors/orange/800 (#8A2C0D)
  static const Color textWarning = AlterColors.colorsOrange800;

  /// Figma: VariableID:103:9010 -> colors/red/600 (#E7000B)
  static const Color textDanger = AlterColors.colorsRed600;

  /// Figma: VariableID:103:9009 -> colors/green/600 (#00A63E)
  static const Color textSuccess = AlterColors.colorsGreen600;

  // Status Tokens
  /// Figma: VariableID:349:15957 -> colors/red/600 (#E7000B)
  static const Color statusDanger = AlterColors.colorsRed600;

  /// Figma: VariableID:349:15958 -> white (#FFFFFF)
  static const Color statusDangerContrast = AlterColors.white;

  /// Figma: VariableID:202:10631 -> colors/orange/800 (#8A2C0D)
  static const Color statusWarning = AlterColors.colorsOrange800;

  /// Figma: VariableID:202:10632 -> white (#FFFFFF)
  static const Color statusWarningContrast = AlterColors.white;

  /// Figma: VariableID:349:15959 -> colors/yellow/400 (#FDC700)
  static const Color statusCaution = AlterColors.colorsYellow400;

  /// Figma: VariableID:349:15960 -> black (#000000)
  static const Color statusCautionContrast = AlterColors.black;

  /// Figma: VariableID:183:9413 -> colors/green/600 (#00A63E)
  static const Color statusSuccess = AlterColors.colorsGreen600;

  /// Figma: VariableID:183:9414 -> white (#FFFFFF)
  static const Color statusSuccessContrast = AlterColors.white;

  /// Figma: VariableID:183:9415 -> colors/teal/600 (#009689)
  static const Color statusTeal = AlterColors.colorsTeal600;

  /// Figma: VariableID:183:9416 -> white (#FFFFFF)
  static const Color statusTealContrast = AlterColors.white;

  // Base Surface Tokens
  /// Figma: VariableID:183:9417 -> colors/gray/050 (#F9FAFB)
  static const Color baseGray = AlterColors.colorsGray050;

  /// Figma: VariableID:183:9418 -> white (#FFFFFF)
  static const Color baseWhite = AlterColors.white;

  /// Figma: VariableID:198:10630 -> colors/gray/800 (#1E2939)
  static const Color baseBlack = AlterColors.colorsGray800;

  // Stroke Tokens
  /// Figma: VariableID:183:9420 -> colors/gray/100 (#F3F4F6)
  static const Color stroke100 = AlterColors.colorsGray100;

  /// Figma: VariableID:183:9421 -> colors/gray/200 (#E5E7EB)
  static const Color stroke200 = AlterColors.colorsGray200;

  /// Figma: VariableID:183:9422 -> black (#000000)
  static const Color stroke1000 = AlterColors.black;

  // UI Element Tokens
  /// Figma: VariableID:183:9637 -> colors/gray/100 (#F3F4F6)
  static const Color ui1 = AlterColors.colorsGray100;

  /// Figma: VariableID:183:9481 -> colors/gray/200 (#E5E7EB)
  static const Color ui2 = AlterColors.colorsGray200;

  /// Figma: VariableID:183:9483 -> colors/gray/400 (#99A1AF)
  static const Color ui4 = AlterColors.colorsGray400;

  /// Figma: VariableID:183:9484 -> colors/gray/600 (#4A5565)
  static const Color ui6 = AlterColors.colorsGray600;
}