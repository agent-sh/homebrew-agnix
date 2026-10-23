class Agnix < Formula
  desc "Lint AI agent configuration files"
  homepage "https://github.com/agent-sh/agnix"
  url "https://github.com/agent-sh/agnix/archive/refs/tags/v0.59.2.tar.gz"
  sha256 "feda743d458762bdd8732a9f2ed608cdf106e6c30ecf07e7178e35e2abcc2ec3"
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
      ---
      Test body
    EOS

    output = shell_output("#{bin}/agnix #{testpath}", 1)
    assert_match "Invalid name", output
  end
end
