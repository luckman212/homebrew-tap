class Volctl < Formula
  desc "Command-line tool to get or set volume levels on macOS"
  homepage "https://github.com/luckman212/volctl"
  url "https://github.com/luckman212/volctl/archive/refs/tags/1.2.1.tar.gz"
  sha256 "a863eef84d5214b91736e0acb35be2b9e3424c271ed97f4e8fcbd417076242c6"

  depends_on :macos
  uses_from_macos "swift" => :build

  def install
    system "swiftc", "-O", "-o", "volctl", "volctl.swift"
    bin.install "volctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/volctl --version")
  end
end
