class Clawforge < Formula
  desc "Multi-mode coding workflow CLI for orchestrating AI coding agents"
  homepage "https://github.com/cyperx84/clawforge"
  url "https://github.com/cyperx84/clawforge/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "9f97f07af265aa2709836326355b4a76ea3ed5732c65ba8cf8d2f96966853a5c"
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
