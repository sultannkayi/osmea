'use client';

import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Github, ExternalLink } from "lucide-react";

interface FooterLink {
  text: string;
  url: string;
  external: boolean;
}

interface FooterData {
  company: {
    name: string;
    description: string;
  };
  resources: {
    title: string;
    links: FooterLink[];
  };
  community: {
    title: string;
    button: {
      text: string;
      url: string;
      icon: string;
      variant: string;
      external: boolean;
    };
  };
  copyright: {
    year: string;
    company: {
      name: string;
      url: string;
    };
    maintainer: string;
    license: {
      name: string;
      url: string;
    };
  };
}

interface FooterSectionProps {
  data: FooterData;
}

export default function FooterSection({ data }: FooterSectionProps) {
  return (
    <footer className="py-12 px-4 bg-gray-900 text-white">
      <div className="container mx-auto max-w-6xl">
        <div className="grid md:grid-cols-3 gap-8 mb-8">
          <div>
            <h3 className="text-2xl font-bold mb-4">{data.company.name}</h3>
            <p className="text-gray-400">
              {data.company.description}
            </p>
          </div>
          
          <div>
            <h4 className="text-lg font-semibold mb-4">{data.resources.title}</h4>
            <ul className="space-y-2 text-gray-400">
              {data.resources.links.map((link, index) => (
                <li key={index}>
                  <Link 
                    href={link.url} 
                    className="hover:text-white transition-colors" 
                    target={link.external ? "_blank" : undefined}
                  >
                    {link.text}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
          
          <div>
            <h4 className="text-lg font-semibold mb-4">{data.community.title}</h4>
            <div className="space-y-4">
              <Button 
                asChild 
                variant="outline" 
                className="w-full bg-transparent border-gray-600 text-white hover:bg-gray-800"
              >
                <Link 
                  href={data.community.button.url} 
                  target={data.community.button.external ? "_blank" : undefined}
                  className="flex items-center gap-2"
                >
                  <Github className="w-5 h-5" />
                  {data.community.button.text}
                  {data.community.button.external && <ExternalLink className="w-4 h-4" />}
                </Link>
              </Button>
            </div>
          </div>
        </div>
        
        <div className="border-t border-gray-800 pt-8 text-center text-gray-400">
          <p>
            © {data.copyright.year}{' '}
            <Link 
              href={data.copyright.company.url} 
              target="_blank" 
              className="hover:text-white transition-colors"
            >
              {data.copyright.company.name}
            </Link>
            {' '}• Maintained by the {data.copyright.maintainer}
          </p>
          <p className="mt-2">
            Licensed under{' '}
            <Link 
              href={data.copyright.license.url} 
              target="_blank" 
              className="hover:text-white transition-colors"
            >
              {data.copyright.license.name}
            </Link>
          </p>
        </div>
      </div>
    </footer>
  );
} 