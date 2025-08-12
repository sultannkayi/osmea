# Go Router Yapısı - Example Mobile

Bu dosya, example_mobile uygulamasının Go Router yapısını tanımlar.

## Yapı

### 1. Splash ve Intro Screen'ler
- **`/splash`** - Splash screen (başlangıç ekranı)
- **`/intro`** - Intro/Onboarding ekranı

Bu sayfalar **ShellRoute dışında** tanımlanır ve **AppBar yok**.

### 2. Ana Sayfalar (ShellRoute ile)
- **`/`** - Login/Home sayfası (`ModernLoginScreen`)
- **`/components`** - Components listesi (`ModernComponentsScreen`) 
- **`/info`** - Info sayfası (`ModernInfoScreen`)

Bu sayfalar `ShellRoute` içinde tanımlanır ve `MainScreen` ile sarmalanır. **Bu sayfalarda AppBar YOK** - sadece bottom navigation bar var.

### 3. Component Sayfaları (Ayrı Route'lar)
Her component için ayrı route tanımlanır:
- **`/component/align`** - `AlignExample`
- **`/component/button`** - `ButtonExample`
- **`/component/card`** - `CardExample`
- **`/component/appbar`** - `AppbarShowcase`
- Ve diğer tüm component'lar...

Bu sayfalar **ShellRoute dışında** tanımlanır ve **kendi AppBar'ları var**.

## AppBar Stratejisi

### ❌ AppBar YOK
- Splash screen
- Intro screen
- Login/Home sayfası
- Components listesi  
- Info sayfası

### ✅ AppBar VAR
- Tüm component example sayfaları
- Kendi AppBar'ları ile gelir
- Back button ile ana sayfalara dönüş

## Navigation Flow

```
/splash → /intro → / (ana sayfa) → /components, /info
                    ↓
              /component/button, /component/card, vs.
```

## Navigation

### Ana Sayfa Geçişleri
```dart
AppRoutes.goToHome(context);      // / -> Login
AppRoutes.goToComponents(context); // /components -> Components list
AppRoutes.goToInfo(context);      // /info -> Info
```

### Component Sayfalarına Geçiş
```dart
AppRoutes.goToComponent(context, 'Button'); // /component/button
AppRoutes.goToComponent(context, 'Card');   // /component/card
```

## Dosya Yapısı

```
lib/
├── routes/
│   ├── app_routes.dart     # Ana router yapılandırması
│   └── README.md          # Bu dosya
├── screens/
│   ├── splash_screen.dart # Splash screen (AppBar YOK)
│   ├── intro_screen.dart  # Intro screen (AppBar YOK)
│   ├── main_screen.dart   # Shell wrapper (AppBar YOK)
│   ├── login_screen.dart  # Ana sayfa (AppBar YOK)
│   ├── components_screen.dart # Ana sayfa (AppBar YOK)
│   └── info_screen.dart   # Ana sayfa (AppBar YOK)
└── components/
    ├── button_example.dart # Component sayfası (AppBar VAR)
    ├── card_example.dart   # Component sayfası (AppBar VAR)
    └── ...                 # Diğer component'lar
```

## Avantajlar

1. **Temiz UI**: Navbar ile gezilen sayfalarda AppBar yok
2. **Component Navigation**: Her component kendi sayfasında
3. **Back Navigation**: Component'lardan ana sayfalara kolay dönüş
4. **Go Router**: Tüm navigation Go Router ile yönetiliyor
5. **ShellRoute**: Bottom navigation bar korunuyor
6. **Splash & Intro**: Uygulama başlangıcı düzgün