class Clawforge < Formula
  desc "Multi-mode coding workflow CLI with worktrees + tmux agent orchestration"
  homepage "https://github.com/cyperx84/clawforge"
  url "https://github.com/cyperx84/clawforge/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "cf4d72233db7111ce4634cc866c918107673e9cebc14f5150173555db6b5dea1"
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
