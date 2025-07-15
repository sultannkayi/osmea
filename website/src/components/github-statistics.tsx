'use client';

import { useEffect, useState } from "react";
import { Star, GitPullRequest, GitCommit, Users, AlertCircle } from "lucide-react";

interface GitHubStats {
  stars: number;
  issues: number;
  pullRequests: number;
  commits: number;
  contributors: number;
}

interface SiteConfig {
  github: {
    owner: string;
    repo: string;
    branch: string;
    url: string;
  };
  api: {
    github: string;
  };
}

interface GitHubStatisticsProps {
  config: SiteConfig;
}

export default function GitHubStatistics({ config }: GitHubStatisticsProps) {
  const [stats, setStats] = useState<GitHubStats | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchGitHubStats = async (retryCount = 0) => {
      try {
        setError(null);
        // Fetch repository info first - this is the most reliable
        const repoResponse = await fetch(`${config.api.github}`);
        if (!repoResponse.ok) {
          throw new Error(`HTTP error! status: ${repoResponse.status}`);
        }
        const repoData = await repoResponse.json();

        // Initialize stats with repo data
        const stats = {
          stars: repoData.stargazers_count || 0,
          issues: repoData.open_issues_count || 0,
          pullRequests: 0,
          commits: 0,
          contributors: 0,
        };

        // Fetch contributors (more reliable than stats/contributors)
        try {
          const contributorsResponse = await fetch(`${config.api.github}/contributors?per_page=100`);
          if (contributorsResponse.ok) {
            const contributorsData = await contributorsResponse.json();
            if (Array.isArray(contributorsData)) {
              stats.contributors = contributorsData.length;
              // Sum up contributions from all contributors for total commits
              stats.commits = contributorsData.reduce((total, contributor) => total + (contributor.contributions || 0), 0);
            }
          }
        } catch (error) {
          console.warn('Failed to fetch contributors:', error);
        }

        // Fetch pull requests (both open and closed for total count)
        try {
          // First try to get all PRs (closed + open)
          const [openPRsResponse, closedPRsResponse] = await Promise.all([
            fetch(`${config.api.github}/pulls?state=open&per_page=100`),
            fetch(`${config.api.github}/pulls?state=closed&per_page=100`)
          ]);

          let totalPRs = 0;
          
          if (openPRsResponse.ok) {
            const openPRs = await openPRsResponse.json();
            if (Array.isArray(openPRs)) {
              totalPRs += openPRs.length;
            }
          }
          
          if (closedPRsResponse.ok) {
            const closedPRs = await closedPRsResponse.json();
            if (Array.isArray(closedPRs)) {
              totalPRs += closedPRs.length;
            }
          }

          stats.pullRequests = totalPRs;
        } catch (error) {
          console.warn('Failed to fetch pull requests:', error);
          // Fallback to open PRs only if total fails
          try {
            const openPRsResponse = await fetch(`${config.api.github}/pulls?state=open&per_page=100`);
            if (openPRsResponse.ok) {
              const openPRs = await openPRsResponse.json();
              if (Array.isArray(openPRs)) {
                stats.pullRequests = openPRs.length;
              }
            }
          } catch (fallbackError) {
            console.warn('Failed to fetch open pull requests:', fallbackError);
          }
        }

        // Alternative commits fallback using repo default branch
        if (stats.commits === 0) {
          try {
            const commitsResponse = await fetch(`${config.api.github}/commits?per_page=1`);
            if (commitsResponse.ok) {
              const linkHeader = commitsResponse.headers.get('Link');
              if (linkHeader) {
                const match = linkHeader.match(/&page=(\d+)>; rel="last"/);
                if (match) {
                  stats.commits = parseInt(match[1], 10);
                }
              }
            }
          } catch (error) {
            console.warn('Failed to fetch commits count:', error);
          }
        }

        setStats(stats);
      } catch (error) {
        console.error('Error fetching GitHub stats:', error);
        
        // Retry logic - try up to 2 times
        if (retryCount < 2) {
          console.log(`Retrying GitHub stats fetch... (${retryCount + 1}/2)`);
          setTimeout(() => fetchGitHubStats(retryCount + 1), 1000 * (retryCount + 1));
          return;
        }
        
        // Set error state and default values if all retries failed
        setError('Failed to load GitHub statistics. Please try again later.');
        setStats({
          stars: 0,
          issues: 0,
          pullRequests: 0,
          commits: 0,
          contributors: 0,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchGitHubStats();
  }, [config.api.github]);

  if (loading) {
    return (
      <section className="py-12 px-4 bg-white">
        <div className="container mx-auto max-w-6xl">
          <div className="text-center space-y-4 mb-8">
            <h2 className="text-3xl font-bold text-gray-900">GitHub Statistics</h2>
            <p className="text-lg text-gray-600">Loading repository statistics...</p>
          </div>
          <div className="flex justify-center">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900"></div>
          </div>
        </div>
      </section>
    );
  }

  return (
    <section className="py-12 px-4 bg-white">
      <div className="container mx-auto max-w-6xl">
        <div className="text-center space-y-4 mb-8">
          <h2 className="text-3xl font-bold text-gray-900">GitHub Statistics</h2>
          <p className="text-lg text-gray-600">Live repository metrics</p>
          {error && (
            <div className="bg-red-50 border border-red-200 rounded-lg p-4 max-w-md mx-auto">
              <p className="text-red-600 text-sm">{error}</p>
            </div>
          )}
        </div>
        
        <div className="flex flex-wrap justify-center gap-4">
          <div className="flex items-center gap-2 bg-yellow-50 border border-yellow-200 rounded-full px-4 py-2 hover:bg-yellow-100 transition-colors">
            <Star className="w-4 h-4 text-yellow-600" />
            <span className="font-semibold text-yellow-800">{stats?.stars}</span>
            <span className="text-yellow-700 text-sm">Stars</span>
          </div>

          <div className="flex items-center gap-2 bg-green-50 border border-green-200 rounded-full px-4 py-2 hover:bg-green-100 transition-colors">
            <GitPullRequest className="w-4 h-4 text-green-600" />
            <span className="font-semibold text-green-800">{stats?.pullRequests}</span>
            <span className="text-green-700 text-sm">Pull Requests</span>
          </div>

          <div className="flex items-center gap-2 bg-blue-50 border border-blue-200 rounded-full px-4 py-2 hover:bg-blue-100 transition-colors">
            <GitCommit className="w-4 h-4 text-blue-600" />
            <span className="font-semibold text-blue-800">{stats?.commits}</span>
            <span className="text-blue-700 text-sm">Commits</span>
          </div>

          <div className="flex items-center gap-2 bg-purple-50 border border-purple-200 rounded-full px-4 py-2 hover:bg-purple-100 transition-colors">
            <Users className="w-4 h-4 text-purple-600" />
            <span className="font-semibold text-purple-800">{stats?.contributors}</span>
            <span className="text-purple-700 text-sm">Contributors</span>
          </div>

          <div className="flex items-center gap-2 bg-red-50 border border-red-200 rounded-full px-4 py-2 hover:bg-red-100 transition-colors">
            <AlertCircle className="w-4 h-4 text-red-600" />
            <span className="font-semibold text-red-800">{stats?.issues}</span>
            <span className="text-red-700 text-sm">Open Issues</span>
          </div>
        </div>
      </div>
    </section>
  );
} 