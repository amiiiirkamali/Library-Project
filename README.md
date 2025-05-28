# Library Project

A comprehensive Flutter application for managing a personal or institutional library system with modern UI/UX design and customizable themes.

## Features

### Core Functionality
- **Book Management**: Add, edit, view, and organize books in your library
- **Shopping Cart System**: Add books to cart with detailed tracking
- **Cart History**: View past transactions and cart activities
- **User Authentication**: Secure login system with API integration
- **Profile Management**: Personal user profiles with customizable settings
- **Onboarding Experience**: First-time user introduction to the app
- **Book Details**: Comprehensive book information display
- **Navigation Drawer**: Easy access to all app sections

### Customization Options
- **Theme Support**: Light and dark theme modes with seamless switching
- **Font Customization**: Multiple font options for better readability
- **Persistent Settings**: User preferences saved locally using SharedPreferences

## State Management & Providers

This project uses the **Provider** pattern for state management:

- **ThemeProvider**: Manages light/dark theme switching across the app
- **FontProvider**: Handles font customization and typography settings
- **Future Providers**: Cart state management, user session management

## API Integration

The application features a robust API integration system:

- **Modular API Design**: Separate API classes for different functionalities
- **Centralized HTTP Client**: Consistent API communication through apiClient.dart
- **Error Handling**: Comprehensive error management across all API calls
- **Data Persistence**: Local storage combined with remote API synchronization

## Screenshots

*Add screenshots of your app here to showcase the UI*

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/library-project.git
   cd library-project
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                    # App entry point and routing
├── apis/                        # API layer for data operations
│   ├── book_Api/               # Book-related API calls
│   ├── cart_Api/               # Cart management APIs
│   ├── cartDetail_Api/         # Cart detail operations
│   └── user_Api/               # User authentication APIs
├── generated/
│   └── assets.dart             # Generated asset references
├── models/                     # Data models and entities
│   ├── book/                   # Book model definitions
│   ├── cart/                   # Cart model structures
│   ├── cartDetail/             # Cart detail models
│   └── user/                   # User model classes
├── services/                   # Business logic and services
│   ├── utils/                  # Utility functions and helpers
│   └── apiClient.dart          # API client configuration
└── view/                       # UI components and screens
    ├── onBoard/                # Onboarding experience
    ├── add.dart                # Add book functionality
    ├── bookCard.dart           # Book display components
    ├── cart.dart               # Shopping cart interface
    ├── cartHistory.dart        # Cart history tracking
    ├── detail.dart             # Book detail views
    ├── drawer.dart             # Navigation drawer
    ├── editbook.dart           # Book editing interface
    ├── home.dart               # Main dashboard
    ├── login.dart              # Authentication screen
    ├── profile.dart            # User profile management
    ├── themeprovider.dart      # Theme management
    └── fontprovider.dart       # Font customization
```

## Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0           # State management
  shared_preferences: ^2.0.0  # Local data persistence
  http: ^0.13.0              # API communication (likely)
  # Additional dependencies for API integration and UI components
```

## Architecture

This application follows a clean architecture pattern with clear separation of concerns:

### API Layer (`/apis`)
- **RESTful API Integration**: Separate API classes for different entities
- **Book API**: Handles book CRUD operations
- **Cart API**: Manages shopping cart functionality
- **User API**: Authentication and user management
- **Cart Detail API**: Detailed cart item operations

### Data Models (`/models`)
- **Type-safe Models**: Strongly typed data classes for all entities
- **JSON Serialization**: Automatic parsing of API responses
- **Data Validation**: Built-in validation for model integrity

### Services Layer (`/services`)
- **API Client**: Centralized HTTP client configuration
- **Utility Functions**: Shared helper functions and constants
- **Business Logic**: Core application logic separate from UI

### Presentation Layer (`/view`)
- **Screen Components**: Individual screens and their logic
- **Reusable Widgets**: Custom components like BookCard
- **State Management**: Provider-based state management
- **Navigation**: Drawer-based navigation system

## Routes

The app includes the following navigation routes:

- `/home` - Main dashboard and book listing
- `/login` - User authentication screen  
- `/profile` - User profile and settings
- `/addBook` - Add new books to the library

### Additional Screens
- **Book Details** - Comprehensive book information view
- **Cart Management** - Shopping cart with add/remove functionality
- **Cart History** - Historical view of past cart activities
- **Edit Book** - Modify existing book information
- **Navigation Drawer** - App-wide navigation menu

## Features in Detail

### Onboarding System
- First-time users see an introduction screen
- Uses SharedPreferences to track user's first visit
- Seamless transition to main app after onboarding

### Theme Management
- System-wide theme switching capability
- Supports both light and dark modes
- Theme preference persisted across app sessions

### User Experience
- Responsive design for different screen sizes
- Intuitive navigation with clear visual hierarchy
- Consistent design language throughout the app

## Future Enhancements

- [ ] Advanced book search and filtering functionality
- [ ] Book categories and genre classification
- [ ] Reading progress tracking and bookmarks
- [ ] Book recommendations based on reading history
- [ ] Cloud synchronization for multi-device access
- [ ] Export/Import library data (CSV, JSON)
- [ ] Book reviews and rating system
- [ ] Wishlist functionality
- [ ] Barcode scanning for quick book addition
- [ ] Social features (book sharing, reading groups)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Development Setup

### Code Style
- Follow Flutter/Dart coding conventions
- Use meaningful variable and function names
- Comment complex logic appropriately

### Testing
```bash
# Run tests
flutter test

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## Troubleshooting

### Common Issues

**Issue**: App crashes on first launch
**Solution**: Ensure all dependencies are properly installed with `flutter pub get`

**Issue**: Theme not switching properly
**Solution**: Check that ThemeProvider is properly wrapped with ChangeNotifierProvider

**Issue**: Routes not working
**Solution**: Verify route names match exactly in navigation calls

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Your Name - [your.email@example.com](mailto:your.email@example.com)

Project Link: [https://github.com/yourusername/library-project](https://github.com/yourusername/library-project)

## Acknowledgments

- Flutter team for the excellent framework
- Provider package contributors
- Open source community for inspiration and resources

---

Written by: Amirreza Kamali
