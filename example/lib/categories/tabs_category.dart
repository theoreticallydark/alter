import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder tabsCategory() {
  return WidgetbookFolder(
    name: 'Tabs',
    children: [
      WidgetbookComponent(
        name: 'TabItem',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Label',
              );

              final hasLabel = context.knobs.boolean(
                label: 'Has Label',
                initialValue: true,
              );

              final hasIcon = context.knobs.boolean(
                label: 'Has Icon',
                initialValue: false,
              );

              final icon = context.knobs.objectOrNull.dropdown<IconData?>(
                label: 'Icon',
                options: const [
                  Icons.face_5_outlined,
                  Icons.home_outlined,
                  Icons.search_rounded,
                  Icons.settings_outlined,
                  Icons.star_border_rounded,
                ],
                labelBuilder: (i) {
                  if (i == Icons.face_5_outlined) return 'Face 5 (Default)';
                  if (i == Icons.home_outlined) return 'Home';
                  if (i == Icons.search_rounded) return 'Search';
                  if (i == Icons.settings_outlined) return 'Settings';
                  if (i == Icons.star_border_rounded) return 'Star';
                  return 'Custom';
                },
                initialOption: Icons.face_5_outlined,
              );

              final isSelected = context.knobs.boolean(
                label: 'Is Selected / Active',
                initialValue: true,
              );

              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: TabItemType.values,
                labelBuilder: (t) => t.name,
                initialOption: TabItemType.gray,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: TabItem(
                    label: label,
                    hasLabel: hasLabel,
                    hasIcon: hasIcon,
                    icon: icon,
                    isSelected: isSelected,
                    type: type,
                    onTap: () => showExampleToast(
                      context,
                      'TabItem tapped (Active: $isSelected, Type: ${type.name})',
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GRAY TYPE (Figma Node 336:10501)',
                          style: AlterTypography.h4Bold.copyWith(
                            color: AlterSemanticTokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            const TabItem(
                              label: 'Active Tab',
                              isSelected: true,
                              type: TabItemType.gray,
                            ),
                            const TabItem(
                              label: 'Default Tab',
                              isSelected: false,
                              type: TabItemType.gray,
                            ),
                            const TabItem(
                              label: 'With Icon',
                              hasIcon: true,
                              isSelected: true,
                              type: TabItemType.gray,
                            ),
                            const TabItem(
                              hasIcon: true,
                              hasLabel: false,
                              isSelected: true,
                              type: TabItemType.gray,
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'WHITE TYPE',
                          style: AlterTypography.h4Bold.copyWith(
                            color: AlterSemanticTokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AlterSemanticTokens.baseGray,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              TabItem(
                                label: 'Active White',
                                isSelected: true,
                                type: TabItemType.white,
                              ),
                              TabItem(
                                label: 'Default White',
                                isSelected: false,
                                type: TabItemType.white,
                              ),
                              TabItem(
                                label: 'With Icon',
                                hasIcon: true,
                                isSelected: true,
                                type: TabItemType.white,
                              ),
                              TabItem(
                                hasIcon: true,
                                hasLabel: false,
                                isSelected: true,
                                type: TabItemType.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'Tabs',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: TabsType.values,
                labelBuilder: (t) => t.name,
                initialOption: TabsType.gray,
              );

              final hasIcon = context.knobs.boolean(
                label: 'Has Icon',
                initialValue: false,
              );

              final hasLabel = context.knobs.boolean(
                label: 'Has Label',
                initialValue: true,
              );

              final icon = context.knobs.objectOrNull.dropdown<IconData?>(
                label: 'Icon',
                options: const [
                  Icons.face_5_outlined,
                  Icons.home_outlined,
                  Icons.search_rounded,
                  Icons.settings_outlined,
                  Icons.star_border_rounded,
                ],
                labelBuilder: (i) {
                  if (i == Icons.face_5_outlined) return 'Face 5 (Default)';
                  if (i == Icons.home_outlined) return 'Home';
                  if (i == Icons.search_rounded) return 'Search';
                  if (i == Icons.settings_outlined) return 'Settings';
                  if (i == Icons.star_border_rounded) return 'Star';
                  return 'Custom';
                },
                initialOption: Icons.face_5_outlined,
              );

              final tabCount = context.knobs.object.dropdown(
                label: 'Tab Count',
                options: [2, 3, 4, 5],
                labelBuilder: (c) => '$c Tabs',
                initialOption: 3,
              );

              final tabList = List.generate(
                tabCount,
                (i) => 'Tab ${i + 1}',
              );

              return _StatefulTabsPreview(
                tabs: tabList,
                type: type,
                hasIcon: hasIcon,
                hasLabel: hasLabel,
                icon: icon,
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gray Tabs (Standard)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const _StatefulTabsPreview(
                        tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
                        type: TabsType.gray,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'White Tabs (Standard)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AlterSemanticTokens.baseGray,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const _StatefulTabsPreview(
                          tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
                          type: TabsType.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Tabs with Icons (Composite)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const _StatefulTabsPreview(
                        tabs: ['Home', 'Search', 'Profile'],
                        hasIcon: true,
                        icons: [
                          Icons.home_outlined,
                          Icons.search_rounded,
                          Icons.face_5_outlined,
                        ],
                        type: TabsType.gray,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Icon-Only Tabs (hasLabel: false)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const _StatefulTabsPreview(
                        tabs: ['', '', ''],
                        hasIcon: true,
                        hasLabel: false,
                        icons: [
                          Icons.grid_view_rounded,
                          Icons.view_list_rounded,
                          Icons.settings_outlined,
                        ],
                        type: TabsType.gray,
                      ),
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

class _StatefulTabsPreview extends StatefulWidget {
  final List<String> tabs;
  final TabsType type;
  final bool hasIcon;
  final bool hasLabel;
  final IconData? icon;
  final List<IconData?>? icons;

  const _StatefulTabsPreview({
    required this.tabs,
    required this.type,
    this.hasIcon = false,
    this.hasLabel = true,
    this.icon = Icons.face_5_outlined,
    this.icons,
  });

  @override
  State<_StatefulTabsPreview> createState() => _StatefulTabsPreviewState();
}

class _StatefulTabsPreviewState extends State<_StatefulTabsPreview> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Keep index within bounds if tab list dynamically resizes
    final activeIndex = _selectedIndex < widget.tabs.length ? _selectedIndex : 0;

    return Center(
      child: Tabs(
        tabs: widget.tabs,
        hasIcon: widget.hasIcon,
        hasLabel: widget.hasLabel,
        icon: widget.icon,
        icons: widget.icons,
        selectedIndex: activeIndex,
        type: widget.type,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          final label = widget.tabs[index].isNotEmpty ? widget.tabs[index] : 'Tab ${index + 1}';
          showExampleToast(
            context,
            'Selected $label (Index $index)',
          );
        },
      ),
    );
  }
}
