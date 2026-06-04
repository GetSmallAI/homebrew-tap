class SmallHarness < Formula
  desc "Terminal-based agent harness for running small LLMs on your Mac"
  homepage "https://github.com/GetSmallAI/SmallHarness"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GetSmallAI/SmallHarness/releases/download/v0.4.2/small-harness-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "38a7e449237ecf747b02e4efface38b7ff8e2c2823d42e7f42bc722e8fc8bc51"
    end
    on_intel do
      url "https://github.com/GetSmallAI/SmallHarness/releases/download/v0.4.2/small-harness-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "7f7dc39abf59bc49f9f3a1958e0a70f6bd32e3ea7f8293085659dae90b77bc71"
    end
  end

  def install
    bin.install "small-harness"
    # README/LICENSE/Quickstart are bundled in the tarball — install them
    # under doc/ so `brew info` and `brew docs` show something useful.
    doc.install Dir["README.md", "Quickstart.md", "LICENSE"]

    # Best-effort shell completion install. `small-harness completions <shell>`
    # writes the script to stdout; pipe it into the standard locations
    # Homebrew already manages.
    generate_completions_from_executable(bin/"small-harness", "completions")
  end

  test do
    assert_match "small-harness", shell_output("#{bin}/small-harness completions bash")
  end
end
