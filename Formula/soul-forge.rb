class SoulForge < Formula
  desc "Agent fleet onboarding CLI for OpenClaw"
  homepage "https://github.com/cyperx84/soul-forge"
  url "https://github.com/cyperx84/soul-forge/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ebba1189fc05f9467dc24b575e34f9cc2de523a3cb2a1d2cb49341cbb55bef40"
  license "MIT"
  head "https://github.com/cyperx84/soul-forge.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/cyperx84/soul-forge/internal/config.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match "soul-forge", shell_output("#{bin}/soul-forge --help")
  end
end
