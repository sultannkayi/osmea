# Contributing to OSMEA ®️

<div align="center">

[![Contributors](https://img.shields.io/github/contributors/masterfabric-mobile/osmea?logo=github)](https://github.com/masterfabric-mobile/osmea/graphs/contributors)
[![Pull Requests Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/masterfabric-mobile/osmea/pulls)
[![First Timers Friendly](https://img.shields.io/badge/first--timers--only-friendly-blue.svg)](https://github.com/masterfabric-mobile/osmea/issues?q=is%3Aissue+is%3Aopen+label%3Afirst-timers-only)

**Thank you for your interest in contributing to OSMEA! 🎉**

</div>

---

## 🌟 Welcome Contributors!

We're excited that you want to contribute to OSMEA! This project aims to build a sustainable, functional, and reusable mobile architecture for the future of e-commerce applications. Every contribution, no matter how small, helps us achieve this vision.

### 🎯 Our Mission
- 🛠️ Providing a robust, modular codebase for rapid development  
- 🎯 Enabling scalable architecture adaptable to diverse use cases  
- 📚 Delivering fully documented, production-ready components

---

## 🤝 Ways to Contribute

### 📝 Reporting Issues
- 🐛 **Bug Reports**: Found a bug? Let us know!
- ✨ **Feature Requests**: Have an idea? We'd love to hear it!
- 📚 **Documentation**: Help improve our docs
- 🤔 **Questions**: Ask questions in discussions

### 💻 Code Contributions
- 🎨 **UI Components**: Build new widgets and components
- 🔧 **Core Features**: Implement new functionality
- 🧪 **Testing**: Write tests to improve coverage
- 🚀 **Performance**: Optimize existing code
- 🔐 **Security**: Enhance security features

### 📖 Non-Code Contributions
- 📝 **Documentation**: Improve README, guides, and API docs
- 🎨 **Design**: UI/UX improvements and design assets
- 🌍 **Translation**: Help localize OSMEA
- 📢 **Community**: Help others in discussions and issues

---

## 🛠️ Development Setup

### Prerequisites

Ensure you have the following installed:

```bash
# Required
- Flutter SDK (3.0+)
- Dart SDK (3.0+)
- Git
- Android Studio / VS Code

# Recommended VS Code Extensions
- Flutter
- Dart
- Flutter Intl
- GitLens
```

### 🚀 Quick Start

1. **Fork & Clone**
   ```bash
   # Fork the repository on GitHub
   # Then clone your fork
   git clone https://github.com/YOUR_USERNAME/osmea.git
   cd osmea
   ```

2. **Setup Development Environment**
   ```bash
   # Run our automated setup script
   chmod +x setup.sh
   ./setup.sh
   
   # Or manually:
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Verify Installation**
   ```bash
   # Run tests to ensure everything works
   flutter test
   
   # Start the app
   flutter run
   ```

### 📁 Project Structure

```bash
osmea/
├── packages/
│   ├── core/              # Core functionality and models
│   ├── apis/              # API integrations and services
│   └── ui/                # UI components and widgets
├── lib/
│   ├── features/          # Feature-specific modules
│   ├── shared/            # Shared utilities and constants
│   └── main.dart          # App entry point
├── test/                  # Test files
├── docs/                  # Documentation
└── assets/                # Images, fonts, and other assets
```

---

## 📋 Contribution Workflow

### 1. 🍴 Fork and Branch

```bash
# Create a new branch for your feature
git checkout -b feature/amazing-feature

# Or for bug fixes
git checkout -b fix/bug-description

# Or for documentation
git checkout -b docs/improvement-description
```

### 2. 🔧 Make Changes

Follow our coding standards:

#### **Dart/Flutter Code Standards**
- Use `dart format` for consistent formatting
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use meaningful variable and function names
- Add documentation comments for public APIs
- Implement proper error handling

#### **Commit Message Format**
Follow our [commit conventions](commits.md):

```bash
# Format: type: description
feat: add new payment gateway integration
fix: resolve cart calculation bug
docs: update API documentation
style: improve code formatting
test: add unit tests for product service
refactor: optimize inventory management logic
```

#### **Code Quality Checklist**
- [ ] Code follows project standards
- [ ] All tests pass (`flutter test`)
- [ ] No lint warnings (`flutter analyze`)
- [ ] Documentation updated if needed
- [ ] Commit messages follow conventions

### 3. 🧪 Testing

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/unit/product_test.dart

# Generate test coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

### 4. 📝 Documentation

Update documentation when:
- Adding new features or APIs
- Changing existing behavior
- Adding new dependencies
- Modifying setup instructions

### 5. 🔄 Submit Pull Request

Use our [Pull Request Template](pull_request_template.md):

1. **Create PR** with descriptive title
2. **Fill out template** completely
3. **Link related issues** using keywords (`fixes #123`)
4. **Request review** from maintainers
5. **Address feedback** promptly

---

## 🎯 Contribution Guidelines

### 🐛 Reporting Bugs

When reporting bugs, please include:

```markdown
**Bug Description**
A clear description of what the bug is.

**Steps to Reproduce**
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior**
What you expected to happen.

**Screenshots**
If applicable, add screenshots.

**Environment**
- OS: [e.g. iOS 15, Android 12]
- Flutter version: [e.g. 3.0.5]
- Device: [e.g. iPhone 13, Pixel 6]
```

### ✨ Requesting Features

For feature requests:

```markdown
**Feature Description**
Clear description of the feature.

**Problem Statement**
What problem does this solve?

**Proposed Solution**
How should this work?

**Alternatives Considered**
Other approaches you've thought about.

**Additional Context**
Screenshots, mockups, or examples.
```

### 🔍 Code Review Process

1. **Automated Checks**: CI/CD runs tests and checks
2. **Maintainer Review**: Core team reviews code
3. **Community Feedback**: Other contributors may comment
4. **Iteration**: Address feedback and improve
5. **Approval**: Maintainer approves changes
6. **Merge**: Changes are merged to main branch

---

## 🎨 UI/UX Contributions

### Design System

Follow our design system when contributing UI components:

- **Material Design 3**: Use latest Material Design principles
- **Responsive Design**: Support all screen sizes
- **Accessibility**: Ensure components are accessible
- **Theme Support**: Components should support dynamic theming

### UI Component Checklist

- [ ] Follows Material Design 3 guidelines
- [ ] Responsive across different screen sizes
- [ ] Supports light and dark themes
- [ ] Includes accessibility features
- [ ] Has comprehensive documentation
- [ ] Includes usage examples
- [ ] Has unit and widget tests

---

## 🔐 Security Contributions

If you discover security vulnerabilities:

1. **DO NOT** create public issues
2. **Report privately** to `license@masterfabric.co`
3. **Follow** our [Security Policy](SECURITY.md)
4. **Wait** for acknowledgment before disclosure

---

## 📚 Documentation Contributions

Help improve our documentation:

### Areas That Need Help
- API documentation
- Code examples
- Tutorials and guides
- Translation to other languages
- README improvements

### Documentation Standards
- Use clear, concise language
- Include code examples
- Add screenshots for UI features
- Keep information up-to-date
- Follow markdown best practices

---

## 🌍 Community Guidelines

### Code of Conduct

All contributors must follow our [Code of Conduct](CODE_OF_CONDUCT.md). In summary:

- **Be respectful** and inclusive
- **Be constructive** in feedback
- **Be patient** with newcomers
- **Be collaborative** and helpful

### Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: Questions and community chat
- **Pull Requests**: Code review and collaboration
- **Email**: `license@masterfabric.co` for private matters

---

## 🏷️ Issue Labels

We use labels to organize issues:

| Label | Description |
|-------|-------------|
| `bug` | Something isn't working |
| `enhancement` | New feature or request |
| `documentation` | Improvements or additions to docs |
| `good first issue` | Good for newcomers |
| `help wanted` | Extra attention is needed |
| `priority: high` | High priority items |
| `status: in progress` | Currently being worked on |

---

## 🎖️ Recognition

We appreciate all contributions! Contributors are recognized:

- **Contributors Graph**: Visible on GitHub
- **Release Notes**: Major contributions mentioned
- **Hall of Fame**: Top contributors highlighted
- **Special Thanks**: In project documentation

---

## 📞 Getting Help

Need help contributing? Here are your options:

### 💬 Ask Questions
- **GitHub Discussions**: For general questions
- **Issue Comments**: For specific code questions
- **Email**: `license@masterfabric.co` for private inquiries

### 📚 Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Guide](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io/)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

---

## 🚀 Release Process

### Version Strategy
- **Major** (1.0.0): Breaking changes
- **Minor** (1.1.0): New features (backward compatible)
- **Patch** (1.1.1): Bug fixes

### Release Schedule
- **Regular releases**: Monthly minor releases
- **Hotfixes**: As needed for critical bugs
- **Major releases**: Quarterly with breaking changes

---

## ⚖️ Legal Information

### License
This project is licensed under GNU AGPL v3.0. By contributing, you agree that your contributions will be licensed under the same terms.

### Copyright
- **Owner**: MASTERFABRIC Bilişim Teknolojileri A.Ş.
- **Maintainer**: Gürkan Fikret Günak (@gurkanfikretgunak)
- **Contributors**: All contributors retain copyright of their contributions

### Contributor License Agreement (CLA)
By submitting a pull request, you confirm that:
- You have the right to license your contribution to us
- You agree to license your contribution under GNU AGPL v3.0
- Your contribution is your original work

---

<div align="center">

## 🎉 Thank You!

**Your contributions make OSMEA better for everyone!**

[![Contributors](https://contrib.rocks/image?repo=masterfabric-mobile/osmea)](https://github.com/masterfabric-mobile/osmea/graphs/contributors)

---

**Questions? Reach out!**
- 📧 Email: `license@masterfabric.co`
- 💬 GitHub: [@gurkanfikretgunak](https://github.com/gurkanfikretgunak)
- 🌐 Website: [masterfabric.co](https://masterfabric.co)

---

**Built with ❤️ by the OSMEA Community**

[⬆ Back to Top](#contributing-to-osmea-️)

</div>
