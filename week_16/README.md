# Week 16: Advanced Notes App.

A beautiful and feature-rich Flutter notes application with **stunning animations**, **professional UI design**, and **persistent storage**. Built with modern Material Design 3 principles and the animate_do package for smooth, delightful animations.A new Flutter project.

## 📱 Screenshots & Features

### ✨ Key FeaturesThis project is a starting point for a Flutter application.

- **Beautiful Note Creation** - Create and edit notes with a clean, intuitive interfaceA few resources to get you started if this is your first Flutter project:

- **8 Gorgeous Color Themes** - Each note can have its own vibrant color scheme

- **Swipe to Delete** - Intuitive swipe gesture with undo functionality

- **Persistent Storage** - Notes are saved locally using SharedPreferencesFor help getting started with Flutter development, view the

- **Empty State Design** - Engaging empty state with helpful animationssamples, guidance on mobile development, and a full API reference.

- **Responsive Design** - Works beautifully on all screen sizes

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/8ae1576f-db63-4238-8f0f-2d038c60fd6c" alt="Home Screen" width="300"/></td>
    <td><img src="https://github.com/user-attachments/assets/15b71538-aa1e-4dc8-a740-c4794b01756c" alt="Note Note" width="300"/></td>
    <td><img src="https://github.com/user-attachments/assets/48e0d9d2-335c-4398-80b9-7c6d9ae7af34" alt="Search" width="300"/></td>
    <td><img src="https://github.com/user-attachments/assets/a14e979f-cbcb-4bd7-b60a-80cff2a3831d" alt="Searched List" width="300"/></td>
  </tr>
</table>

### 🎨 UI Highlights

- **Gradient Headers** - Eye-catching purple gradient app title
- **Staggered Card Animations** - Notes appear with cascading fade-in effects
- **Color-Coded Notes** - Visual organization with 8 beautiful color palettes
- **Floating Action Button** - Smooth zoom-in animation with gradient background
- **Professional Typography** - Google Fonts (Poppins & Inter) for modern look
- **Search Animation** - Smooth slide-down search bar with fade effects
- **Empty State Magic** - Bounce, fade, and pulse animations
- **Material 3 Design** - Modern, clean interface with proper elevation

## 🎭 Animation Showcase

### Home Screen Animations

- **FadeInDown** (500ms) - Header and search elements
- **FadeInUp** (400ms + stagger) - Note cards with 100ms delay each
- **ZoomIn** (500ms) - Floating action button entrance
- **Pulse** (Infinite) - Empty state arrow for user guidance

### Editor Screen Animations

- **FadeInDown** (400ms) - Header controls
- **FadeInUp** (500ms) - Editor container
- **BounceInRight** (500ms) - Save button entrance
- **Pulse** (500ms) - Selected color indicator

### Page Transitions

- **Slide Transition** (400ms) - Smooth bottom-to-top page animations
- **Cubic Easing** - Natural, professional motion curves

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android or iOS device/emulator

### 📋 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  animate_do: ^3.3.4 # Beautiful pre-built animations
  google_fonts: ^6.1.0 # Professional typography
  shared_preferences: ^2.2.2 # Local data persistence
  intl: ^0.19.0 # Date formatting
```

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point with theme configuration
├── models/
│   └── note.dart                      # Note data model with JSON serialization
├── screens/
│   ├── home_screen.dart              # Main screen with notes list
│   └── note_editor_screen.dart       # Note creation/editing screen
├── services/
│   └── storage_service.dart          # Local storage management
├── utils/
│   └── constants.dart                # App colors, dimensions, animations
└── widgets/
    ├── note_card.dart                # Individual note card widget
    └── empty_state.dart              # Empty state with animations
```

### 📁 Key Files Explained

#### `main.dart`

- Initializes the app with Material Design 3
- Sets up system UI overlay (status bar, navigation bar)
- Configures app-wide theme with Google Fonts
- Sets HomeScreen as the entry point

#### `models/note.dart`

- Defines the Note data structure
- Implements JSON serialization/deserialization
- Manages note properties (id, title, content, dates, color)

#### `services/storage_service.dart`

- Handles CRUD operations (Create, Read, Update, Delete)
- Uses SharedPreferences for local persistence
- Manages note list synchronization
- Provides async data operations

#### `utils/constants.dart`

- **AppColors**: Professional color palette with 8 note themes
- **AppDimensions**: Consistent spacing and sizing
- **AppAnimations**: Animation duration constants
- **Gradients**: Pre-defined gradient styles

#### `screens/home_screen.dart`

- Beautiful gradient header with note count
- Real-time search functionality
- Staggered list animations
- Swipe-to-delete with undo
- Empty state display
- Floating action button

#### `screens/note_editor_screen.dart`

- Color theme picker with 5 quick colors
- Auto-expanding text fields
- Title and content separation
- Save button with gradient
- Responsive layout
- Smooth animations

#### `widgets/note_card.dart`

- Color-themed card design
- Decorative circle background
- Color-coded accent bar
- Title and content preview
- Date display with icon
- Dismissible swipe gesture

#### `widgets/empty_state.dart`

- Engaging empty state design
- Bounce-in icon animation
- Fade-in text elements
- Pulsing down arrow
- Clear call-to-action

## 🎨 Color Palette

### Primary Colors

```dart
Primary:            #6C5CE7  // Vibrant Purple
Primary Dark:       #5F3DC4
Primary Light:      #9775FA
Accent:             #FD79A8  // Soft Pink
Accent Secondary:   #74B9FF  // Sky Blue
```

### 8 Note Color Themes

1. 🌸 **Soft Pink** (#FFE5E5) with Pink Accent (#FF6B9D)
2. 💙 **Light Blue** (#E5F5FF) with Blue Accent (#4A90E2)
3. 💜 **Light Magenta** (#FFE5F7) with Magenta Accent (#C44569)
4. 💚 **Light Green** (#E5FFE5) with Green Accent (#26DE81)
5. 🧡 **Light Orange** (#FFF5E5) with Orange Accent (#FD9644)
6. 💜 **Light Purple** (#F0E5FF) with Purple Accent (#7F8FF4)
7. ❤️ **Peachy** (#FFE5E5) with Red Accent (#FC5C65)
8. 🌊 **Mint** (#E5FFFD) with Teal Accent (#0FB9B1)

### Gradient Combinations

```dart
Primary Gradient:   Linear(#6C5CE7 → #A29BFE)
Accent Gradient:    Linear(#FD79A8 → #FF7675)
Background:         Linear(#F8F9FA → #E9ECEF)
```

## 🔔 User Flow

### 1. First Launch Experience

- Displays beautiful empty state with animations
- Pulsing arrow guides user to create first note
- Clear messaging about app functionality
- Smooth bounce-in animations

### 2. Creating a Note

- Tap the gradient FAB (Floating Action Button)
- Smooth slide-up page transition
- Choose from 5 color themes
- Write title and content
- Tap Save button to persist

### 3. Viewing Notes

- Notes appear with staggered animations
- Each card shows title, content preview, and date
- Tap any card to edit
- Visual color coding for organization

### 4. Searching Notes

- Tap search icon in header
- Search bar slides down smoothly
- Real-time filtering as you type
- Search by title or content

### 5. Deleting Notes

- Swipe left on any note card
- Red delete background appears
- Confirm by completing swipe
- Undo option in snackbar

## 🎯 Feature Deep Dive

### Persistent Storage

The app uses **SharedPreferences** for local data persistence:

```dart
// Saving notes
await prefs.setString('notes', jsonEncode(notesList));

// Loading notes
final String? notesJson = prefs.getString('notes');
final List<dynamic> notesList = jsonDecode(notesJson);
```

### Search Functionality

Real-time search with case-insensitive matching:

```dart
_filteredNotes = _notes.where((note) {
  return note.title.toLowerCase().contains(query.toLowerCase()) ||
         note.content.toLowerCase().contains(query.toLowerCase());
}).toList();
```

### Swipe to Delete

Implemented using Flutter's Dismissible widget:

```dart
Dismissible(
  key: Key(note.id),
  direction: DismissDirection.endToStart,
  background: Container(color: Colors.red),
  onDismissed: (direction) => _deleteNote(note),
  child: NoteCard(...),
)
```

### Color Theme Management

Each note stores a color index:

```dart
final cardColor = AppColors.noteColors[note.colorIndex % 8];
final accentColor = AppColors.noteAccentColors[note.colorIndex % 8];
```

## 🎨 UI Components

### Gradient App Bar

- **Primary Gradient**: Purple to light purple
- **Title**: Poppins font, 32px, bold
- **Note Counter**: Inter font, 14px, gray
- **Search Button**: Gradient background with shadow

### Note Cards

- **Border Radius**: 16px for modern look
- **Shadow**: Color-tinted soft shadow
- **Border**: 1.5px with accent color
- **Decorative Circle**: Semi-transparent background element
- **Accent Bar**: 3px colored line at bottom

### Floating Action Button

- **Size**: 64x64 pixels
- **Gradient**: Primary gradient
- **Shadow**: 20px blur with color tint
- **Icon**: Plus icon, 32px
- **Animation**: Zoom-in entrance

### Search Bar

- **Background**: White with shadow
- **Border Radius**: 16px
- **Icon**: Purple search icon
- **Animation**: Fade-in slide-down
- **Auto-focus**: Opens keyboard automatically

### Empty State

- **Icon**: Large note icon in circular gradient
- **Title**: "No Notes Yet" (Poppins, 24px)
- **Description**: Helpful hint text
- **Arrow**: Pulsing down arrow animation

## 🔧 Customization

### Changing App Colors

```dart
// In utils/constants.dart
class AppColors {
  static const Color primary = Color(0xFF6C5CE7);  // Change this
  static const Color accent = Color(0xFFFD79A8);   // And this

  // Add more note colors
  static const List<Color> noteColors = [
    Color(0xFFYOURCOLOR),  // Add your color
    // ... more colors
  ];
}
```

### Adding More Animations

```dart
// Import animate_do package
import 'package:animate_do/animate_do.dart';

// Use any animation
FadeIn(child: YourWidget()),
SlideInLeft(child: YourWidget()),
ZoomOut(child: YourWidget()),
```

### Custom Fonts

```dart
// In main.dart
textTheme: GoogleFonts.robotoTextTheme(),  // Change font family
```

### Adjusting Animation Speed

```dart
// In utils/constants.dart
class AppAnimations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);  // Adjust
  static const Duration slow = Duration(milliseconds: 500);
}
```

## 📊 Technical Highlights

### Performance Optimizations

- ✅ Efficient list rendering with ListView.builder
- ✅ Lazy loading of note data
- ✅ Minimal rebuilds using proper state management
- ✅ Async operations for smooth UI

### Code Quality

- ✅ Clean architecture with separation of concerns
- ✅ Reusable widget components
- ✅ Proper error handling
- ✅ Type-safe Dart code
- ✅ Consistent naming conventions

### Responsive Design

- ✅ Adapts to different screen sizes
- ✅ Flexible layouts with constraints
- ✅ Proper keyboard handling
- ✅ Safe area management

---
