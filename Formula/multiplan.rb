class Multiplan < Formula
  desc "4-model parallel planning workflow — Claude, Gemini, Codex, GLM-5"
  homepage "https://github.com/cyperx84/multiplan"
  url "https://github.com/cyperx84/multiplan/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1dcf415d14ef76e0f7f0f8a5cdcb93cb449a026f79ef3b876980a7549f9e8847"
  license "MIT"
  head "https://github.com/cyperx84/multiplan.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def post_install
    ohai "multiplan installed."
    ohai ""
    ohai "Quick start:"
    ohai "  multiplan \"Design a rate limiting system for the API\""
    ohai ""
    ohai "Eval a plan:"
    ohai "  multiplan eval ~/.multiplan/runs/LATEST/final-plan.md"
    ohai ""
    ohai "Drop into Claude Code projects:"
    ohai "  multiplan integrations --claude-code >> CLAUDE.md"
    ohai ""
    ohai "Models used: Claude (Opus), Gemini, Codex (GPT-5.4), GLM-5"
    ohai "Auth: claude/gemini/codex CLIs + ZAI_API_KEY for GLM-5"
  end

  test do
    assert_match "multiplan", shell_output("#{bin}/multiplan --version")
    assert_match "plan", shell_output("#{bin}/multiplan --help")
  end
end
