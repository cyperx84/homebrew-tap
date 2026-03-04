class Clawforge < Formula
  desc "Multi-mode coding workflow CLI for orchestrating AI coding agents"
  homepage "https://github.com/cyperx84/clawforge"
  url "https://github.com/cyperx84/clawforge/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "27cca187828366d138dbde81f99f313e065c656be7073452ccc016eb5dba16db"
  license "MIT"
  head "https://github.com/cyperx84/clawforge.git", branch: "main"

  depends_on "bash"
  depends_on "git"
  depends_on "gh"
  depends_on "jq"
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/clawforge" => "clawforge"
    if File.exist?("bin/clawforge-dashboard")
      bin.install "bin/clawforge-dashboard"
    end
  end

  test do
    assert_match "clawforge v", shell_output("#{bin}/clawforge version")
    assert_match "Usage:", shell_output("#{bin}/clawforge help")
  end
end
