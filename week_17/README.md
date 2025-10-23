# Week 17: Digital Wallet Flutter App

A beautiful and modern Flutter application showcasing a **Digital Wallet Interface** with elegant UI design, gradient effects, and modular architecture.

## 📱 Screenshots & Features

### ✨ Key Features

- **Credit Card Display** - Beautiful card design with gradient background and decorative elements
- **Financial Overview** - Income and expense tracking with color-coded cards
- **Digital Wallet Balance** - Real-time balance display with quick withdraw access
- **Analytics Dashboard** - Toggle between bank accounts and cards view
- **Card Scanner** - Quick scan card functionality for easy card addition
- **Modular Architecture** - Clean code structure with reusable widget components
- **Responsive Design** - Overflow-safe UI that adapts to different screen sizes
- **Modern UI/UX** - Gradient designs, smooth shadows, and professional typography
- **Cross-Platform Support** - Works on Android, iOS, Web, macOS, Linux, and Windows

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/f4468845-5e27-41b0-a435-56a08288be33" alt="Wallet Screen" width="400"/></td>
  </tr>
</table>

### 🎨 UI Highlights

- **Credit Card Component**

  - Gradient background (coral pink to salmon)
  - Decorative circular overlays for depth
  - Card number with masked digits
  - Expiry date display
  - Cardholder name
  - Mastercard logo integration
  - Soft shadow effects

- **Financial Cards**

  - Income card with purple gradient
  - Expense card with coral gradient
  - Icon indicators (arrows) for transaction direction
  - Clear typography for amounts

- **Digital Wallet Balance**

  - Deep blue background color
  - Prominent balance display
  - Quick withdraw action button
  - Compact, space-efficient design

- **Analytics Toggle**

  - Pill-shaped toggle buttons
  - Active state with gradient
  - Smooth transitions
  - Clear labeling

- **Bottom Navigation**
  - Icon-based navigation
  - Active state highlighting
  - Clean, minimal design
  - Proper spacing and alignment

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Android Studio / VS Code
- Physical device or emulator for testing

### 📋 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8 # iOS-style icons
```

## 🏗️ Project Structure

```
lib/
├── main.dart                                    # App entry point and main screen
└── widgets/
    ├── credit_card_widget.dart                  # Credit card display component
    ├── info_card_widget.dart                    # Reusable info card (Income/Expense)
    ├── digital_wallet_balance_widget.dart       # Wallet balance display
    ├── analytics_toggle_widget.dart             # Bank accounts/Cards toggle
    ├── scan_card_button.dart                    # Scan card action button
    ├── custom_app_bar.dart                      # Reusable app bar with back button
    └── bottom_navigation_widget.dart            # Bottom navigation bar
```

### 📁 Key Files Explained

#### `main.dart`

- Contains the `MyApp` class with Material app configuration
- Implements `WalletScreen` - the main screen layout
- Sets up the Inter font family for consistent typography
- Uses a light gray background color (#F5F5F8)
- Orchestrates all widget components

#### `credit_card_widget.dart`

- Displays a realistic credit card with gradient background
- Features decorative circular overlays for visual depth
- Shows masked card number with last 4 digits
- Includes expiry date and cardholder name
- Mastercard logo with overlapping circles effect
- Handles text overflow with ellipsis
- Responsive sizing for different screen widths

#### `info_card_widget.dart`

- Reusable component for Income and Expense display
- Accepts customizable parameters:
  - `title` - Card label (Income/Expense)
  - `amount` - Dollar amount to display
  - `icon` - Icon indicator (arrow up/down)
  - `gradientColors` - List of colors for gradient
- Implements flexible layout to prevent overflow
- Icon with semi-transparent background
- Clean typography with proper hierarchy

#### `digital_wallet_balance_widget.dart`

- Shows current digital wallet balance
- Deep blue background (#003D7A) for contrast
- Large, bold typography for balance amount
- "Withdraw now" call-to-action with arrow
- FittedBox for responsive text scaling
- Compact height (164px) to fit alongside other cards

#### `analytics_toggle_widget.dart`

- Toggle between "Bank accounts" and "Cards" views
- Pill-shaped design with rounded corners
- Active state uses coral gradient
- Inactive state uses white background
- Equal width distribution for both options
- Text overflow protection with ellipsis

#### `scan_card_button.dart`

- Full-width action button for scanning cards
- Deep blue background matching wallet card
- Credit card icon with descriptive label
- Centered content alignment
- Consistent padding and border radius

#### `custom_app_bar.dart`

- Reusable app bar component
- Back button with proper icon
- Centered title with bold typography
- Dark text color (#1A1D3B) for readability
- Flexible width to accommodate different titles
- Optional callback for back button action

#### `bottom_navigation_widget.dart`

- Fixed bottom navigation with 4 items
- Icons: Home, Charts, Cards (active), Profile
- Active state highlighted in coral color
- Inactive states in gray
- Top shadow for elevation effect
- Rounded top corners for modern look

## 🎯 Widget Architecture

### Modular Design Benefits

1. **Reusability** - Components can be used across multiple screens
2. **Maintainability** - Easy to update individual components
3. **Testability** - Each widget can be tested independently
4. **Scalability** - Simple to add new features or modify existing ones
5. **Clean Code** - Separation of concerns keeps code organized
6. **Collaboration** - Team members can work on different widgets simultaneously

### Widget Composition

```dart
WalletScreen
├── CustomAppBar
├── SingleChildScrollView
│   ├── CreditCardWidget
│   ├── Row
│   │   ├── Column
│   │   │   ├── InfoCardWidget (Income)
│   │   │   └── InfoCardWidget (Expense)
│   │   └── DigitalWalletBalanceWidget
│   ├── AnalyticsToggleWidget
│   └── ScanCardButton
└── BottomNavigationWidget
```

## 🎨 Color Palette

### Primary Colors

- **Coral/Salmon Gradient** - `#FF9A9A` to `#FF8585`

  - Used in: Credit card, Expense card, Active toggle, Active nav icon

- **Purple Gradient** - `#9B8CD8` to `#8B7BC8`

  - Used in: Income card

- **Deep Blue** - `#003D7A`

  - Used in: Digital wallet card, Scan button

- **Dark Navy** - `#1A1D3B`
  - Used in: Text headings, icons

### Background Colors

- **Light Gray** - `#F5F5F8` (Main background)
- **White** - `#FFFFFF` (Cards, containers)

### Accent Colors

- **Mastercard Red** - `#EB001B`
- **Mastercard Orange** - `#F79E1B`
- **Gray 400** - Inactive navigation icons

## 🔧 Customization

### Changing Card Information

```dart
// In credit_card_widget.dart
Text(
  'CAMERON WILLIAMSON',  // Change cardholder name
  // ...
),
Text(
  '0329',  // Change last 4 digits
  // ...
),
Text(
  '03/24',  // Change expiry date
  // ...
),
```

### Updating Financial Amounts

```dart
// In main.dart WalletScreen
InfoCardWidget(
  title: 'Income',
  amount: '\$ 5,455.21',  // Update income amount
  // ...
),
InfoCardWidget(
  title: 'Expense',
  amount: '\$ 8,002.55',  // Update expense amount
  // ...
),
```

### Customizing Colors

```dart
// Change credit card gradient
gradient: LinearGradient(
  colors: [Color(0xFFYOURCOLOR1), Color(0xFFYOURCOLOR2)],
  // ...
),

// Change wallet balance background
color: Color(0xFFYOURCOLOR),
```

### Modifying Font Family

```dart
// In main.dart MaterialApp
theme: ThemeData(
  fontFamily: 'YourCustomFont',  // Change font family
  // ...
),
```

## 🛠️ Technical Implementation

### Overflow Prevention

All text widgets implement overflow protection:

```dart
// Example from credit_card_widget.dart
Flexible(
  child: Text(
    'CAMERON WILLIAMSON',
    overflow: TextOverflow.ellipsis,  // Prevents overflow
    // ...
  ),
),
```

### Responsive Layout

The app uses `Flexible` and `Expanded` widgets to ensure responsive behavior:

```dart
Row(
  children: [
    Expanded(child: Column(/* Income & Expense */)),
    SizedBox(width: 12),
    Expanded(child: DigitalWalletBalanceWidget()),
  ],
),
```

### Gradient Effects

Multiple gradient implementations for visual appeal:

```dart
decoration: BoxDecoration(
  gradient: LinearGradient(
    colors: [Color(0xFFFF9A9A), Color(0xFFFF8585)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  // ...
),
```

### Shadow Effects

Subtle shadows for depth and elevation:

```dart
boxShadow: [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 20,
    offset: Offset(0, 10),
  ),
],
```

## 📱 Screen Layout Breakdown

### 1. App Bar Section

- Custom app bar with "Wallet" title
- Back button for navigation
- Centered alignment with proper spacing

### 2. Credit Card Section

- Full-width card display
- 180px height for proper proportions
- Gradient background with overlays
- Card details clearly visible

### 3. Financial Overview Section

- Two-column layout
- Left column: Income and Expense cards
- Right column: Digital Wallet Balance
- 12px spacing between columns

### 4. Analytics Section

- "Analytics" heading
- Toggle between Bank accounts and Cards
- Full-width toggle component

### 5. Action Section

- Scan Card button
- Full-width for easy tapping
- Clear call-to-action

### 6. Bottom Navigation

- Fixed at bottom
- Four navigation items
- Active state indication

---
