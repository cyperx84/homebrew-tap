class RemotionClaw < Formula
  desc "Remotion video generation CLI for AI agents"
  homepage "https://github.com/cyperx84/remotion-claw"
  url "https://github.com/cyperx84/remotion-claw/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "8da3584fc75497a88a04db9b7a5f3bda1075d2a454d72405ba93f78311d78ea6"
  license "MIT"
  head "https://github.com/cyperx84/remotion-claw.git", branch: "main"

  depends_on "node"
  depends_on "ffmpeg"

  def install
    system "npm", "install", *std_npm_args
  end

  test do
    output = shell_output("#{bin}/rclaw list")
    assert_match "social-clip", output
    assert_match "announcement", output
  end
end
