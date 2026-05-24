class SmallHarness < Formula
  desc "Terminal-based agent harness for running small LLMs on your Mac"
  homepage "https://github.com/GetSmallAI/SmallHarness"
  version "0.3.0" # bump per release
  license "MIT"

  ARM64_SHA256 = "d1a178cfb8dab4af1b6074424bd83ca7cda24c60a370b7c847b1b147abff339d".freeze
  X86_64_SHA256 = "96d377b9c6a1779a6041f91cd6c9c17e08ec42ef5aa822de85643e935c980393".freeze

  on_macos do
    on_arm do
      url "https://github.com/GetSmallAI/SmallHarness/releases/download/v#{version}/small-harness-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 ARM64_SHA256
    end
    on_intel do
      url "https://github.com/GetSmallAI/SmallHarness/releases/download/v#{version}/small-harness-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 X86_64_SHA256
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
