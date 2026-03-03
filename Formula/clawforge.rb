class Clawforge < Formula
  desc "Multi-mode coding workflow CLI with worktrees + tmux agent orchestration"
  homepage "https://github.com/cyperx84/clawforge"
  url "https://github.com/cyperx84/clawforge/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "7ee925af6da5792628d2fc1c8d74860ef7f470e3f5308e3dcab860bf85fe4daf"
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
