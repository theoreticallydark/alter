import 'package:flutter/material.dart';
import 'swatches.dart';

/// Alter Design System Semantic Theme Tokens
/// Mapped to Figma Variable definitions and Swatches (Light Mode / Light Gray Mode).
abstract class AlterSemanticTokens {
  // ==========================================
  // Text Tokens
  // ==========================================
  /// Figma: VariableID:103:9007 -> black (#000000)
  static const Color textPrimary = AlterColors.black;

  /// Figma: VariableID:103:9008 -> colors/gray/600 (#4A5565)
  static const Color textSecondary = AlterColors.colorsGray600;

  /// Figma: VariableID:103:9014 -> colors/gray/400 (#99A1AF)
  static const Color textDisabled = AlterColors.colorsGray400;

  /// Figma: VariableID:669:6971 -> interactive.primary -> colors/gray/800 (#1E2939)
  static const Color textInteractive = interactivePrimary;

  /// Figma: VariableID:669:6972 -> interactive.primary-active -> colors/gray/900 (#101828)
  static const Color textInteractiveHover = interactivePrimaryActive;

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

  // ==========================================
  // Status Tokens
  // ==========================================
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

  /// Figma: VariableID:183:9415 -> interactive.primary -> colors/gray/800 (#1E2939)
  static const Color statusBrand = interactivePrimary;

  /// Figma: VariableID:183:9416 -> brand.brand-contrast -> white (#FFFFFF)
  static const Color statusBrandContrast = brandContrast;

  // ==========================================
  // Interactive Tokens
  // ==========================================
  /// Figma: VariableID:198:10630 -> brand.brand-800 -> colors/gray/800 (#1E2939)
  static const Color interactivePrimary = AlterColors.colorsGray800;

  /// Figma: VariableID:616:1065 -> brand.brand-900 -> colors/gray/900 (#101828)
  static const Color interactivePrimaryActive = AlterColors.colorsGray900;

  /// Figma: VariableID:669:6970 -> brand.brand-950 -> colors/gray/950 (#030712)
  static const Color interactivePrimaryBorder = AlterColors.colorsGray950;

  /// Figma: VariableID:669:6974 -> brand.brand-contrast -> white (#FFFFFF)
  static const Color interactivePrimaryContrast = AlterColors.white;

  // ==========================================
  // Base Surface Tokens
  // ==========================================
  /// Figma: VariableID:669:2780 -> base-neutral (#FAFAF8)
  static const Color baseNeutral = AlterColors.neutral050;

  /// Figma: VariableID:183:9418 -> white (#FFFFFF)
  static const Color baseWhite = AlterColors.white;

  /// Figma: VariableID:183:9417 -> colors/gray/050 (#F9FAFB)
  static const Color baseGray = AlterColors.colorsGray050;

  /// Figma: VariableID:603:854 -> colors/gray/200 (#E5E7EB)
  static const Color baseActive = AlterColors.colorsGray200;

  /// Figma: VariableID:706:13423 -> colors/gray/200 (#E5E7EB)
  static const Color baseBorder = AlterColors.colorsGray200;

  // ==========================================
  // Stroke Tokens
  // ==========================================
  /// Figma: VariableID:183:9420 -> colors/gray/100 (#F3F4F6)
  static const Color stroke100 = AlterColors.colorsGray100;

  /// Figma: VariableID:183:9421 -> colors/gray/200 (#E5E7EB)
  static const Color stroke200 = AlterColors.colorsGray200;

  /// Figma: VariableID:183:9422 -> black (#000000)
  static const Color stroke1000 = AlterColors.black;

  // ==========================================
  // Brand Palette Semantic Tokens (Light Gray Mode)
  // ==========================================
  /// Figma: VariableID:669:2769 -> colors/gray/050 (#F9FAFB)
  static const Color brand50 = AlterColors.colorsGray050;

  /// Figma: VariableID:669:2770 -> colors/gray/100 (#F3F4F6)
  static const Color brand100 = AlterColors.colorsGray100;

  /// Figma: VariableID:669:2771 -> colors/gray/200 (#E5E7EB)
  static const Color brand200 = AlterColors.colorsGray200;

  /// Figma: VariableID:669:2772 -> colors/gray/300 (#D1D5DC)
  static const Color brand300 = AlterColors.colorsGray300;

  /// Figma: VariableID:669:2773 -> colors/gray/400 (#99A1AF)
  static const Color brand400 = AlterColors.colorsGray400;

  /// Figma: VariableID:669:2774 -> colors/gray/500 (#6A7282)
  static const Color brand500 = AlterColors.colorsGray500;

  /// Figma: VariableID:669:2775 -> colors/gray/600 (#4A5565)
  static const Color brand600 = AlterColors.colorsGray600;

  /// Figma: VariableID:669:2776 -> colors/gray/700 (#333E4F)
  static const Color brand700 = AlterColors.colorsGray700;

  /// Figma: VariableID:669:2777 -> colors/gray/800 (#1E2939)
  static const Color brand800 = AlterColors.colorsGray800;

  /// Figma: VariableID:669:2778 -> colors/gray/900 (#101828)
  static const Color brand900 = AlterColors.colorsGray900;

  /// Figma: VariableID:669:2779 -> colors/gray/950 (#030712)
  static const Color brand950 = AlterColors.colorsGray950;

  /// Figma: VariableID:669:6973 -> white (#FFFFFF)
  static const Color brandContrast = AlterColors.white;
}