# Reference
# ---------
# 1. https://github.com/Homebrew/homebrew/blob/master/Library/Contributions/example-formula.rb
# 2. https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md#formula-cookbook

class Oswitch < Formula
	desc 'Provides a "virtual environment" around your data to work with a range of Bioinformatics tools'
  homepage 'https://github.com/yeban/oswitch'

  url  'https://github.com/yeban/oswitch/archive/v0.2.6.tar.gz'
  sha256 'af3ce13305be8747242dc11bdd35360b568ea738be8c490d448915d4c675871f'

  def install
    # Build gem and install to prefix.
    system "gem", "build", "oswitch.gemspec"
		system "gem", "install", "-i", "#{prefix}", "oswitch-#{version}.gem"

    # Re-write RubyGem generated bin stub to load oswitch from prefix.
    inreplace "#{bin}/oswitch" do |s|
      s.gsub!(/require 'rubygems'/,
              "ENV['GEM_HOME']='#{prefix}'\nrequire 'rubygems'")
    end
  end
end
