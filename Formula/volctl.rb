class Volctl < Formula
  desc "Commandline tool to get or set volume levels on macOS"
  homepage "https://github.com/luckman212/volctl"
  url "https://github.com/luckman212/volctl/archive/refs/tags/1.2.1.tar.gz"
  sha256 "a863eef84d5214b91736e0acb35be2b9e3424c271ed97f4e8fcbd417076242c6"
  license ""

  depends_on "ruby"

  deny_network_access!

  def fetch
    ENV["BUNDLE_PATH"] = ".bundle"

    system "bundle", "cache", "--no-install"
  end

  def install
    ENV["GEM_HOME"] = libexec

    system "bundle", "install", "--local"
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "--ignore-dependencies", "#{name}-#{version}.gem"

    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system bin/"volctl" "-v"
  end
end
