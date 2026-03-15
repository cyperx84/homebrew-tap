class ContentBreakdown < Formula
  desc "AI-powered content breakdown CLI — YouTube, articles, local files to structured notes"
  homepage "https://github.com/cyperx84/content-breakdown"
  url "https://github.com/cyperx84/content-breakdown/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER — run: curl -sL <tarball-url> | shasum -a 256"
  license "MIT"
  head "https://github.com/cyperx84/content-breakdown.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "breakdown", shell_output("#{bin}/breakdown --version")
  end
end
