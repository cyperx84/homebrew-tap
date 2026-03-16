class Lattice < Formula
  desc "Mental models reasoning engine — Charlie Munger's latticework of 98 cognitive frameworks"
  homepage "https://github.com/cyperx84/lattice"
  url "https://github.com/cyperx84/lattice/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e27deca7d09a5c1c3adbcb1f82b4affee2aea07602a57c2e2495047daa6d5939"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"lattice"
  end

  test do
    assert_match "lattice", shell_output("#{bin}/lattice --version 2>&1")
    assert_match "98", shell_output("#{bin}/lattice list 2>&1")
  end
end
