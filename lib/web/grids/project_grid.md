# ProjectGrid

Responsive project and portfolio grid layout consuming [ProjectMarker] cards for the Alter Design System.

## Figma Specification
- **Node ID**: [`795:3693`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=795-3693)
- **Component Set**: `ProjectGrid`
- **Variants**:
  - `device=PC, count=Single` (`795:4012`): 1 full-width ProjectMarker.
  - `device=PC, count=Double` (`795:3694`): 2-column ProjectMarker grid with 48px horizontal gap.
  - `device=Mobile, count=Single` (`795:4015`): 1 ProjectMarker.
  - `device=Mobile, count=Double` (`795:3702`): 1-column vertically stacked ProjectMarkers with 48px gap.

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `width` | `double?` | `null` | Optional fixed width (defaults to fill available parent width) |
| `device` | `ProjectGridDevice` | `ProjectGridDevice.auto` | Viewport adaptation mode (`auto`, `pc`, `mobile`) |
| `pcColumns` | `int` | `2` | Number of columns in PC mode |
| `crossAxisSpacing` | `double` | `48.0` | Horizontal spacing gap between columns |
| `mainAxisSpacing` | `double` | `48.0` | Vertical spacing gap between rows |
| `projects` | `List<Widget>?` | `null` | List of project items to display |
| `itemCount` | `int?` | `null` | Item count when using builder |
| `itemBuilder` | `IndexedWidgetBuilder?` | `null` | Item builder callback |
| `breakpoint` | `double` | `500.0` | Responsive width breakpoint for mobile vs PC |

## Child Components Reused
- [ProjectMarker](file:///c:/Vayu/Alter/lib/web/markers/project_marker.dart) (`795:6004`): Primary card item in the grid.
- [BioMarker](file:///c:/Vayu/Alter/lib/web/markers/bio_marker.dart) (`761:7097`): Reused inside ProjectMarker.

## Design Tokens Used
- **Spacing**: `48.0` px grid gaps (horizontal and vertical)
