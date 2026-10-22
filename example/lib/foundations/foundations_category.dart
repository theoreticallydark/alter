import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';

WidgetbookFolder foundationsCategory() {
  return WidgetbookFolder(
    name: 'Foundations',
    children: [
      WidgetbookComponent(
        name: 'AlterDeviceScope',
        useCases: [
          WidgetbookUseCase(
            name: 'Device Propagation Scope',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Ambient Device Mode',
                options: AlterDevice.values,
                labelBuilder: (d) => d.name.toUpperCase(),
                initialOption: AlterDevice.pc,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: AlterDeviceScope(
                    device: device,
                    child: Builder(
                      builder: (childContext) {
                        final resolved = AlterDeviceScope.of(childContext);
                        final isMobile = AlterDeviceScope.maybeOf(childContext) == AlterDevice.mobile;

                        return Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AlterSemanticTokens.baseWhite,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AlterSemanticTokens.stroke100,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    isMobile ? Icons.smartphone : Icons.desktop_windows,
                                    size: 28,
                                    color: AlterSemanticTokens.interactivePrimary,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'AlterDeviceScope',
                                    style: AlterTypography.h2,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Propagates ambient layout mode down the widget hierarchy so responsive blocks (BioMarker, ProjectMarker, MobileMarker) synchronize layout without individual resize queries.',
                                style: AlterTypography.body.copyWith(
                                  color: AlterSemanticTokens.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AlterSemanticTokens.baseNeutral,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ambient Mode: ${resolved.name.toUpperCase()}',
                                      style: AlterTypography.bodyLgBold.copyWith(
                                        color: AlterSemanticTokens.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'isMobile: ${resolved == AlterDevice.mobile} | isPc: ${resolved == AlterDevice.pc}',
                                      style: AlterTypography.caption.copyWith(
                                        color: AlterSemanticTokens.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
