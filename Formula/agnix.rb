class Agnix < Formula
  desc "Lint AI agent configuration files"
  homepage "https://github.com/agent-sh/agnix"
  url "https://github.com/agent-sh/agnix/archive/refs/tags/v0.59.3.tar.gz"
  sha256 "a5e89a36ebc5475d46e2912857a193ec80ad47fce1d05c7cdea68308edc75d7e"
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
