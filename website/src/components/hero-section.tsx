'use client';

import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Github, ExternalLink } from "lucide-react";

interface HeroData {
  badge: {
    text: string;
    variant: string;
  };
  title: string;
  subtitle: string;
  description: string;
  button: {
    text: string;
    href: string;
    variant: string;
    size: string;
    icon: string;
    external: boolean;
  };
}

interface HeroSectionProps {
  data: HeroData;
}

export default function HeroSection({ data }: HeroSectionProps) {
  return (
    <section className="relative py-20 px-4 text-center bg-gradient-to-b from-gray-50 to-white">
      <div className="container mx-auto max-w-6xl">
        <div className="space-y-8 animate-fade-in">
          <div className="space-y-4">
            <Badge variant="outline" className="mb-4">
              {data.badge.text}
            </Badge>
            <h1 className="text-5xl md:text-7xl font-bold tracking-tight text-gray-900">
              {data.title}
            </h1>
            <p className="text-xl md:text-2xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
              {data.subtitle}
            </p>
            <p className="text-lg text-gray-500 max-w-4xl mx-auto">
              {data.description}
            </p>
          </div>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center">
            <Button variant="outline" size="lg" asChild>
              <Link 
                href={data.button.href} 
                target={data.button.external ? "_blank" : undefined}
                className="flex items-center gap-2"
              >
                <Github className="w-5 h-5" />
                {data.button.text}
                {data.button.external && <ExternalLink className="w-4 h-4" />}
              </Link>
            </Button>
          </div>
        </div>
      </div>
    </section>
  );
} 