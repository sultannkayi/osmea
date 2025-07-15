'use client';

import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Github, ExternalLink, CheckCircle, Circle, Clock } from "lucide-react";

interface ProgressCard {
  id: string;
  title: string;
  emoji: string;
  description: string;
  status: string;
  badgeText: string;
  badgeVariant: string;
}

interface Component {
  name: string;
  status: string;
}

interface StatusDefinition {
  status: string;
  title: string;
  description: string;
  color: string;
}

interface Package {
  id: string;
  emoji: string;
  title: string;
  description: string;
  status: string;
  badgeVariant: string;
  githubUrl: string;
}

interface ProgressData {
  title: string;
  overallProgress: number;
  progressCards: ProgressCard[];
  coreComponents: {
    title: string;
    components: Component[];
  };
  layoutUtilities: {
    title: string;
    components: Component[];
  };
  statusDefinitions: {
    title: string;
    definitions: StatusDefinition[];
  };
  packages: {
    title: string;
    packages: Package[];
  };
}

interface ProgressSectionProps {
  data: ProgressData;
}

function StatusIcon({ status }: { status: string }) {
  switch (status) {
    case "completed":
      return <CheckCircle className="w-4 h-4 text-green-500" />;
    case "in-progress":
      return <Clock className="w-4 h-4 text-yellow-500" />;
    case "not-started":
      return <Circle className="w-4 h-4 text-gray-400" />;
    default:
      return <Circle className="w-4 h-4 text-gray-400" />;
  }
}

function ComponentGrid({ components }: { components: Component[] }) {
  return (
    <div className="grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-3">
      {components.map((component) => (
        <div 
          key={component.name} 
          className="flex items-center justify-between p-3 bg-white rounded-lg border hover:shadow-sm transition-shadow"
        >
          <span className="font-medium text-sm">{component.name}</span>
          <StatusIcon status={component.status} />
        </div>
      ))}
    </div>
  );
}

export default function ProgressSection({ data }: ProgressSectionProps) {
  return (
    <section className="py-20 px-4 bg-gray-50">
      <div className="container mx-auto max-w-6xl">
        <div className="text-center space-y-4 mb-16">
          <h2 className="text-4xl font-bold text-gray-900">{data.title}</h2>
          <p className="text-xl text-gray-600">
            Overall Progress: <strong>{data.overallProgress}%</strong> Complete
          </p>
        </div>
        
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          {data.progressCards.map((card) => (
            <Card key={card.id} className="text-center">
              <CardHeader>
                <CardTitle className="text-lg">{card.title}</CardTitle>
                <div className="text-3xl font-bold text-green-600">{card.emoji}</div>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-gray-600">{card.description}</p>
                <Badge variant={card.badgeVariant as "default" | "secondary" | "destructive" | "outline" | "success" | "warning"} className="mt-2">
                  {card.badgeText}
                </Badge>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Core Components Status */}
        <div className="mt-16">
          <h3 className="text-2xl font-bold text-center mb-8">
            {data.coreComponents.title}
          </h3>
          <ComponentGrid components={data.coreComponents.components} />
          
          {/* Status Legend */}
          <div className="mt-8 flex justify-center gap-8">
            <div className="flex items-center gap-2">
              <CheckCircle className="w-4 h-4 text-green-500" />
              <span className="text-sm text-gray-600">Completed</span>
            </div>
            <div className="flex items-center gap-2">
              <Clock className="w-4 h-4 text-yellow-500" />
              <span className="text-sm text-gray-600">In Progress</span>
            </div>
            <div className="flex items-center gap-2">
              <Circle className="w-4 h-4 text-gray-400" />
              <span className="text-sm text-gray-600">Not Started</span>
            </div>
          </div>

          {/* Layout Utilities Section */}
          <div className="mt-16">
            <h3 className="text-2xl font-bold text-center mb-8">
              {data.layoutUtilities.title}
            </h3>
            <ComponentGrid components={data.layoutUtilities.components} />

            {/* Status Descriptions */}
            <div className="mt-8 bg-gray-50 rounded-lg p-6">
              <h4 className="text-lg font-semibold mb-4 text-center">
                {data.statusDefinitions.title}
              </h4>
              <div className="grid md:grid-cols-3 gap-4">
                {data.statusDefinitions.definitions.map((definition) => (
                  <div key={definition.status} className="flex items-start gap-3">
                    <StatusIcon status={definition.status} />
                    <div>
                      <span className={`font-medium text-${definition.color}-700`}>
                        {definition.title}
                      </span>
                      <p className="text-sm text-gray-600 mt-1">
                        {definition.description}
                      </p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Packages Section */}
          <div className="mt-16">
            <h3 className="text-2xl font-bold text-center mb-8">
              {data.packages.title}
            </h3>
            <div className="grid md:grid-cols-3 gap-6">
              {data.packages.packages.map((pkg) => (
                <Card key={pkg.id} className="text-center">
                  <CardHeader>
                    <div className="text-4xl mb-4">{pkg.emoji}</div>
                    <CardTitle className="text-xl">{pkg.title}</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="text-sm text-gray-600 mb-4">
                      {pkg.description}
                    </p>
                    <div className="space-y-2">
                      <Badge variant={pkg.badgeVariant as "default" | "secondary" | "destructive" | "outline" | "success" | "warning"}>
                        {pkg.status}
                      </Badge>
                      <div>
                        <Button variant="outline" size="sm" asChild>
                          <Link 
                            href={pkg.githubUrl} 
                            target="_blank" 
                            className="flex items-center gap-2"
                          >
                            <Github className="w-3 h-3" />
                            View Source
                            <ExternalLink className="w-3 h-3" />
                          </Link>
                        </Button>
                      </div>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
} 