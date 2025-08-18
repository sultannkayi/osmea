# 📦 Version Log – OSMEA

> This changelog is generated from the latest closed pull requests. For a full, always-up-to-date changelog, visit [Closed PRs on GitHub](https://github.com/masterfabric-mobile/osmea/pulls?state=closed&sort=updated&direction=desc).  



## v1.28.13

### 🆕 Added & Improvements

- **[#132 – OSMEA - Components - Storybook → Renaming](https://github.com/masterfabric-mobile/osmea/pull/132)**
  Renamed all storybook component files from legacy `*_test_modular` to the new `*_storybook` naming pattern for better clarity and future structure. Updated all import statements and improved project naming consistency.

- **[#133 – OSMEA - Projects - Storybook → Move Storybook to Projects](https://github.com/masterfabric-mobile/osmea/pull/133)**  
  Major reorganization: moved Storybook to a dedicated `projects/storybook` Flutter app, centralized configuration, standardized naming, updated dependencies, improved structure, and fixed import paths.

- **[#135 – OSMEA - Projects → Admin Dashboard - Welcome View](https://github.com/masterfabric-mobile/osmea/pull/135)**  
  Introduced major improvements and structural changes to the onboarding flow: new `WelcomeView`, onboarding helper, splash event, developer mode, navigation enhancements, better translations, and UI consistency.

- **[#137 – Components App – UI Improvements](https://github.com/masterfabric-mobile/osmea/pull/137)**  
  Transforms the example mobile app into a polished Osmea Components UI Kit demo. Adds Splash + Onboarding flows, minimalist modern design, component showcase, detail views, new navigation, and refactors for maintainability and scalability.

- **[#138 – Components App – App Display Name](https://github.com/masterfabric-mobile/osmea/pull/138)**  
  Updates the display name and package identifiers across all platforms to "Components App", ensuring consistency and clarity.

- **[#139 – Components App – Web View Device Frame](https://github.com/masterfabric-mobile/osmea/pull/139)**  
  Adds a mobile device frame (iPhone 16 Pro Max) to the web view using the `device_frame` package, making the showcase more professional and realistic for mobile developers.

- **[#140 – Api Example → Moving and Renaming](https://github.com/masterfabric-mobile/osmea/pull/140)**  
  Moves and renames the `example/` directory to `projects/api_explorer/`, updates all references and import paths, and improves project structure.

- **[#141 – Package – API → Add Shop Wizard and Sample Code](https://github.com/masterfabric-mobile/osmea/pull/141)**  
  Adds a wizard-based configuration for WooCommerce and Shopify, improves API Explorer UI, refactors store management logic, and includes sample code for easier integration.

---

### 🐞 Bug Fixes

- **[#136 – OSMEA - Fix → WooCommerce API Batch Registry](https://github.com/masterfabric-mobile/osmea/pull/136)**  
  Bug fixes, minor optimizations, and code improvements in the WooCommerce batch API registry and services.

---

### 📚 Documentation

- **[#134 – OSMEA - Projects - Rules for IDEs](https://github.com/masterfabric-mobile/osmea/pull/134)**  
  Documentation for IDE rules and configuration.

---

### ⚠️ Known Issues

_No explicit known issues found in these pull requests._

---


## v1.20.11

### 🆕 Added & Improvements

- **#122 – OSMEA - Package - API → Network woocommerce shipping zone**  
  [PR #122](https://github.com/masterfabric-mobile/osmea/pull/122)  
  Integrated WooCommerce Shipping Zones and Shipping Zone Methods APIs, including CRUD services, handlers, and UI elements for zone management.

- **#123 – OSMEA - Package - Docs → woocommerce config pop and sidebar menu**  
  [PR #123](https://github.com/masterfabric-mobile/osmea/pull/123)  
  Standardized ApiServiceRegistry category/subcategory naming and added WooCommerce-specific configuration fields to the config popup.

- **#124 – OSMEA - Package - API → Network woocommerce patch operations**  
  [PR #124](https://github.com/masterfabric-mobile/osmea/pull/124)  
  Introduced batch update functionality for WooCommerce Coupons, Customers, and Orders via new API handlers and service registry updates.

- **#126 – OSMEA - Package - API → Network woocommerce patch operations**  
  [PR #126](https://github.com/masterfabric-mobile/osmea/pull/126)  
  Added batch update operations for multiple WooCommerce resources (products, categories, attributes, reviews, shipping methods, tax rates, webhooks), with new handlers and registry integration.

---

### 🐞 Bug Fixes

- **#125 – OSMEA - Projects → Admin Dashboard - Onboarding View**  
  [PR #125](https://github.com/masterfabric-mobile/osmea/pull/125)  
  Implemented an onboarding view for the admin dashboard, introducing a responsive, multi-step onboarding UI with improved navigation and error handling; no breaking changes.

- **#129 – OSMEA - Fix → Project Admin Dashboard**  
  [PR #129](https://github.com/masterfabric-mobile/osmea/pull/129)  
  Structural improvements, refactors, and bug fixes for the Admin Dashboard and Onboarding modules, including navigation, event handling, and UI consistency updates.

---

### 📚 Documentation

- **#127 – OSMEA - Components - Storybook → Carousel**  
  [PR #127](https://github.com/masterfabric-mobile/osmea/pull/127)  
  Adds a comprehensive interactive Storybook showcase for the Carousel component, including all variants, real-time configuration, and documentation.

- **#128 – OSMEA - Components - Storybook → Searchbar**  
  [PR #128](https://github.com/masterfabric-mobile/osmea/pull/128)  
  Introduces an interactive Storybook showcase for the Searchbar component, supporting multiple variants, live knob controls, and style previews.

- **#130 – OSMEA - Components - Storybook → Ticket**  
  [PR #130](https://github.com/masterfabric-mobile/osmea/pull/130)  
  Implements a modular, interactive Storybook for the Ticket Widget, with live controls for all field types, styling, and documentation.

---

### ⚠️ Known Issues

_No explicit known issues listed in the provided closed pull requests._




## v1.13.9

### 🆕 Added & Improvements

- **#97:** Added WooCommerce coupon integration and advanced API capabilities to the project.
- **#99:** Developed a new Grid and Spacer system, contributing to the core infrastructure.
- **#104:** Refactored the file structure by separating Shopify and WooCommerce modules for better modularity.
- **#106:** Implemented full CRUD operations and management interface for the WooCommerce Coupon API.
- **#107:** Provided CRUD operations and management support for the WooCommerce Customer API.
- **#109:** Integrated API for WooCommerce orders and order notes, adding new services.
- **#110:** Delivered comprehensive WooCommerce product management API, covering products, categories, tags, and related entities.
- **#111:** Integrated WooCommerce Webhook and system status APIs, introducing new features.
- **#114:** Added WooCommerce shipping and payment method APIs, expanding administrative options.
- **#115:** Extended the admin panel via WooCommerce reports and settings API integration.
- **#117:** Enhanced data management with continent, country, currency, and refund APIs, and introduced global ApiDataService.
- **#119:** Launched the foundation and splash screen of the Flutter-based admin dashboard.
- **#120:** Fully integrated WooCommerce tax classes and rates API with relevant services.

---

### 🐞 Bug Fixes

- **#105:** Fixed a critical integration issue between Counter and Chips components.
- **#101:** Resolved rendering issues in sidebar category management and Divider component, improving UX.

---

### 📚 Documentation

- **#98:** Added interactive Storybook documentation and bug fixes for the Divider component.
- **#102:** Provided comprehensive Storybook and UI improvements for all List Item variants.
- **#103:** Extended Storybook documentation for the Counter component with new variants and customization options.
- **#108:** Delivered extensive Storybook documentation and interactive features for Container widgets.
- **#113:** Created detailed documentation and showcase for all color palettes in the design system.
- **#116:** Developed a comprehensive Typography documentation page for Storybook with a clean and readable layout.
- **#118:** Added an interactive Storybook and documentation for the Footer component, covering all variants and live controls.

---

### ⚠️ Known Issues

- No explicitly stated known issues are present in this PR list.



## v1.0.0
### 🆕 Added & Improvements

- **Text Component Storybook** ([#94](https://github.com/masterfabric-mobile/osmea/pull/94)):  
  Introduced Storybook preview for the `Text` component.

- **Dot Indicator Component** ([#91](https://github.com/masterfabric-mobile/osmea/pull/91), [#89](https://github.com/masterfabric-mobile/osmea/pull/89)):  
  Implemented Dot Indicator for visual step progress in UI flows.

- **Snackbar & Progress Enhancements** ([#88](https://github.com/masterfabric-mobile/osmea/pull/88)):  
  Added a Snackbar component and improved functionality in the Progress widget.

- **Collapse Component** ([#87](https://github.com/masterfabric-mobile/osmea/pull/87)):  
  Added a collapsible section component for expandable content areas.

- **Example Refactor** ([#86](https://github.com/masterfabric-mobile/osmea/pull/86), [#84](https://github.com/masterfabric-mobile/osmea/pull/84), [#81](https://github.com/masterfabric-mobile/osmea/pull/81)):  
  Standardized example screens for better design alignment and cleaner code.

- **Counter Component** ([#85](https://github.com/masterfabric-mobile/osmea/pull/85)):  
  Introduced a numeric counter widget.

- **Storybook Code Standardization** ([#83](https://github.com/masterfabric-mobile/osmea/pull/83)):  
  Centralized Storybook component registration and eliminated duplication.

- **Chips Storybook Module** ([#80](https://github.com/masterfabric-mobile/osmea/pull/80)):  
  Added a fully interactive module to demonstrate Chips usage.

- **Footer Component** ([#79](https://github.com/masterfabric-mobile/osmea/pull/79)):  
  Introduced `OsmeaFooter` with flexible layout options.

- **Image Component Refactor** ([#78](https://github.com/masterfabric-mobile/osmea/pull/78)):  
  Refactored the `Image` widget for improved performance and cleaner API.

- **Dropdown Component** ([#77](https://github.com/masterfabric-mobile/osmea/pull/77)):  
  Introduced a Cubit-based dropdown system with support for custom types and theming.

- **Cards Storybook Module** ([#76](https://github.com/masterfabric-mobile/osmea/pull/76)):  
  Added modular and responsive Cards demos to Storybook.

- **TabBar Structural Improvements** ([#75](https://github.com/masterfabric-mobile/osmea/pull/75)):  
  Introduced enums and structured configuration for TabBar customization.

- **Badge Storybook Module** ([#74](https://github.com/masterfabric-mobile/osmea/pull/74)):  
  Added Badge component examples to Storybook.
  
- **SearchBar Component** ([#70](https://github.com/masterfabric-mobile/osmea/pull/70)):  
  Added a modern and customizable `SearchBar` widget.

- **Toast Message Component** ([#68](https://github.com/masterfabric-mobile/osmea/pull/68)):  
  Introduced a `Toast` message component for lightweight user notifications.

- **FittedBox and ClipRRect Support** ([#67](https://github.com/masterfabric-mobile/osmea/pull/67)):  
  Integrated `FittedBox` and `ClipRRect` for better media and content rendering.

- **Example Refactor** ([#66](https://github.com/masterfabric-mobile/osmea/pull/66)):  
  Refactored example screens for improved code consistency and simplicity.

- **Avatar Storybook Module** ([#65](https://github.com/masterfabric-mobile/osmea/pull/65)):  
  Added `Avatar` component showcase to Storybook.

- **Storybook Components** ([#63](https://github.com/masterfabric-mobile/osmea/pull/63)):  
  Integrated new and updated component demos into the Storybook environment.

- **Checklist Component** ([#62](https://github.com/masterfabric-mobile/osmea/pull/62)):  
  Introduced a checklist module for project planning and documentation tracking.

- **Loading Component** ([#55](https://github.com/masterfabric-mobile/osmea/pull/55)):  
  Added a loading indicator widget for asynchronous operations.

- **List Item Component** ([#52](https://github.com/masterfabric-mobile/osmea/pull/52)):  
  Introduced List Item widget for standardized list layouts.

- **Stepper Component** ([#56](https://github.com/masterfabric-mobile/osmea/pull/56)):  
  Added Stepper widget for multi-step flows.

- **TextField Component** ([#47](https://github.com/masterfabric-mobile/osmea/pull/47)):  
  Implemented advanced TextField component.
  
- **Customizable Button Component** ([#39](https://github.com/masterfabric-mobile/osmea/pull/39)):  
  Added a new button component with extended customization options for themes and states.

- **Enhanced Navigation Bar** ([#37](https://github.com/masterfabric-mobile/osmea/pull/37)):  
  Improved the navigation bar with additional configuration and accessibility features.

- **Typography Updates** ([#36](https://github.com/masterfabric-mobile/osmea/pull/36)):  
  Refactored and updated typography styles for better consistency.

- **Icon Library Expansion** ([#34](https://github.com/masterfabric-mobile/osmea/pull/34)):  
  Added new icons to the shared icon library.

- **Switch Component** ([#29](https://github.com/masterfabric-mobile/osmea/pull/29)):  
  Introduced a new Switch widget for toggling options.
  
- **Slider Component** ([#24](https://github.com/masterfabric-mobile/osmea/pull/24)):  
  Introduced a new Slider widget for interactive value selection.

- **Modal Dialog Component** ([#20](https://github.com/masterfabric-mobile/osmea/pull/20)):  
  Added a customizable modal dialog for confirmations and alerts.

- **Calendar Widget** ([#18](https://github.com/masterfabric-mobile/osmea/pull/18)):  
  Implemented a Calendar component for date picking functionality.

- **Notification System** ([#15](https://github.com/masterfabric-mobile/osmea/pull/15)):  
  Added a global notification system with flexible theming.

- **Refactored App Theming** ([#13](https://github.com/masterfabric-mobile/osmea/pull/13)):  
  Improved theming architecture for easier customization and consistency.

- **Input Field Enhancements** ([#11](https://github.com/masterfabric-mobile/osmea/pull/11)):  
  Extended input field features and validation options.  
---

### 🐞 Bug Fixes

- **Imports and Opacity Warnings** ([#82](https://github.com/masterfabric-mobile/osmea/pull/82)):  
  Removed unused imports and resolved color opacity-related warnings.

- **Dot Indicator Duplication Fix** ([#89](https://github.com/masterfabric-mobile/osmea/pull/89)):  
  Resolved duplication issue in Dot Indicator component.

- **Example Improvements & Code Cleanup** ([#54](https://github.com/masterfabric-mobile/osmea/pull/54), [#31](https://github.com/masterfabric-mobile/osmea/pull/31)):  
  Enhanced code quality and alignment across example screens.
  
- **Docs and Typo Corrections** ([#69](https://github.com/masterfabric-mobile/osmea/pull/69)):  
  Fixed typos in both documentation and codebase.
  
- **Example Improvements & Code Standardization**  
  ([#54](https://github.com/masterfabric-mobile/osmea/pull/54), [#48](https://github.com/masterfabric-mobile/osmea/pull/48),  
  [#44](https://github.com/masterfabric-mobile/osmea/pull/44), [#43](https://github.com/masterfabric-mobile/osmea/pull/43),  
  [#41](https://github.com/masterfabric-mobile/osmea/pull/41))  
  Enhanced code quality, fixed miscellaneous UI bugs, and improved consistency across example screens.
  
- **Button Disabled State Fix** ([#38](https://github.com/masterfabric-mobile/osmea/pull/38)):  
  Fixed issues with button disabled state rendering.

- **Navigation Bar Padding Correction** ([#35](https://github.com/masterfabric-mobile/osmea/pull/35)):  
  Corrected padding inconsistencies in the navigation bar.

- **Icon Size Bug** ([#32](https://github.com/masterfabric-mobile/osmea/pull/32)):  
  Fixed icon sizing issues for consistent UI appearance.
  
- **Modal Animation Issue** ([#21](https://github.com/masterfabric-mobile/osmea/pull/21)):  
  Fixed improper animation sequence for modal dialogs.

- **Slider Value Correction** ([#17](https://github.com/masterfabric-mobile/osmea/pull/17)):  
  Addressed slider not updating value correctly on drag events.

- **Calendar Date Format Fix** ([#16](https://github.com/masterfabric-mobile/osmea/pull/16)):  
  Fixed date format inconsistencies in calendar component.

- **Notification Dismiss Bug** ([#12](https://github.com/masterfabric-mobile/osmea/pull/12)):  
  Corrected notification dismissal logic.
  
---

### 📚 Documentation

- **Text Component Enhancements & Storybook Integration** ([#95](https://github.com/masterfabric-mobile/osmea/pull/95)):  
  Improved the Text component and integrated it with Storybook for better demo and visualization.

- **Checklist & README Updates** ([#90](https://github.com/masterfabric-mobile/osmea/pull/90)):  
  Updated project-wide checklist files and documentation in README.

- **Component README Improvements** ([#71](https://github.com/masterfabric-mobile/osmea/pull/71), [#72](https://github.com/masterfabric-mobile/osmea/pull/72), [#73](https://github.com/masterfabric-mobile/osmea/pull/73)):  
  Added and revised README documentation for components and packages.

- **Checklist and README Updates** ([#62](https://github.com/masterfabric-mobile/osmea/pull/62)):  
  Updated project checklists and improved README content.

- **Readme and Checklist Updates**  
  ([#51](https://github.com/masterfabric-mobile/osmea/pull/51), [#49](https://github.com/masterfabric-mobile/osmea/pull/49), [#46](https://github.com/masterfabric-mobile/osmea/pull/46))  
  Updated main README and checklist documentation for better onboarding and clarity.
  
- **Component Usage Examples** ([#33](https://github.com/masterfabric-mobile/osmea/pull/33)):  
  Added detailed usage examples for newly introduced components.

- **Readme Updates** ([#28](https://github.com/masterfabric-mobile/osmea/pull/28)):  
  Updated the main README with new component references and instructions.

- **Component API Docs** ([#10](https://github.com/masterfabric-mobile/osmea/pull/10)):  
  Added API documentation for new components (Slider, Modal, Calendar).

- **Usage Guides** ([#6](https://github.com/masterfabric-mobile/osmea/pull/6)):  
  Updated guides for integrating new widgets and systems.

- **Readme Refresh** ([#2](https://github.com/masterfabric-mobile/osmea/pull/2)):  
  Refreshed main README with latest features and structure.
  
---

### ⚠️ Known Issues

- For large-scale refactors, manual UI and functional testing is strongly recommended.
- Some improvements (e.g., `Image`, `Dropdown`) may require additional verification on legacy screens.

- Some visual components may require additional manual testing for theming and responsiveness.  
- The `Toast` and `Loading` components may need validation when integrated into legacy screens.

- Some bugs in TextField and Stepper components may require additional manual validation after updates.  
- Please verify ListItem and Loading widget integration in legacy screens.

- Some refactored components (Button, Switch) may require additional testing for edge-case interactions.
- Please verify new icons rendering correctly across all supported platforms.

- Some edge cases remain in Slider and Calendar components; further manual testing recommended.
- Modal customization options may require UI validation for complex use cases.
- Ensure notification system does not conflict with legacy alert mechanisms in older screens.
