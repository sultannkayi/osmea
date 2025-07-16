'use client';

import { Badge } from "@/components/ui/badge";

interface Feature {
  id: string;
  emoji: string;
  title: string;
  description: string;
}

interface FeaturesData {
  title: string;
  description: string;
  features: Feature[];
}

interface FeaturesSectionProps {
  data: FeaturesData;
}

export default function FeaturesSection({ data }: FeaturesSectionProps) {
  return (
    <section className="py-20 px-4 bg-white">
      <div className="container mx-auto max-w-6xl">
        <div className="text-center space-y-4 mb-16">
          <h2 className="text-4xl font-bold text-gray-900">{data.title}</h2>
          <p className="text-xl text-gray-600 max-w-3xl mx-auto">
            {data.description}
          </p>
        </div>
        
        <div className="flex flex-wrap justify-center gap-4">
          {data.features.map((feature) => (
            <div 
              key={feature.id}
              className="flex flex-col items-center gap-3 bg-gray-50 border border-gray-200 rounded-lg px-6 py-4 hover:bg-gray-100 transition-colors"
            >
              <div className="text-2xl">{feature.emoji}</div>
              <Badge variant="outline" className="font-semibold">
                {feature.title}
              </Badge>
              <p className="text-sm text-gray-600 text-center max-w-48">
                {feature.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
} 