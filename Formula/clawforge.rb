class Clawforge < Formula
  desc "Forge and manage fleets of OpenClaw agents"
  homepage "https://github.com/cyperx84/clawforge"
  url "https://github.com/cyperx84/clawforge/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "bf80b71dd06f4d8e9c877be7c93d87d1f163c5b33f51df44c93719dda6399189"
  license "MIT"
  head "https://github.com/cyperx84/clawforge.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/cyperx84/clawforge/pkg/version.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clawforge version")
    assert_match "Usage:", shell_output("#{bin}/clawforge help")
  end
end
