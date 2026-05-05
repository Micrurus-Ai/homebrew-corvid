class Corvid < Formula
  desc "General-purpose programming language for AI-native software"
  homepage "https://github.com/Micrurus-Ai/Corvid-lang"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  # NOTE: sha256 placeholders below are filled in automatically by the
  # publish-managers.yml workflow in Micrurus-Ai/Corvid-lang on every
  # release. Do not hand-edit unless cutting a release manually.

  on_macos do
    on_arm do
      url "https://github.com/Micrurus-Ai/Corvid-lang/releases/download/v#{version}/corvid-aarch64-apple-darwin.tar.gz"
      sha256 "c0cfe191c89cb23dac87b8ee08a8ffcb51cc47c556a215844de851f4199dfdf4"
    end
    on_intel do
      url "https://github.com/Micrurus-Ai/Corvid-lang/releases/download/v#{version}/corvid-x86_64-apple-darwin.tar.gz"
      sha256 "c111481ea2e33291b83db5254ef1583c1dd525a5c007a1258b3cf67bf49061c7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Micrurus-Ai/Corvid-lang/releases/download/v#{version}/corvid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d01733d2215eca9d2439c97a21669e66f299180466164815d7055070df82571b"
    end
  end

  def install
    bin.install "bin/corvid"
    # Place stdlib next to bin/ so `corvid new` can vendor it via the
    # find_std_source `<exe-dir>/../std` resolution path. current_exe on
    # macOS/Linux canonicalizes Homebrew's bin/ symlink, so this layout
    # is what the resolver actually sees at runtime.
    prefix.install "std" if File.directory?("std")
  end

  test do
    assert_match(/corvid/i, shell_output("#{bin}/corvid --help"))
  end
end
