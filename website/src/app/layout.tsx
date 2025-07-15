import type { Metadata } from "next";
import Script from "next/script";

export const metadata: Metadata = {
  title: "OSMEA - Mobile E-commerce Architecture Framework",
  description: "Build scalable, customizable, and cross-platform e-commerce apps using Flutter. Designed for integration with Shopify, WooCommerce, or custom APIs.",
  keywords: ["Flutter", "E-commerce", "Mobile Development", "Shopify", "WooCommerce", "Cross-platform", "API"],
  authors: [{ name: "OSMEA Team" }],
  creator: "MasterFabric Mobile",
  publisher: "OSMEA Engineering Team",
  robots: "index, follow",
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://osmea.masterfabric.co",
    title: "OSMEA - Mobile E-commerce Architecture Framework",
    description: "Build scalable, customizable, and cross-platform e-commerce apps using Flutter.",
    siteName: "OSMEA",
    images: [
      {
        url: "https://github.com/masterfabric-mobile/osmea/blob/dev/docs/assets/osmea_banner_v1.png?raw=true",
        width: 1200,
        height: 630,
        alt: "OSMEA - Mobile E-commerce Framework",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "OSMEA - Mobile E-commerce Architecture Framework",
    description: "Build scalable, customizable, and cross-platform e-commerce apps using Flutter.",
    images: ["https://github.com/masterfabric-mobile/osmea/blob/dev/docs/assets/osmea_banner_v1.png?raw=true"],
  },
  verification: {
    google: "your-google-verification-code",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <head>
        <link rel="canonical" href="https://osmea.masterfabric.co" />
        <meta name="theme-color" content="#ffffff" />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "SoftwareApplication",
              "name": "OSMEA",
              "applicationCategory": "DeveloperApplication",
              "operatingSystem": "iOS, Android",
              "description": "Mobile E-commerce Architecture Framework built with Flutter",
              "url": "https://osmea.masterfabric.co",
              "author": {
                "@type": "Organization",
                "name": "MasterFabric Mobile"
              }
            })
          }}
        />
        <style>{`
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', sans-serif;
            background-color: #ffffff;
            color: #000000;
            line-height: 1.6;
          }
          
          /* Critical CSS to prevent FOUC */
          .page-container {
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
          }
          
          .page-container.loaded {
            opacity: 1;
          }
          
          /* Loading spinner */
          .loading-spinner {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
          }
          
          .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid #f3f4f6;
            border-top: 4px solid #374151;
            border-radius: 50%;
            animation: spin 1s linear infinite;
          }
          
          @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
          }
          
          /* Basic utility classes to prevent layout shift */
          .flex { display: flex; }
          .justify-center { justify-content: center; }
          .items-center { align-items: center; }
          .text-center { text-align: center; }
          .min-h-screen { min-height: 100vh; }
          .bg-white { background-color: #ffffff; }
          .text-gray-900 { color: #111827; }
          .font-bold { font-weight: 700; }
          .py-20 { padding-top: 5rem; padding-bottom: 5rem; }
          .px-4 { padding-left: 1rem; padding-right: 1rem; }
          .container { width: 100%; margin-left: auto; margin-right: auto; }
          .mx-auto { margin-left: auto; margin-right: auto; }
          .max-w-6xl { max-width: 72rem; }
          .space-y-8 > * + * { margin-top: 2rem; }
          .space-y-4 > * + * { margin-top: 1rem; }
        `}</style>
      </head>
      <body className="font-sans">
        <div id="loading-screen" className="loading-spinner">
          <div className="spinner"></div>
        </div>
        
        <div id="page-content" className="page-container">
          {children}
        </div>

        <Script src="https://cdn.tailwindcss.com" strategy="beforeInteractive" />
        
        <script dangerouslySetInnerHTML={{
          __html: `
            // Wait for DOM and Tailwind CSS to load
            function initializeApp() {
              const loadingScreen = document.getElementById('loading-screen');
              const pageContent = document.getElementById('page-content');
              
              if (loadingScreen && pageContent) {
                loadingScreen.style.display = 'none';
                pageContent.classList.add('loaded');
              }
            }
            
            // Check if Tailwind is loaded by testing a class
            function checkTailwindLoaded() {
              const testElement = document.createElement('div');
              testElement.className = 'hidden';
              document.body.appendChild(testElement);
              
              const isHidden = window.getComputedStyle(testElement).display === 'none';
              document.body.removeChild(testElement);
              
              if (isHidden) {
                initializeApp();
              } else {
                // Retry after 100ms
                setTimeout(checkTailwindLoaded, 100);
              }
            }
            
            // Start checking when DOM is ready
            if (document.readyState === 'loading') {
              document.addEventListener('DOMContentLoaded', checkTailwindLoaded);
            } else {
              checkTailwindLoaded();
            }
            
            // Fallback: Initialize after 2 seconds regardless
            setTimeout(initializeApp, 2000);
          `
        }} />
      </body>
    </html>
  );
}
