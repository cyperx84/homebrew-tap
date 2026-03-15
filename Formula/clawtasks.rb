class Clawtasks < Formula
  desc "CLI-first task management for humans + AI agents"
  homepage "https://github.com/cyperx84/clawtasks"
  url "https://github.com/cyperx84/clawtasks/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER — run: curl -sL <tarball-url> | shasum -a 256"
  license "MIT"
  head "https://github.com/cyperx84/clawtasks.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "clawtasks", shell_output("#{bin}/clawtasks --version")
  end
end
