import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../../toast_helper.dart';

WidgetbookFolder nodeCategory() {
  return WidgetbookFolder(
    name: 'Node',
    children: [
      WidgetbookComponent(
        name: 'NodeItem',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Workspace Documents',
              );
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: NodeItemType.values,
                labelBuilder: (t) => t.name,
              );
              final isSelected = context.knobs.boolean(
                label: 'Is Selected',
                initialValue: false,
              );
              final isCollapsed = context.knobs.boolean(
                label: 'Is Collapsed',
                initialValue: false,
              );
              final hasIcon = context.knobs.boolean(
                label: 'Has Icon',
                initialValue: true,
              );
              final hasRightSlot = context.knobs.boolean(
                label: 'Has Right Slot',
                initialValue: true,
              );
              final indentationLevel = context.knobs.int.slider(
                label: 'Indentation Level',
                initialValue: 0,
                min: 0,
                max: 3,
              );

              return Center(
                child: SizedBox(
                  width: isCollapsed ? null : 280,
                  child: NodeItem(
                    label: label,
                    type: type,
                    isSelected: isSelected,
                    isCollapsed: isCollapsed,
                    hasIcon: hasIcon,
                    hasRightSlot: hasRightSlot,
                    indentationLevel: indentationLevel,
                    onTap: () => showExampleToast(
                      context,
                      'Clicked NodeItem: "$label" (${type.name})',
                    ),
                    onToggleCollapse: () => showExampleToast(
                      context,
                      'Toggled collapse on "$label"',
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Tree View Hierarchy',
            builder: (context) {
              return Center(
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AlterSemanticTokens.baseBorder),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NodeItem(
                        label: 'Project Root',
                        type: NodeItemType.ghost,
                        iconData: Icons.folder_open_outlined,
                        hasRightSlot: true,
                        onTap: () {},
                      ),
                      const SizedBox(height: 2),
                      NodeItem(
                        label: 'src',
                        type: NodeItemType.ghost,
                        iconData: Icons.folder_outlined,
                        indentationLevel: 1,
                        hasRightSlot: true,
                        onTap: () {},
                      ),
                      const SizedBox(height: 2),
                      NodeItem(
                        label: 'index.dart',
                        type: NodeItemType.gray,
                        iconData: Icons.description_outlined,
                        indentationLevel: 2,
                        isSelected: true,
                        onTap: () {},
                      ),
                      const SizedBox(height: 2),
                      NodeItem(
                        label: 'README.md',
                        type: NodeItemType.ghost,
                        iconData: Icons.article_outlined,
                        indentationLevel: 1,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Variant Matrix',
            builder: (context) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Ghost Variants', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        SizedBox(
                          width: 220,
                          child: NodeItem(
                            label: 'Default Ghost',
                            type: NodeItemType.ghost,
                            hasRightSlot: true,
                          ),
                        ),
                        SizedBox(
                          width: 220,
                          child: NodeItem(
                            label: 'Hover Ghost',
                            type: NodeItemType.ghost,
                            isHovered: true,
                            hasRightSlot: true,
                          ),
                        ),
                        SizedBox(
                          width: 220,
                          child: NodeItem(
                            label: 'Selected Ghost',
                            type: NodeItemType.ghost,
                            isSelected: true,
                            hasRightSlot: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('Gray Variants', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        SizedBox(
                          width: 220,
                          child: NodeItem(
                            label: 'Default Gray',
                            type: NodeItemType.gray,
                            hasRightSlot: true,
                          ),
                        ),
                        SizedBox(
                          width: 220,
                          child: NodeItem(
                            label: 'Hover Gray',
                            type: NodeItemType.gray,
                            isHovered: true,
                            hasRightSlot: true,
                          ),
                        ),
                        SizedBox(
                          width: 220,
                          child: NodeItem(
                            label: 'Selected Gray',
                            type: NodeItemType.gray,
                            isSelected: true,
                            hasRightSlot: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('Collapsed Tiles', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        NodeItem(
                          type: NodeItemType.ghost,
                          isCollapsed: true,
                        ),
                        SizedBox(width: 8),
                        NodeItem(
                          type: NodeItemType.ghost,
                          isHovered: true,
                          isCollapsed: true,
                        ),
                        SizedBox(width: 8),
                        NodeItem(
                          type: NodeItemType.gray,
                          isCollapsed: true,
                        ),
                        SizedBox(width: 8),
                        NodeItem(
                          type: NodeItemType.gray,
                          isSelected: true,
                          isCollapsed: true,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
