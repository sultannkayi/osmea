# OSMEA Website

A modern, dynamic Next.js website for the OSMEA (Mobile E-commerce Architecture Framework) project. Built with component-based architecture and data-driven content management.

## 🚀 Overview

This website showcases the OSMEA framework with a clean, modern design that dynamically loads content from JSON files. The architecture promotes maintainability, scalability, and easy content management.

## 🏗️ Project Structure

```
website/
├── src/
│   ├── app/                    # Next.js App Router
│   │   ├── page.tsx           # Main homepage (uses components)
│   │   └── layout.tsx         # Root layout
│   ├── components/            # Reusable components
│   │   ├── hero-section.tsx   # Hero section component
│   │   ├── features-section.tsx # Features showcase
│   │   ├── progress-section.tsx # Project progress tracking
│   │   ├── footer-section.tsx  # Footer component
│   │   ├── github-statistics.tsx # Live GitHub stats
│   │   └── ui/                # UI components (shadcn/ui)
│   ├── data/                  # JSON data files
│   │   ├── hero.json          # Hero section content
│   │   ├── features.json      # Features data
│   │   ├── progress.json      # Progress tracking data
│   │   ├── footer.json        # Footer content
│   │   └── site-config.json   # Site configuration
│   ├── lib/                   # Utility functions
│   │   ├── data-loader.ts     # Data loading utility
│   │   └── utils.ts          # General utilities
│   └── config/               # Configuration
│       └── env.ts            # Environment variables
├── public/                   # Static assets
└── package.json             # Dependencies and scripts
```

## 🎯 Architecture

### Component-Based Design
- **Modular Components**: Each section is a separate, reusable component
- **Props-Based**: All components receive data through props
- **Type Safety**: Full TypeScript support with proper interfaces
- **Responsive Design**: Mobile-first approach with Tailwind CSS

### Data-Driven Content
- **JSON Configuration**: All content stored in JSON files
- **Dynamic Loading**: Content loaded dynamically from data files
- **Easy Updates**: Change content without touching code
- **Centralized Management**: Single source of truth for all content

### Environment Configuration
- **Environment Variables**: Configurable through environment variables
- **Fallback Values**: Default values for all configurations
- **Type-Safe Config**: Centralized configuration with TypeScript

## 📁 Key Components

### 1. Hero Section (`hero-section.tsx`)
- Displays main title, subtitle, and call-to-action
- Configurable badge, button, and content
- Responsive design with animations

### 2. Features Section (`features-section.tsx`)
- Showcases framework features with icons
- Grid layout with hover effects
- Emoji-based visual indicators

### 3. Progress Section (`progress-section.tsx`)
- Project progress tracking
- Component status grids
- Package information
- Interactive status indicators

### 4. GitHub Statistics (`github-statistics.tsx`)
- Live GitHub API integration
- Real-time repository metrics
- Error handling and loading states
- Configurable API endpoints

### 5. Footer Section (`footer-section.tsx`)
- Company information
- Resource links
- Community links
- Copyright information

## 🔧 Configuration

### Environment Variables
The project uses environment variables for configuration:

```bash
# Website Configuration
NEXT_PUBLIC_SITE_NAME=OSMEA
NEXT_PUBLIC_SITE_URL=https://osmea.masterfabric.co
NEXT_PUBLIC_SITE_DESCRIPTION=Mobile E-commerce Architecture Framework

# GitHub Configuration
NEXT_PUBLIC_GITHUB_OWNER=masterfabric-mobile
NEXT_PUBLIC_GITHUB_REPO=osmea
NEXT_PUBLIC_GITHUB_BRANCH=dev
NEXT_PUBLIC_GITHUB_URL=https://github.com/masterfabric-mobile/osmea

# API Configuration
NEXT_PUBLIC_GITHUB_API_URL=https://api.github.com/repos/masterfabric-mobile/osmea
```

### Data Files

#### `hero.json`
```json
{
  "badge": { "text": "Version 1.0.0 • Flutter Framework" },
  "title": "OSMEA",
  "subtitle": "Mobile E-commerce Architecture Framework",
  "description": "Build scalable, customizable, and cross-platform e-commerce apps...",
  "button": { "text": "View on GitHub", "href": "...", "external": true }
}
```

#### `features.json`
```json
{
  "title": "Why Choose OSMEA?",
  "description": "OSMEA is not just a framework...",
  "features": [
    {
      "id": "platform-agnostic",
      "emoji": "🔥",
      "title": "Platform Agnostic",
      "description": "Connects with Shopify, WooCommerce..."
    }
  ]
}
```

#### `progress.json`
```json
{
  "title": "Project Progress",
  "overallProgress": 75,
  "progressCards": [...],
  "coreComponents": {...},
  "layoutUtilities": {...},
  "packages": {...}
}
```

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ 
- npm or yarn

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/masterfabric-mobile/osmea.git
cd osmea/website
```

2. **Install dependencies**
```bash
npm install
# or
yarn install
```

3. **Set up environment variables**
```bash
cp .env.example .env.local
# Edit .env.local with your values
```

4. **Start development server**
```bash
npm run dev
# or
yarn dev
```

5. **Open in browser**
```
http://localhost:3000
```

## 🛠️ Development

### Available Scripts

```bash
# Development server
npm run dev

# Build for production
npm run build

# Start production server
npm start

# Lint code
npm run lint

# Type checking
npm run type-check
```

### Adding New Content

1. **Update JSON files** in `src/data/`
2. **Components automatically reflect changes**
3. **No code changes required for content updates**

### Adding New Components

1. **Create component** in `src/components/`
2. **Add TypeScript interfaces** for props
3. **Update data loader** if needed
4. **Import and use** in `page.tsx`

### Customizing Styles

- **Tailwind CSS**: Used for all styling
- **Component-specific styles**: Defined within components
- **Global styles**: In `globals.css`
- **Theme configuration**: In `tailwind.config.js`

## 🔄 Data Flow

```
JSON Data Files → Data Loader → Components → UI
```

1. **JSON files** contain all content
2. **Data loader** imports and types data
3. **Components** receive data as props
4. **UI** renders based on data

## 📱 Responsive Design

- **Mobile-first approach**
- **Breakpoint system**: sm, md, lg, xl
- **Flexible layouts**: Grid and Flexbox
- **Optimized images**: Next.js Image component

## 🔍 SEO & Performance

- **Static generation**: Pre-built at build time
- **Optimized images**: Automatic optimization
- **Meta tags**: Configurable SEO metadata
- **Performance monitoring**: Web Vitals tracking

## 🤝 Contributing

1. **Fork the repository**
2. **Create feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit changes** (`git commit -m 'Add amazing feature'`)
4. **Push to branch** (`git push origin feature/amazing-feature`)
5. **Open Pull Request**

## 📄 License

This project is licensed under the GNU AGPL v3.0 License - see the [LICENSE](../LICENSE) file for details.

## 🔗 Related Projects

- [OSMEA Core](../packages/core) - Foundation package
- [OSMEA Components](../packages/components) - UI component library
- [OSMEA APIs](../packages/apis) - API integration package

## 📞 Support

- **GitHub Issues**: [Report bugs](https://github.com/masterfabric-mobile/osmea/issues)
- **Documentation**: [View docs](https://github.com/masterfabric-mobile/osmea)
- **Community**: [Join discussions](https://github.com/masterfabric-mobile/osmea/discussions)

---

**Built with ❤️ by the OSMEA Engineering Team**
