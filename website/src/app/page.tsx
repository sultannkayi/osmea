import HeroSection from '@/components/hero-section';
import FeaturesSection from '@/components/features-section';
import ProgressSection from '@/components/progress-section';
import FooterSection from '@/components/footer-section';
import GitHubStatistics from '@/components/github-statistics';
import RulesClaimsSection from '@/components/rules-claims-section';
import { data } from '@/lib/data-loader';

export default function Home() {
  return (
    <div className="min-h-screen bg-white">
      <HeroSection data={data.hero} />
      <GitHubStatistics config={data.siteConfig} />
      <RulesClaimsSection />
      <FeaturesSection data={data.features} />
      <ProgressSection data={data.progress} />
      <FooterSection data={data.footer} />
    </div>
  );
}
