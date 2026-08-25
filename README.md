<p align="center">
  <img src="assets/logo/dark_on_light_logo.png" alt="ShopSphere Logo" width="280"/>
</p>

<h1 align="center">ShopSphere — E-Commerce Mobile App</h1>

<p align="center">
  A full-featured, production-grade e-commerce mobile application built with <strong>Flutter</strong>, powered by <strong>Supabase</strong> as a backend and <strong>Firebase</strong> for push notifications.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.10+-02569B?logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.10+-0175C2?logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Supabase-Backend-3ECF8E?logo=supabase&logoColor=white" alt="Supabase"/>
  <img src="https://img.shields.io/badge/Firebase-Notifications-FFCA28?logo=firebase&logoColor=black" alt="Firebase"/>
  <img src="https://img.shields.io/badge/BLoC-State%20Management-blue" alt="BLoC"/>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey" alt="Platforms"/>
</p>

---

## 📖 Overview

**Cartely** is a modern, polished e-commerce application that delivers a complete shopping experience — from browsing products and managing a shopping cart, to checkout with payment integration, order tracking, and product reviews. The app supports **dark/light theme**, **Arabic & English localization (RTL/LTR)**, and follows **Clean Architecture** principles throughout.

---

## ✨ Features

### 🛍️ Shopping
- **Product Feed** — Browse products with infinite scrolling and skeleton loading
- **Category Browsing** — Filter products by category
- **Product Search** — Real-time search with debounced queries
- **Product Details** — Tabbed view with product info, image gallery, and variation selection (size, color, etc.)
- **Product Filtering & Sorting** — Filter by price range, rating, and sort by relevance/price/newest
- **Promotions Banner** — Auto-scrolling carousel for active promotions

### 🛒 Cart & Checkout
- **Shopping Cart** — Add/remove items, adjust quantities with real-time price updates
- **Multi-Step Checkout** — Address → Payment → Review flow with step indicators
- **Saved Addresses** — Full CRUD for delivery addresses with Arabic/English formatting
- **Payment Methods** — Add and manage payment cards with form validation
- **Order Confirmation** — Animated success/failure states with deep link support

### 📦 Orders
- **Order History** — View all past orders with status filter chips (Pending, Confirmed, Delivered, etc.)
- **Order Search** — Search orders by order number
- **Order Details** — Detailed breakdown with product items, address, and payment info

### ❤️ Wishlist
- **Wishlist Management** — Add/remove favorites from any product card or detail page
- **Persistent State** — Wishlist synced globally across the app

### ⭐ Reviews
- **Product Reviews** — View ratings and reviews per product with summary header
- **Submit Reviews** — Rate and review delivered purchases via bottom sheet forms
- **My Reviews** — View and manage all your submitted reviews
- **Rate Your Purchases** — Dedicated page for unreviewed delivered products

### 👤 Profile & Settings
- **Profile Management** — View and edit name, avatar (with image picker & cropper)
- **Personal Details** — View account email and metadata
- **App Settings** — Theme mode (Light/Dark/System), language selector (English/Arabic)
- **Notification Settings** — Toggle push notification topics (e.g., promotions)
- **Security** — Change password from settings

### 🔐 Authentication
- **Email/Password Login & Registration**
- **Forgot Password** — Send reset email via Supabase Auth
- **Password Reset** — Deep link–driven reset flow with PKCE
- **Protected Routes** — Automatic redirect with `GoRouter` guards

### 🔔 Notifications
- **Firebase Cloud Messaging** — Push notifications with topic subscriptions
- **Local Notifications** — Foreground message display via `flutter_local_notifications`

### 🌐 Localization
- **English & Arabic** — Full app localization with `intl` ARB files
- **RTL Support** — Proper bidirectional text handling and layout mirroring

---

## 🏗️ Architecture

The app follows **Clean Architecture** with a feature-first folder structure. Each feature module is divided into three layers:

```
feature/
├── data/
│   ├── data_sources/     # Remote API calls (Supabase)
│   ├── models/           # Data models with serialization
│   └── repos/            # Repository implementations
├── domain/
│   ├── entities/         # Business entities
│   ├── repos/            # Abstract repository contracts
│   └── use_cases/        # Business logic use cases
└── presentation/
    ├── logic/            # Cubits & States (BLoC)
    ├── views/            # Screen-level widgets
    └── widgets/          # Reusable UI components
```

### Key Architectural Decisions

| Concern | Solution |
|---|---|
| **State Management** | `flutter_bloc` (Cubit pattern) |
| **Dependency Injection** | `get_it` + `injectable` (code generation) |
| **Navigation** | `go_router` with auth-reactive redirects |
| **Error Handling** | `dartz` Either type + centralized `ExceptionMapper` → `Failure` hierarchy |
| **Backend** | Supabase (Auth, Database, Storage, Edge Functions, RPC) |
| **Push Notifications** | Firebase Cloud Messaging + Local Notifications |
| **Image Caching** | `cached_network_image` |
| **Loading States** | `skeletonizer` for shimmer loading |

---

## 📂 Project Structure

```
lib/
├── core/
│   ├── dependency_injection/   # GetIt + Injectable setup
│   ├── error/                  # Failure classes & ExceptionMapper
│   ├── helpers/                # Constants, validators, formatters, utilities
│   ├── logic/                  # Shared cubits (deep links, image picker)
│   ├── models/                 # Shared data models
│   ├── notifications_service/  # Push & local notification services
│   ├── preferences/            # SharedPreferences wrapper
│   ├── routes/                 # GoRouter configuration & guards
│   ├── supabase/               # Supabase client, config & service
│   ├── theme/                  # Light/dark themes, color schemes, typography
│   └── widgets/                # Shared reusable widgets
├── features/
│   ├── addresses/              # Address management (CRUD)
│   ├── auth/                   # Login, register, forgot/reset password
│   ├── cart/                   # Shopping cart
│   ├── checkout/               # Multi-step checkout flow
│   ├── home/                   # Product feed, categories, promotions, search
│   ├── notifications/          # Notification settings
│   ├── orders/                 # Order history & details
│   ├── payment/                # Payment method management
│   ├── product/                # Product catalog & detail views
│   ├── profile/                # User profile & edit
│   ├── reviews/                # Product reviews & ratings
│   ├── settings/               # App settings (theme, language)
│   ├── splash/                 # Splash screen
│   └── wish_list/              # Wishlist / favorites
├── generated/                  # Auto-generated localization
├── l10n/                       # ARB translation files (en, ar)
├── firebase_options.dart       # Firebase configuration
└── main.dart                   # App entry point
```

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter 3.10+ / Dart 3.10+ |
| **Backend** | Supabase (PostgreSQL, Auth, Storage, Edge Functions) |
| **Notifications** | Firebase Cloud Messaging |
| **State Management** | flutter_bloc (Cubit) |
| **DI** | get_it + injectable |
| **Routing** | go_router |
| **Functional Error Handling** | dartz |
| **Localization** | intl + flutter_localizations |
| **Image Handling** | image_picker, image_cropper, flutter_image_compress |
| **Image Caching** | cached_network_image |
| **Loading Skeletons** | skeletonizer |
| **Dialogs** | awesome_dialog |
| **Local Storage** | shared_preferences |
| **Ratings** | flutter_rating_bar |
| **Splash Screen** | flutter_native_splash |
| **App Icons** | flutter_launcher_icons |

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** `>= 3.10.4`
- **Dart SDK** `>= 3.10.4`
- A **Supabase** project (with database, auth, and storage configured)
- A **Firebase** project (for push notifications)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/osamamsm/e_commerce.git
   cd e_commerce
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Supabase**

   Update [`lib/core/supabase/supabase_config.dart`](lib/core/supabase/supabase_config.dart) with your Supabase project URL and anon key:
   ```dart
   class SupabaseConfig {
     static const String supabaseUrl = 'YOUR_SUPABASE_URL';
     static const String anonKey = 'YOUR_SUPABASE_ANON_KEY';
   }
   ```

4. **Configure Firebase**

   Set up Firebase for your platform using the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/):
   ```bash
   flutterfire configure
   ```

5. **Run code generation** (for injectable DI)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

6. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

7. **Generate splash screen**
   ```bash
   dart run flutter_native_splash:create
   ```

8. **Generate app icons**
   ```bash
   dart run flutter_launcher_icons
   ```

9. **Run the app**
   ```bash
   flutter run
   ```

---

## 🌍 Localization

The app supports **English** and **Arabic** with full RTL layout support.

- Translation files are located in [`lib/l10n/`](lib/l10n/)
- `intl_en.arb` — English translations
- `intl_ar.arb` — Arabic translations
- Users can switch language from **Settings** at runtime

---

## 🎨 Theming

The app features a polished, custom Material 3 design system:

- **Light Theme** — Clean blue-accented design with a `#FAFBFF` background
- **Dark Theme** — Deep navy (`#0A1929`) with vibrant blue accents
- **Blurry Background** — Custom theme extension for glassmorphism effects
- **Custom Components** — Themed buttons (elevated, outlined glass, text), inputs, and more
- Users can switch between **Light**, **Dark**, and **System** modes from Settings

---

## 📱 Screens

| Screen | Description |
|---|---|
| **Splash** | Branded splash with auth state resolution |
| **Login / Register** | Email & password authentication forms |
| **Forgot / Reset Password** | Email-based recovery with deep link support |
| **Home** | Product feed, categories, promotions, search, drawer |
| **Category Products** | Products filtered by selected category |
| **Search Results** | Search results with product grid |
| **Product Details** | Image gallery, variations, add to cart, reviews tab |
| **Cart** | Cart items with quantity stepper & order summary |
| **Checkout** | 3-step flow: Address → Payment → Review & Place Order |
| **Payment Confirmation** | Deep link callback with order status resolution |
| **Orders** | Order history with status filters & search |
| **Order Details** | Full order breakdown |
| **Wishlist** | Favorited products grid |
| **Profile** | User info with avatar |
| **Edit Profile** | Update name & avatar (crop, compress, upload) |
| **Personal Details** | Read-only account information |
| **Saved Addresses** | Address list with add/edit/delete |
| **My Reviews** | User's submitted reviews |
| **Rate Purchases** | Delivered products awaiting review |
| **Settings** | Theme, language, notifications, security |

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---


