# GraphicsGridBlock

Responsive project and portfolio grid layout consuming [GraphicsBlock] cards for the Alter Design System.

## Figma Specification
- **Node ID**: [`795:3693`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=795-3693)
- **Component Set**: `GraphicsGridBlock`
- **Variants**:
  - `device=PC, count=Single` (`795:4012`): 1 full-width GraphicsBlock.
  - `device=PC, count=Double` (`795:3694`): 2-column GraphicsBlock grid with 48px horizontal gap.
  - `device=Mobile, count=Single` (`795:4015`): 1 GraphicsBlock.
  - `device=Mobile, count=Double` (`795:3702`): 1-column vertically stacked GraphicsBlocks with 48px gap.

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `width` | `double?` | `null` | Optional fixed width (defaults to fill available parent width) |
| `device` | `GraphicsGridBlockDevice` | `GraphicsGridBlockDevice.auto` | Viewport adaptation mode (`auto`, `pc`, `mobile`) |
| `pcColumns` | `int` | `2` | Number of columns in PC mode |
| `crossAxisSpacing` | `double` | `48.0` | Horizontal spacing gap between columns |
| `mainAxisSpacing` | `double` | `48.0` | Vertical spacing gap between rows |
| `projects` | `List<Widget>?` | `null` | List of project items to display |
| `itemCount` | `int?` | `null` | Item count when using builder |
| `itemBuilder` | `IndexedWidgetBuilder?` | `null` | Item builder callback |
| `breakpoint` | `double` | `500.0` | Responsive width breakpoint for mobile vs PC |

## Child Components Reused
- [GraphicsBlock](file:///c:/Vayu/Alter/lib/web/graphics_block.dart) (`795:6004`): Primary card item in the grid.
- [BiographyBlock](file:///c:/Vayu/Alter/lib/web/biography_block.dart) (`761:7097`): Reused inside GraphicsBlock.

## Design Tokens Used
- **Spacing**: `48.0` px grid gaps (horizontal and vertical)

## Changelog
- **`v1.1.0`**: Renamed from `ProjectGrid` to `GraphicsGridBlock` matching Figma Node `795:3693`, moved to `/lib/web/`, retained `ProjectGrid` typedef for backwards compatibility.
- **`v1.0.1`**: Added ambient `AlterDeviceScope` propagation so child `GraphicsBlock` cards inherit device mode directly from grid width.
- **`v1.0.0`**: Initial release matching Figma Node `795:3693`.

