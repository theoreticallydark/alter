import 'package:flutter/material.dart' hide Checkbox, Divider;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder utilitiesCategory() {
  return WidgetbookFolder(
    name: 'Utilities',
    children: [
      WidgetbookComponent(
        name: 'Avatar',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: AvatarType.values,
                labelBuilder: (t) => t.name,
                initialOption: AvatarType.placeholder,
              );

              final size = context.knobs.object.dropdown<double>(
                label: 'Size',
                options: [24.0, 32.0, 40.0, 48.0, 64.0],
                labelBuilder: (s) => '${s.toInt()}px',
                initialOption: 32.0,
              );

              final initials = context.knobs.stringOrNull(
                label: 'Initials (Placeholder)',
                initialValue: null,
              );

              final icon = context.knobs.objectOrNull.dropdown<IconData?>(
                label: 'Icon (Placeholder)',
                options: const [
                  Icons.face_5_outlined,
                  Icons.person_outline,
                  Icons.account_circle_outlined,
                  Icons.star_border_rounded,
                ],
                labelBuilder: (i) {
                  if (i == Icons.face_5_outlined) return 'Face 5 (Default)';
                  if (i == Icons.person_outline) return 'Person';
                  if (i == Icons.account_circle_outlined) return 'Account Circle';
                  if (i == Icons.star_border_rounded) return 'Star';
                  return 'Custom';
                },
                initialOption: Icons.face_5_outlined,
              );

              final imageUrl = context.knobs.string(
                label: 'Image URL (Type=Image)',
                initialValue: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Avatar(
                    type: type,
                    size: size,
                    imageUrl: type == AvatarType.image ? imageUrl : null,
                    initials: initials,
                    icon: icon,
                    onTap: () => showExampleToast(
                      context,
                      'Tapped Avatar (${type.name}, ${size.toInt()}px)',
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PLACEHOLDER VARIANTS (Figma Node 655:11314)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Wrap(
                        spacing: 16,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Avatar.placeholder(size: 24),
                          Avatar.placeholder(size: 32),
                          Avatar.placeholder(size: 40),
                          Avatar.placeholder(size: 48),
                          Avatar.initials(initials: 'RC', size: 32),
                          Avatar.initials(initials: 'JD', size: 48),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'IMAGE VARIANTS (Figma Node 655:11312)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Wrap(
                        spacing: 16,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Avatar.network(
                            url: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
                            size: 24,
                          ),
                          Avatar.network(
                            url: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
                            size: 32,
                          ),
                          Avatar.network(
                            url: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
                            size: 48,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'AVATAR INSIDE LIST ITEM',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ListItem(
                        title: 'Roberta Casas',
                        subtitle: 'Product Designer',
                        leftSlot: const Avatar.placeholder(size: 32),
                        hasRightSlotOne: false,
                        hasRightSlotTwo: false,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'ListItem',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Main List Item Title',
              );
              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'Supporting descriptive subtitle',
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListItem(
                    title: title,
                    subtitle: subtitle,
                    hasSubtitle: context.knobs.boolean(
                      label: 'Has Subtitle',
                      initialValue: true,
                    ),
                    hasLeftSlot: context.knobs.boolean(
                      label: 'Has Left Action Slot',
                      initialValue: true,
                    ),
                    hasRightSlotOne: context.knobs.boolean(
                      label: 'Has Right Checkbox Slot',
                      initialValue: true,
                    ),
                    hasRightSlotTwo: context.knobs.boolean(
                      label: 'Has Right Toggle Favorite Slot',
                      initialValue: true,
                    ),
                    onTap: () => showExampleToast(
                      context,
                      'Clicked ListItem: "$title"',
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Grouped List',
            builder: (context) {
              return ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  ListItem(
                    title: 'System Preferences',
                    subtitle: 'Manage notifications and accounts',
                    onTap: () => showExampleToast(
                      context,
                      'Clicked List Item: "System Preferences"',
                    ),
                  ),
                  const Divider(height: 1),
                  ListItem(
                    title: 'Privacy & Security',
                    subtitle: 'Biometrics and passwords',
                    onTap: () => showExampleToast(
                      context,
                      'Clicked List Item: "Privacy & Security"',
                    ),
                  ),
                  const Divider(height: 1),
                  ListItem(
                    title: 'Display Appearance',
                    subtitle: 'Light and Dark mode settings',
                    onTap: () => showExampleToast(
                      context,
                      'Clicked List Item: "Display Appearance"',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'Divider',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final axis = context.knobs.object.dropdown(
                label: 'Axis',
                options: Axis.values,
                labelBuilder: (a) => a.name,
                initialOption: Axis.horizontal,
              );

              final thickness = context.knobs.object.dropdown<double>(
                label: 'Thickness',
                options: const [1.0, 2.0, 3.0, 4.0],
                labelBuilder: (t) => '${t.toInt()}px',
                initialOption: 1.0,
              );

              final indent = context.knobs.object.dropdown<double>(
                label: 'Indent',
                options: const [0.0, 12.0, 24.0, 48.0],
                labelBuilder: (i) => '${i.toInt()}px',
                initialOption: 0.0,
              );

              final endIndent = context.knobs.object.dropdown<double>(
                label: 'End Indent',
                options: const [0.0, 12.0, 24.0, 48.0],
                labelBuilder: (i) => '${i.toInt()}px',
                initialOption: 0.0,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: axis == Axis.horizontal
                      ? SizedBox(
                          width: 400,
                          child: Divider(
                            axis: axis,
                            thickness: thickness,
                            indent: indent,
                            endIndent: endIndent,
                          ),
                        )
                      : SizedBox(
                          height: 200,
                          child: Divider(
                            axis: axis,
                            thickness: thickness,
                            indent: indent,
                            endIndent: endIndent,
                          ),
                        ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HORIZONTAL DIVIDER (Figma Node 559:916)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 400,
                        child: Divider(),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'INDENTED DIVIDER (24px padding)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 400,
                        child: Divider(
                          indent: 24,
                          endIndent: 24,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'VERTICAL DIVIDER (48px height)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        height: 48,
                        child: Divider.vertical(),
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
