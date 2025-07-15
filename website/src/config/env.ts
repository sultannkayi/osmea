export const env = {
  // Website Configuration
  SITE_NAME: process.env.NEXT_PUBLIC_SITE_NAME || 'OSMEA',
  SITE_URL: process.env.NEXT_PUBLIC_SITE_URL || 'https://osmea.masterfabric.co',
  SITE_DESCRIPTION: process.env.NEXT_PUBLIC_SITE_DESCRIPTION || 'Mobile E-commerce Architecture Framework built with Flutter for the future of cross-platform development.',

  // GitHub Configuration
  GITHUB_OWNER: process.env.NEXT_PUBLIC_GITHUB_OWNER || 'masterfabric-mobile',
  GITHUB_REPO: process.env.NEXT_PUBLIC_GITHUB_REPO || 'osmea',
  GITHUB_BRANCH: process.env.NEXT_PUBLIC_GITHUB_BRANCH || 'dev',
  GITHUB_URL: process.env.NEXT_PUBLIC_GITHUB_URL || 'https://github.com/masterfabric-mobile/osmea',

  // API Configuration
  GITHUB_API_URL: process.env.NEXT_PUBLIC_GITHUB_API_URL || 'https://api.github.com/repos/masterfabric-mobile/osmea',

  // Theme Configuration
  THEME_PRIMARY_COLOR: process.env.NEXT_PUBLIC_THEME_PRIMARY_COLOR || '#000000',
  THEME_SECONDARY_COLOR: process.env.NEXT_PUBLIC_THEME_SECONDARY_COLOR || '#ffffff',
  THEME_ACCENT_COLOR: process.env.NEXT_PUBLIC_THEME_ACCENT_COLOR || '#4a90e2',

  // Build Configuration
  NODE_ENV: process.env.NODE_ENV || 'development',
} as const; 