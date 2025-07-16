# 📖 OSMEA Components Storybook

[![Flutter](https://img.shields.io/badge/Flutter-Storybook-blue?logo=flutter)](https://flutter.dev)

An interactive playground and documentation hub for all [OSMEA Components](https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components).  
Explore, test, and develop UI components in isolation with live property controls, device frames, and modular stories.

---

## 🚀 Features

- **Live component demos** with real-time property controls (knobs)
- **Device frame previews** for mobile/tablet/desktop
- **Modular structure:** each component has its own showcase, sections, and examples
- **Templates & scripts** for rapid new component story creation
- **Structure validator** to ensure consistency across all stories

---


## 🧑‍💻 Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the storybook:**
   ```bash
   flutter run
   ```

3. **Try the web version:**
   ```bash
   flutter run -d chrome
   ```

---

## 🧩 Modular Component Stories

Each component has its own modular folder (e.g., `button_test_modular/`, `badge_test_modular/`) with:

- **Showcase widgets** for live demos
- **Sections** for usage, variants, and guidelines
- **Knobs** for real-time property changes
- **Data, utils, and templates** for rapid development

You can scaffold a new component story with:
```bash
cd lib/storybook_test/_templates
./create_component_structure.sh <component_name>
```

Validate all stories for structure compliance:
```bash
dart lib/storybook_test/_templates/storybook_validator.dart
```

---

## 💡 Why Use This Storybook?

- **Develop and test components in isolation**
- **Document usage, variants, and best practices**
- **Share interactive examples with your team**
- **Ensure consistency and accessibility across your UI kit**

---

## 📚 Learn More

- [OSMEA Components Documentation](https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components)
- [Main OSMEA Repo](https://github.com/masterfabric-mobile/osmea)

---

## 📄 License

> 🔐 **License:** GNU AGPL v3.0  
> 📜 This project is protected under the **GNU Affero General Public License v3.0**.  
> If you modify and deploy this project publicly, you must also **publish your changes** under the same license.

📎 Full details available in the [`LICENSE`](https://github.com/masterfabric-mobile/osmea/blob/dev/LICENSE) file.

---

**Built with ❤️ by the OSMEA Team**

© 2025 MasterFabric Mobile • Maintained by the OSMEA Engineering Team
