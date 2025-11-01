# Week 18: Screen Time Tracker.

A beautiful and modern Flutter application designed to help users track and manage their screen time with an elegant UI, animated onboarding, and comprehensive analytics dashboard.

## 📱 Screenshots & Features

### ✨ Key Features

- **Dynamic Onboarding Screen** - Engaging introduction with animated focus-related keywords background
- **Custom Logo Animation** - Beautiful diamond-shaped gradient logo with smooth curves
- **Screen Time Analytics** - Real-time tracking of daily and hourly screen usage
- **Interactive Time Chart** - Smooth animated chart showing screen time distribution throughout the day
- **Focus Score System** - Gamified score (0-10) with status indicators and improvement tracking
- **Most Used Apps** - Visual display of frequently used applications
- **Weekly Progress Tracking** - Comparison with previous week's screen time
- **Focus Session Management** - Quick access to start focus sessions with last session tracking
- **Phone Pickup Counter** - Track how many times you've picked up your phone
- **User Profile** - Personalized greeting and avatar display
- **Date Selector** - Filter screen time data by specific dates
- **Modular Architecture** - Clean, feature-based code structure with reusable components
- **Responsive Design** - Adaptive UI that works seamlessly across different screen sizes
- **Modern UI/UX** - Coral/peach gradient design, smooth animations, and professional typography
- **Cross-Platform Support** - Works on Android, iOS, Web, macOS, Linux, and Windows

<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/c10200f8-2403-4305-a608-aa6b21ecdb06" alt="Onboarding Screen" width="500"/>
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/ec55e671-5898-4760-8d9b-384776d13e67" alt="Home Screen" width="500"/>
    </td>
  </tr>
</table>

### 🎨 UI Highlights

#### **Onboarding Screen**

- **Focus Words Background**: Animated list of productivity-related keywords (Goal-setting, Dedication, Workflow, Efficiency, Concentration, Discipline, Balance, Productivity, Time management, Performance)
- **Custom Diamond Logo**: Gradient-filled diamond shape with radial gradient effect
- **Coral Gradient Overlay**: Semi-transparent gradient from top to bottom for visual depth
- **Get Started Button**: Dark button with arrow icon and smooth navigation transition

#### **Dashboard Screen**

- **Welcome Header**: Personalized greeting with user name
- **Avatar Display**: Circular avatar with fallback icon
- **Settings Icon**: Quick access to app settings

#### **Screen Time Card**

- **White Card Background**: Clean, minimalist design with rounded corners
- **Today's Time Display**: Large, bold typography (48px) for primary metric
- **Last Hour Time**: Secondary metric showing recent usage
- **Phone Pickups**: Counter for device pickup frequency
- **Date Selector**: Pill-shaped date picker with calendar icon
- **Animated Chart**: Smooth curved line chart with green color (#7ED957)
- **Time Labels**: Hourly time markers from AM to 8 PM
- **Chart Points**: Circular indicators on data points

#### **Focus Score Card**

- **Peach Background**: Warm, inviting color (#FFF4E6)
- **Large Score Display**: Bold 48px number with one decimal precision
- **Status Indicator**: "Good" status with upward arrow
- **Most Used Apps**: Circular app icons in a row
- **Celebration Message**: Encouraging feedback card with trophy icon
- **Improvement Percentage**: Week-over-week comparison (7% improvement)

#### **Focus Session Button**

- **Full-Width Button**: Coral gradient background matching brand colors
- **Two-Line Layout**: Main action text + last session info
- **Bold Typography**: Clear, readable text
- **Last Session Time**: Displays when the user last completed a focus session

### 📋 Color Palette

#### Primary Colors

- **Primary Coral**: `#FF7B6D` - Main brand color, used in buttons and accents
- **Primary Peach**: `#FFB4A8` - Secondary brand color, used in gradients and highlights

#### Background Colors

- **Light Background**: `#F5F5F5` - Main app background
- **Card Background**: `#FFF8F3` - Card container background
- **Focus Card Background**: `#FFF4E6` - Focus score card background
- **White**: `#FFFFFF` - Pure white for contrast

#### Text Colors

- **Text Dark**: `#2D2D2D` - Primary text color
- **Text Medium**: `#666666` - Secondary text color
- **Text Light**: `#999999` - Tertiary text color (labels, captions)

#### Accent Colors

- **Good Status**: `#FF6B6B` - Used for positive indicators
- **Chart Green**: `#7ED957` - Screen time chart line color
- **Black**: `#000000` - Used sparingly
- **Diamond Gradient**: `#FFF4D6` to `#FFE5B8` - Logo gradient colors

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Dart SDK (included with Flutter)
- Android Studio / VS Code with Flutter extensions
- Physical device or emulator for testing

### Installation

1. Clone the repository:

```bash
git clone https://github.com/theahmedhany/depi_cross_platform_mobile_app_training.git
cd week_18
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

### 📋 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8 # iOS-style icons

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0 # Recommended lints for code quality
```

## 🏗️ Project Structure

```
lib/
├── main.dart                                      # App entry point
├── core/                                          # Core app resources
│   ├── constants/
│   │   ├── app_colors.dart                       # Color palette constants
│   │   ├── app_dimensions.dart                   # Spacing & size constants
│   │   └── app_strings.dart                      # Text content constants
│   └── theme/
│       └── app_theme.dart                        # App-wide theme configuration
└── features/                                      # Feature modules
    ├── onboarding/
    │   ├── screens/
    │   │   └── onboarding_screen.dart            # Onboarding page layout
    │   └── widgets/
    │       ├── app_logo.dart                     # Custom diamond logo with painter
    │       ├── focus_words_background.dart       # Animated keywords background
    │       └── get_started_button.dart           # Call-to-action button
    └── dashboard/
        ├── screens/
        │   └── dashboard_screen.dart             # Main dashboard layout
        └── widgets/
            ├── dashboard_header.dart             # User greeting & avatar
            ├── screen_time_card.dart             # Screen time statistics card
            ├── screen_time_chart.dart            # Animated time chart
            ├── time_stat_item.dart               # Reusable time display
            ├── focus_score_card.dart             # Focus score & apps
            └── focus_session_button.dart         # Start session button
```

## 📁 Key Files Explained

### `main.dart`

- Entry point of the application
- Contains `FocusApp` widget with Material app configuration
- Sets up app-wide theme from `AppTheme.lightTheme`
- Initial route points to `OnboardingScreen`
- Disables debug banner for clean UI

### Core Files

#### `core/constants/app_colors.dart`

- Centralized color palette management
- Contains all color constants used throughout the app
- Primary, background, text, and accent colors
- Easy to maintain and update brand colors

#### `core/constants/app_dimensions.dart`

- Standardized spacing and sizing constants
- Padding values: small (8), medium (16), large (24), xlarge (32)
- Border radius values for consistent rounded corners
- Icon sizes: small (20), medium (24), large (32)
- Avatar size (48) and button height (56)

#### `core/constants/app_strings.dart`

- All user-facing text content in one place
- Easy localization support
- Includes app name, button labels, section titles
- Focus-related keywords array for onboarding

#### `core/theme/app_theme.dart`

- Material 3 theme configuration
- Custom typography hierarchy (display, headline, title, body, label)
- SF Pro Display font family for iOS-like aesthetics
- Color scheme setup linking to AppColors
- AppBar theme with transparent background
- Text theme with proper sizing and weights

### Feature: Onboarding

#### `features/onboarding/screens/onboarding_screen.dart`

- First screen users see when opening the app
- Coral background with gradient overlay
- Stacked layout: background words → gradient → content
- SafeArea ensures proper spacing on all devices
- Navigation to DashboardScreen on button press
- Uses MaterialPageRoute with pushReplacement for one-way navigation

#### `features/onboarding/widgets/app_logo.dart`

- Custom diamond-shaped logo using CustomPainter
- Implements `DiamondShapePainter` class
- Creates path with quadratic bezier curves for smooth edges
- Applies radial gradient for depth effect
- 200x200 size for prominent display
- "Focus." text with large bold typography (56px)

#### `features/onboarding/widgets/focus_words_background.dart`

- Displays productivity-related keywords
- Maps through AppStrings.focusWords array
- Semi-transparent text (15% opacity) for subtle background
- Large, bold text (40px) for visual impact
- Evenly spaced with padding
- Creates depth and context for the app's purpose

#### `features/onboarding/widgets/get_started_button.dart`

- Full-width elevated button
- Dark background (#2D2D2D) with white text
- 56px height for easy tapping
- Arrow icon indicating forward action
- Accepts onPressed callback for flexibility
- Rounded corners matching app style

### Feature: Dashboard

#### `features/dashboard/screens/dashboard_screen.dart`

- Main app screen after onboarding
- Light gray background (#F5F5F5)
- SingleChildScrollView for scrollable content
- Orchestrates all dashboard widgets
- Proper spacing between sections
- SafeArea for notch/navigation bar handling

#### `features/dashboard/widgets/dashboard_header.dart`

- Displays "Welcome back, [Name]"
- User avatar with fallback icon
- Settings icon button (tune icon)
- Flexible design: supports network images or default icon
- Row layout with space-between alignment

#### `features/dashboard/widgets/screen_time_card.dart`

- White card with rounded corners
- "SCREEN TIME" label with letter spacing
- Date selector with calendar icon
- Three stat items: Today, Last hour, Phone pickups
- Integrates ScreenTimeChart component
- Flexible row layout for responsive stats display

#### `features/dashboard/widgets/screen_time_chart.dart`

- Custom chart implementation using CustomPainter
- Smooth curved lines with cubic bezier interpolation
- Green color (#7ED957) for positive association
- Circular points on data nodes
- Time labels below chart (AM to 8 PM)
- Accepts List<double> data for flexibility
- Responsive width calculation

#### `features/dashboard/widgets/time_stat_item.dart`

- Reusable component for time display
- Large mode (48px) for primary metrics
- Small mode (24px) for secondary metrics
- Value + label layout
- Dark text for values, medium text for labels
- Column layout with start alignment

#### `features/dashboard/widgets/focus_score_card.dart`

- Peach background (#FFF4E6) for warmth
- Large score display with decimal precision
- Upward arrow indicating improvement
- Status text ("Good")
- Most used apps icons row
- Celebration message box with trophy icon
- Week-over-week comparison
- Two-column layout: score vs. apps

#### `features/dashboard/widgets/focus_session_button.dart`

- Full-width action button (height: 72px)
- Coral background matching brand
- Two-line content: "Start Focus Session" + last session info
- Large, bold text (18px) for call-to-action
- Semi-transparent secondary text
- TODO comment for future implementation

## 🎯 Widget Architecture

### Modular Design Benefits

1. **Reusability** - Components can be used across multiple screens with different data
2. **Maintainability** - Easy to update individual components without affecting others
3. **Testability** - Each widget can be unit tested independently
4. **Scalability** - Simple to add new features or screens
5. **Clean Code** - Clear separation of concerns keeps codebase organized
6. **Collaboration** - Team members can work on different features simultaneously
7. **Performance** - Only necessary widgets rebuild when state changes

---
