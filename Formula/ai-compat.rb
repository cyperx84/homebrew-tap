class AiCompat < Formula
  desc "AI model + harness compatibility matrix — CLI and site"
  homepage "https://github.com/cyperx84/ai-compat"
  url "https://github.com/cyperx84/ai-compat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER — run: curl -sL <tarball-url> | shasum -a 256"
  license "MIT"
  head "https://github.com/cyperx84/ai-compat.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "ai-compat", shell_output("#{bin}/ai-compat --version")
  end
end
