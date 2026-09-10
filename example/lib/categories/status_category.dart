import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';

WidgetbookFolder statusCategory() {
  return WidgetbookFolder(
    name: 'Status',
    children: [
      WidgetbookComponent(
        name: 'Toast',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Feedback Text',
              );
              final status = context.knobs.object.dropdown(
                label: 'Status',
                options: ToastStatus.values,
                labelBuilder: (s) => s.name.toUpperCase(),
                initialOption: ToastStatus.neutral,
              );
              final hasIcon = context.knobs.boolean(
                label: 'Has Icon',
                initialValue: true,
              );

              return Center(
                child: Toast(
                  label: label,
                  status: status,
                  hasIcon: hasIcon,
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Status Variants Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final status in ToastStatus.values) ...[
                        Text(
                          'Status: ${status.name.toUpperCase()}',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Toast(
                          label: 'This is a ${status.name} toast notification banner.',
                          status: status,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'FeedbackText',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final text = context.knobs.string(
                label: 'Text',
                initialValue: 'Feedback Text',
              );
              final status = context.knobs.object.dropdown(
                label: 'Status',
                options: FeedbackTextStatus.values,
                labelBuilder: (s) => s.name.toUpperCase(),
                initialOption: FeedbackTextStatus.danger,
              );
              final hasIcon = context.knobs.boolean(
                label: 'Has Icon',
                initialValue: true,
              );

              return Center(
                child: FeedbackText(
                  text: text,
                  status: status,
                  hasIcon: hasIcon,
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Status Variants Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final status in FeedbackTextStatus.values) ...[
                        Text(
                          'Status: ${status.name.toUpperCase()}',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        FeedbackText(
                          text: 'This is a ${status.name} feedback message.',
                          status: status,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ],
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
