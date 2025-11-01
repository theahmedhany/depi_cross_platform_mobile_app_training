# Week 19: Movie Discovery App

---

## 📖 About

Popular Movies is a sophisticated Flutter application that allows users to discover and explore popular movies from The Movie Database (TMDB). Built with production-ready architecture and best practices, the app features offline-first functionality, smooth infinite scrolling, and a modern Material Design 3 interface with both light and dark themes.

## ✨ Features

### 🎬 Core Functionality

- **Popular Movies Browsing**
  - Discover trending and popular movies from TMDB
  - List view with movie posters, titles, ratings, and release dates
  - Smooth infinite scroll with intelligent pagination
  - Pull-to-refresh for updating content
- **Detailed Movie Information**
  - Comprehensive movie details with poster and backdrop images
  - Full synopsis and tagline
  - Rating, vote count, and popularity
  - Release date, runtime, and budget information
  - Revenue and production details
  - Genres and language information
  - Production companies with country information

### 💾 Offline-First Architecture

- **Smart Caching System**

  - Hive NoSQL database for local storage
  - Automatic page-based caching
  - Instant offline access to previously viewed content
  - Cache indicators showing data source (online/offline)
  - Persistent data across app sessions

- **Network Resilience**
  - Graceful fallback to cached data on network errors
  - Continue browsing even without internet connection
  - Automatic cache updates when online

<table align="center">
  <tr>
    <td>
      <img height="400" src="https://github.com/user-attachments/assets/2d863b2c-c998-4b2f-91b1-22291beb5b04" alt="MovieHub" />
    </td>
    <td>
      <img height="400" src="https://github.com/user-attachments/assets/92fe5a1e-a252-44d0-a813-bda536eb9e6d" alt="MovieHub" />
    </td>
    <td>
      <img height="400" src="https://github.com/user-attachments/assets/0a9930bc-da52-4587-8004-c972adf5702c" alt="MovieHub" />
    </td>
  </tr>
</table>

### 🎨 Modern UI/UX

- **Material Design 3**

  - Clean, modern interface following latest Material guidelines
  - Smooth animations and transitions
  - Native loading indicators (CupertinoActivityIndicator)
  - Gradient color schemes and elevated cards

- **Theme Support**

  - Light and dark theme modes
  - System theme detection
  - Theme persistence across sessions
  - Optimized colors for both themes
  - Theme switching with bottom sheet selector

- **Responsive Design**
  - Adaptive UI using ScreenUtil for all screen sizes
  - Optimized for phones, tablets, and large screens
  - Consistent spacing and typography across devices

### 🏗️ Clean Architecture

- **Feature-Based Structure**

  - Modular organization by features (home, details)
  - Clear separation of concerns
  - Independent, testable modules

- **Layer Separation**

  - **Data Layer**: Models, repositories, cache services, API services
  - **Presentation Layer**: Screens, widgets, BLoC/Cubit state management
  - **Core Layer**: Shared utilities, networking, routing, theming

- **Best Practices**
  - SOLID principles
  - Dependency injection with GetIt
  - Repository pattern
  - Type-safe API calls with Retrofit

### 🔄 Advanced State Management

- **BLoC Pattern Implementation**

  - Predictable state management with flutter_bloc
  - Freezed for immutable state classes
  - Union types for different loading states
  - Separate states for initial load and pagination

- **State Types**
  - `idle` - Initial state
  - `loading` - Loading fresh data
  - `loadingMore` - Loading next page while showing current data
  - `success` - Data loaded successfully with cache indicator
  - `error` - Error occurred with error message

### 🚀 Performance Optimizations

- **Efficient Data Loading**

  - Lazy loading with infinite scroll
  - Page-based pagination (20 movies per page)
  - Duplicate prevention in paginated results
  - Scroll position preservation

- **Image Optimization**

  - Cached network images with placeholder and error states
  - Optimized image loading from TMDB CDN
  - Memory-efficient image caching

- **Resource Management**
  - Proper disposal of scroll controllers and streams
  - Optimized widget rebuilds
  - Memory-efficient Hive database

### 🛡️ Error Handling

- **Comprehensive Error Management**

  - Network error handling (timeout, no connection, etc.)
  - HTTP error codes (400, 401, 403, 404, 500, etc.)
  - User-friendly error messages
  - Graceful fallback to cached data
  - Error states with retry functionality

- **API Error Handling**
  - Centralized error handler
  - Custom exception classes
  - Pretty error logging for debugging

## 🎯 User Interface Highlights

### Home Screen

- **Clean List View**: Horizontal movie cards showing poster, title, overview snippet, rating, and release date
- **Infinite Scroll**: Automatically loads more movies as you scroll
- **Pull-to-Refresh**: Swipe down to refresh the movie list
- **Theme Switcher**: Access theme options via the app bar icon
- **Loading States**: Native iOS-style activity indicator during data fetch

### Movie Details Screen

- **Hero Poster Header**: Full-width movie poster with gradient overlay
- **Modern Information Cards**: Beautifully designed cards showing:
  - Release date with calendar icon
  - Runtime with clock icon
  - Budget with money icon (formatted with commas)
  - Revenue with trending icon (formatted with commas)
  - Vote count with people icon
- **Gradient Genre Tags**: Eye-catching genre chips with gradient backgrounds
- **Tagline Display**: Stylish quote presentation with icon
- **Production Companies**: List of companies with business icons and country info
- **Smooth Navigation**: Back button with circular background and shadow

## 🏛️ Architecture

### Project Structure

```
lib/
├── core/                                    # Core functionality and shared resources
│   ├── cache/                               # Caching infrastructure
│   │   ├── hive_cache_adapters.dart        # Register Hive type adapters
│   │   └── hive_cache_service.dart         # Abstract cache service
│   ├── common/                              # Shared widgets
│   │   └── widgets/
│   │       ├── custom_loading.dart         # CupertinoActivityIndicator
│   │       └── theme_bottom_sheet.dart     # Theme selector
│   ├── di/                                  # Dependency injection
│   │   └── dependency_injection.dart       # GetIt service locator
│   ├── helpers/                             # Utility functions
│   │   ├── extensions.dart                 # Dart extensions
│   │   ├── shared_pref_helper.dart        # SharedPreferences wrapper
│   │   └── spacing.dart                    # Spacing utilities
│   ├── networking/                          # API services
│   │   ├── api_constants.dart              # API URLs and keys
│   │   ├── api_error_handler.dart          # Error handling
│   │   ├── api_error_model.dart            # Error models
│   │   ├── api_network_exceptions.dart     # Custom exceptions
│   │   ├── api_result.dart                 # Result wrapper
│   │   ├── api_services.dart               # Retrofit services
│   │   └── dio_factory.dart                # Dio configuration
│   ├── routing/                             # Navigation
│   │   ├── app_router.dart                 # Route generator
│   │   └── routes.dart                     # Route constants
│   └── theme/                               # Theming
│       ├── app_texts/                       # Typography
│       ├── theme_data/                      # Theme configurations
│       │   ├── dark_theme_data.dart
│       │   └── light_theme_data.dart
│       └── theme_manager/                   # Theme state
│           ├── theme_cubit.dart
│           └── theme_extensions.dart
│
├── features/                                # Feature modules
│   ├── details/                             # Movie details feature
│   │   ├── data/
│   │   │   ├── cache/
│   │   │   │   └── movie_details_cache_service.dart
│   │   │   ├── models/
│   │   │   │   └── movie_details_model.dart
│   │   │   └── repos/
│   │   │       └── movie_details_repo.dart
│   │   └── presentation/
│   │       ├── logic/
│   │       │   ├── movie_details_cubit.dart
│   │       │   └── movie_details_state.dart
│   │       └── screens/
│   │           └── movie_details_screen.dart
│   │
│   └── home/                                # Home screen feature
│       ├── data/
│       │   ├── cache/
│       │   │   └── movies_cache_service.dart
│       │   ├── models/
│       │   │   └── all_movies_model.dart
│       │   └── repos/
│       │       └── all_movies_repo.dart
│       └── presentation/
│           ├── logic/
│           │   ├── all_movies_cubit.dart
│           │   └── all_movies_state.dart
│           ├── screens/
│           │   └── home_screen.dart
│           └── widgets/
│               ├── all_movies_card.dart
│               └── all_movies_list.dart
│
└── main.dart                                # App entry point
```

### Architecture Layers

#### 1. Data Layer

- **Models**: JSON serializable data classes with Freezed
- **Repositories**: Abstract data sources from business logic
- **Cache Services**: Hive-based local storage services
- **API Services**: Retrofit-based API clients

#### 2. Presentation Layer

- **Screens**: Full-page UI components
- **Widgets**: Reusable UI components
- **Logic (Cubit)**: State management with BLoC pattern
- **States**: Immutable state classes with Freezed

#### 3. Core Layer

- **Networking**: Dio client, interceptors, error handling
- **Routing**: Navigation and route management
- **Theme**: Light/dark theme configurations
- **DI**: Dependency injection setup
- **Helpers**: Utility functions and extensions

## 🌐 API Integration

### The Movie Database (TMDB) API

**Base URL**: `https://api.themoviedb.org/3/`

#### Authentication

```dart
// API Bearer Token (included in headers)
Authorization: Bearer YOUR_TMDB_API_KEY
```

#### Endpoints

##### 1. Get Popular Movies

```
GET /movie/popular
```

**Query Parameters:**

- `page` (integer) - Page number for pagination

**Response:**

```json
{
  "page": 1,
  "results": [
    {
      "id": 123,
      "title": "Movie Title",
      "poster_path": "/path/to/poster.jpg",
      "overview": "Movie overview...",
      "vote_average": 8.5,
      "release_date": "2024-01-01",
      "original_language": "en"
    }
  ],
  "total_pages": 500,
  "total_results": 10000
}
```

##### 2. Get Movie Details

```
GET /movie/{movie_id}
```

**Path Parameters:**

- `movie_id` (integer) - Unique movie identifier

**Response:**

```json
{
  "id": 123,
  "title": "Movie Title",
  "tagline": "An amazing tagline",
  "overview": "Full movie description...",
  "poster_path": "/path/to/poster.jpg",
  "backdrop_path": "/path/to/backdrop.jpg",
  "release_date": "2024-01-01",
  "runtime": 120,
  "budget": 100000000,
  "revenue": 500000000,
  "vote_average": 8.5,
  "vote_count": 1234,
  "genres": [{ "id": 1, "name": "Action" }],
  "production_companies": [
    {
      "id": 1,
      "name": "Company Name",
      "origin_country": "US"
    }
  ]
}
```

#### Image URLs

```
https://image.tmdb.org/t/p/w500/{image_path}
```

## 📦 Tech Stack

### Core Framework

- **Flutter SDK**: ^3.9.2 - Cross-platform UI framework
- **Dart**: ^3.9.2 - Programming language

### State Management & Architecture

- **flutter_bloc**: ^9.1.1 - BLoC pattern for predictable state management
- **get_it**: ^8.2.0 - Service locator for dependency injection
- **freezed**: ^2.5.2 - Code generation for immutable classes
- **freezed_annotation**: ^2.4.4 - Annotations for Freezed
- **json_annotation**: ^4.9.0 - JSON serialization annotations

### Networking & Data

- **dio**: ^5.7.0 - Powerful HTTP client
- **retrofit**: ^4.7.3 - Type-safe HTTP client generator
- **retrofit_generator**: ^7.0.8 - Code generator for Retrofit
- **pretty_dio_logger**: ^1.4.0 - Beautiful HTTP logging
- **json_serializable**: ^6.8.0 - JSON serialization code generation

### Local Storage & Caching

- **hive**: ^2.2.3 - Fast, lightweight NoSQL database
- **hive_flutter**: ^1.1.0 - Hive implementation for Flutter
- **hive_generator**: ^2.0.1 - Code generator for Hive adapters
- **shared_preferences**: ^2.5.3 - Simple key-value storage
- **flutter_secure_storage**: ^9.2.4 - Secure encrypted storage

### UI & UX

- **flutter_screenutil**: ^5.9.3 - Responsive design and screen adaptation
- **cached_network_image**: ^3.4.1 - Efficient image loading and caching
- **cupertino_icons**: ^1.0.8 - iOS-style icons

<table align="center">
  <tr>
    <td>
      <img height="400" src="https://github.com/user-attachments/assets/8b386b1c-598b-46ec-a46b-6c4ab29eeaf5" alt="Movie App" />
    </td>
    <td>
      <img height="400" src="https://github.com/user-attachments/assets/66dd972c-fcce-49c7-9b2d-6043a1305d88" alt="Movie App" />
    </td>
    <td>
      <img height="400" src="https://github.com/user-attachments/assets/066ba6ba-7b08-44ca-8374-acad8791b88c" alt="Movie App" />
    </td>
  </tr>
</table>

### Development Tools

- **build_runner**: ^2.4.13 - Code generation runner
- **flutter_lints**: ^5.0.0 - Recommended Flutter linting rules
- **logger**: ^2.6.2 - Elegant logging utility

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.9.2 or higher)
- Dart SDK (^3.9.2 or higher)
- Android Studio / VS Code with Flutter extensions
- TMDB API Key ([Get one here](https://www.themoviedb.org/settings/api))

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/theahmedhany/depi_cross_platform_mobile_app_training.git
   cd depi_cross_platform_mobile_app_training/week_19
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure API Key**

   Open `lib/core/networking/api_constants.dart` and add your TMDB API key:

   ```dart
   static const String apiKey = "YOUR_TMDB_BEARER_TOKEN_HERE";
   ```

4. **Run code generation**

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

### Code Generation

The project uses code generation for several features. Run these commands when you modify:

- Freezed classes (State classes)
- JSON serializable models
- Retrofit API services
- Hive type adapters

#### One-time build:

```bash
dart run build_runner build --delete-conflicting-outputs
```

#### Watch mode (for development):

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## 🗄️ Caching Strategy

### Offline-First Implementation

1. **Initial Data Load**

   - Check local Hive cache first
   - Display cached data immediately if available
   - Fetch fresh data from API in background
   - Update UI and cache when fresh data arrives
   - Show cache indicator badge

2. **Pagination Caching**

   - Each page cached separately
   - Load from cache before fetching new page
   - Intelligent merging of results (no duplicates)
   - Scroll position preservation

3. **Movie Details Caching**

   - Individual movie details cached by ID
   - Instant display of cached details
   - Update with fresh data when available

4. **Network Error Handling**
   - Automatic fallback to cached data
   - Offline mode with cached content
   - Clear indicators showing data source
   - Retry mechanism for failed requests

## 🎨 Theming System

### Theme Features

- **Three Theme Modes**

  - Light theme
  - Dark theme
  - System (follows device settings)

- **Theme Persistence**

  - User preference saved to SharedPreferences
  - Theme restored on app restart
  - Smooth theme transitions

- **Custom Color System**

  ```dart
  // Access theme colors via extension
  context.customAppColors.primary500
  context.customAppColors.background
  context.customAppColors.grey900
  ```

- **Material Design 3**
  - Modern color schemes
  - Elevated components
  - Dynamic colors
  - Consistent typography

## 🧪 Testing & Quality

### Code Quality

- Flutter lints enabled
- Consistent code formatting
- Clear naming conventions
- Comprehensive documentation

### Error Handling

- Centralized error management
- User-friendly error messages
- Graceful degradation
- Detailed error logging

---
