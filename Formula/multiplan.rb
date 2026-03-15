class Multiplan < Formula
  desc "4-model parallel planning workflow with lens-based prompts and eval framework"
  homepage "https://github.com/cyperx84/multiplan"
  url "https://github.com/cyperx84/multiplan/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "630b6e7041131ee3a69d03094cfb6828cce59c5fb55bf371e5e6d107bb4a8ee4"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"multiplan"
  end

  test do
    assert_match "multiplan", shell_output("#{bin}/multiplan --version 2>&1")
  end
end
