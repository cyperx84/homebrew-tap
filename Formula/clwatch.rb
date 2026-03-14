class Clwatch < Formula
  desc "Track coding tool updates from changelogs.info"
  homepage "https://github.com/cyperx84/clwatch"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cyperx84/clwatch/releases/download/v#{version}/clwatch-#{version}-darwin-arm64.tar.gz"
      sha256 "77a6b28a68442fd3028b7f57026ed87e293ad1797db49dc8c60e7157e125bfdf"
    end

    on_intel do
      url "https://github.com/cyperx84/clwatch/releases/download/v#{version}/clwatch-#{version}-darwin-amd64.tar.gz"
      sha256 "e77721ba6cca950f5bd7c322c707be4b3714559fa72dc02de8e8c9a1eb6c28e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cyperx84/clwatch/releases/download/v#{version}/clwatch-#{version}-linux-arm64.tar.gz"
      sha256 "f37b8f7239fe0173b3f7314d5b88150b890d3e0733a7083f7a3b864e3d3d6435"
    end

    on_intel do
      url "https://github.com/cyperx84/clwatch/releases/download/v#{version}/clwatch-#{version}-linux-amd64.tar.gz"
      sha256 "c5c806ae99844d60ac615e56a7c30443f542cfffc3032505db2342510cac52f1"
    end
  end

  def install
    bin.install "clwatch"

    # Shell completions
    generate_completions_from_executable(bin/"clwatch", "completion")
  end

  def post_install
    ohai "To enable shell completions, restart your shell or run:"
    ohai "  bash:  source <(clwatch completion bash)"
    ohai "  zsh:   source <(clwatch completion zsh)"
    ohai "  fish:  clwatch completion fish > ~/.config/fish/completions/clwatch.fish"
    ohai ""
    ohai "New in v1.2.0:"
    ohai "  clwatch diff-tool <tool> <from> <to>  # compare versions"
    ohai ""
    ohai "To run clwatch as a background service:"
    ohai "  clwatch service install"
  end

  test do
    assert_match "clwatch #{version}", shell_output("#{bin}/clwatch version")
    assert_match "_clwatch", shell_output("#{bin}/clwatch completion zsh")
    assert_match "diff-tool", shell_output("#{bin}/clwatch --help")
  end
end
