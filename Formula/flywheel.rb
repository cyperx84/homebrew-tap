class Flywheel < Formula
  desc "Sync agent learnings to Obsidian vault with semantic matching"
  homepage "https://github.com/cyperx84/flywheel"
  url "https://github.com/cyperx84/flywheel/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7dd5e3704ae0d8dfb1433b6f0e191dc08e65f32d8de5bfb032283c73806c44e5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"flywheel", "./cmd/flywheel"
  end

  test do
    assert_match "flywheel", shell_output("#{bin}/flywheel --help 2>&1")
  end
end
