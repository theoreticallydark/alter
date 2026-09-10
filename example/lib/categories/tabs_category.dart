import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder tabsCategory() {
  return WidgetbookFolder(
    name: 'Tabs',
    children: [
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
                        'Gray Tabs (3 Items)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _StatefulTabsPreview(
                        tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
                        type: TabsType.gray,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'White Tabs (3 Items)',
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
                        child: _StatefulTabsPreview(
                          tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
                          type: TabsType.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Gray Tabs (5 Items)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _StatefulTabsPreview(
                        tabs: const ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4', 'Tab 5'],
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

  const _StatefulTabsPreview({
    required this.tabs,
    required this.type,
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
        selectedIndex: activeIndex,
        type: widget.type,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          showExampleToast(
            context,
            'Selected ${widget.tabs[index]} (Index $index)',
          );
        },
      ),
    );
  }
}
