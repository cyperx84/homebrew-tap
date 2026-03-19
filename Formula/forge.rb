class Forge < Formula
  desc "Voice corpus management and style extraction CLI"
  homepage "https://github.com/cyperx84/voice-forge"
  url "https://github.com/cyperx84/voice-forge/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "801aeee498964909569cd9f0f7c1d369c22b4869188ed3a2d39574301cdca51f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"forge"
  end

  test do
    assert_match "Voice Forge", shell_output("#{bin}/forge --help 2>&1")
  end
end
