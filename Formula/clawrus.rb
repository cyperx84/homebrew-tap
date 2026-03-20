class Clawrus < Formula
  desc "Agent thread orchestration for OpenClaw"
  homepage "https://github.com/cyperx84/clawrus"
  url "https://github.com/cyperx84/clawrus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"
  head "https://github.com/cyperx84/clawrus.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/cyperx84/clawrus/internal/cli.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clawrus --version")
    assert_match "Usage:", shell_output("#{bin}/clawrus help")
  end
end
