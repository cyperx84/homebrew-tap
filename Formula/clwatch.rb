class Clwatch < Formula
  desc "Track coding tool updates from changelogs.info"
  homepage "https://github.com/cyperx84/clwatch"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cyperx84/clwatch/releases/download/v#{version}/clwatch-#{version}-darwin-arm64.tar.gz"
      sha256 "998c01fd9e25094816dc0302f215fcf7c0dcc920deeee9c54deebd15139663cf"
    end

    on_intel do
      url "https://github.com/cyperx84/clwatch/releases/download/v#{version}/clwatch-#{version}-darwin-amd64.tar.gz"
      sha256 "ea4173f120317d95641b361cd4ef7de100d764270a18a0ee7d5c36bffa1f0cfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cyperx84/clwatch/releases/download/v#{version}/clwatch-#{version}-linux-arm64.tar.gz"
      sha256 "864f3439ae55b52eee916d3aa079ce2cd469a0b71e733e648becaac23a5978db"
    end

    on_intel do
      url "https://github.com/cyperx84/clwatch/releases/download/v#{version}/clwatch-#{version}-linux-amd64.tar.gz"
      sha256 "a61c180ad5e166e55bb64f7f5a1717fd1cd9714b0999192f3fbf09d4bcb050c2"
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
    ohai "To run clwatch as a background service:"
    ohai "  clwatch service install"
  end

  test do
    assert_match "clwatch #{version}", shell_output("#{bin}/clwatch version")
    assert_match "_clwatch", shell_output("#{bin}/clwatch completion zsh")
    assert_match "_clwatch_completions", shell_output("#{bin}/clwatch completion bash")
  end
end
