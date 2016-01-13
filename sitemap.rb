require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://lacriment.com'
SitemapGenerator::Sitemap.create do
  add '/articles'
  add '/encyclopaedia'
end
SitemapGenerator::Sitemap.ping_search_engines
