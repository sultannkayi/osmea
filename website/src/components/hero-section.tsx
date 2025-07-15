'use client';

import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Github, ExternalLink, Star } from "lucide-react";
import { HeroData } from "@/lib/data-loader";

interface HeroSectionProps {
  data: HeroData;
}

export default function HeroSection({ data }: HeroSectionProps) {
  // Validate required data exists
  if (!data) {
    console.error('Hero data is missing');
    return null;
  }

  const {
    badge,
    technologies = [],
    title,
    subtitle,
    description,
    button
  } = data;

  return (
    <section className="relative py-20 px-4 text-center bg-gradient-to-b from-gray-50 to-white">
      <div className="container mx-auto max-w-6xl">
        <div className="space-y-8 animate-fade-in">
          <div className="space-y-4">
            {badge && (
              <Badge variant="outline" className="mb-4">
                {badge.text}
              </Badge>
            )}
            
            {/* Technology Badges */}
            {technologies.length > 0 && (
              <div className="flex flex-wrap justify-center gap-2 mb-6">
                {technologies.map((tech) => (
                  <Badge 
                    key={tech.name}
                    variant="outline" 
                    className={`${tech.color} hover:scale-105 transition-all duration-300 animate-pulse hover:animate-none`}
                  >
                    {tech.icon && <span className="mr-1">{tech.icon}</span>}
                    {tech.name}
                  </Badge>
                ))}
              </div>
            )}
            
            {title && (
              <h1 className="text-5xl md:text-7xl font-bold tracking-tight text-gray-900">
                {title}
              </h1>
            )}
            
            {subtitle && (
              <p className="text-xl md:text-2xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
                {subtitle}
              </p>
            )}
            
            {description && (
              <p className="text-lg text-gray-500 max-w-4xl mx-auto">
                {description}
              </p>
            )}
          </div>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center">
            <Button variant="default" size="lg" asChild>
              <Link 
                href="https://github.com/masterfabric-mobile/osmea" 
                target="_blank"
                className="flex items-center gap-2"
              >
                <Star className="w-5 h-5" />
                Star on GitHub
                <ExternalLink className="w-4 h-4" />
              </Link>
            </Button>
            
            {button && (
              <Button variant="outline" size="lg" asChild>
                <Link 
                  href={button.href} 
                  target={button.external ? "_blank" : undefined}
                  className="flex items-center gap-2"
                >
                  <Github className="w-5 h-5" />
                  {button.text}
                  {button.external && <ExternalLink className="w-4 h-4" />}
                </Link>
              </Button>
            )}
          </div>
        </div>
      </div>
    </section>
  );
} 