class Agnix < Formula
  desc "Lint AI agent configuration files"
  homepage "https://github.com/agent-sh/agnix"
  url "https://github.com/agent-sh/agnix/archive/refs/tags/v0.62.0.tar.gz"
  sha256 "5fafd5659c4d814ac8d0f4e4c131eec1496e26b1add798e74976ebe71a35cced"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/agent-sh/agnix.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/agnix-cli")
  end

  test do
    (testpath/"SKILL.md").write <<~EOS
      ---
      name: Test-Skill
      description: Use when testing skill name validation.
      ---
      Test body
    EOS

    output = shell_output("#{bin}/agnix --format json .", 1)
    diagnostics = JSON.parse(output).fetch("diagnostics")
    assert_includes diagnostics.map { |diagnostic| diagnostic.fetch("rule") }, "AS-004"
  end
end
