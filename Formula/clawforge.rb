class Clawforge < Formula
  desc "Multi-mode coding workflow CLI with worktrees + tmux agent orchestration"
  homepage "https://github.com/cyperx84/clawforge"
  url "https://github.com/cyperx84/clawforge/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "1f79d36c1af0d86defc07974132801066e9652133254d66349d13d8aea4676d3"
  license "MIT"

  depends_on "bash"
  depends_on "git"
  depends_on "gh"
  depends_on "jq"
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/clawforge" => "clawforge"
  end

  test do
    assert_match "clawforge v", shell_output("#{bin}/clawforge version")
  end
end
