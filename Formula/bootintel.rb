# Homebrew formula for the BootIntel CLI.
#
# Generated from the published GitHub release, not built from source: the
# release workflow already produces signed, checksummed binaries for every
# platform Homebrew cares about, and rebuilding here would only add a Rust
# toolchain requirement and a second thing that can differ from the release.
#
# On every version bump, update `version` and all four sha256 values from the
# SHA256SUMS artifact of the matching release. The values below are from
# https://github.com/BootIntel/cli/releases/download/cli-v0.13.0/SHA256SUMS
class Bootintel < Formula
  desc "Interactive UART capture and streaming boot-log analysis"
  homepage "https://bootintel.com"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-aarch64-macos.tar.gz"
      sha256 "8f7f6b588a65ec683fa9cf3dfd7e397a750e08619f5af95a3f5d1b185aa79046"
    end
    on_intel do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-x86_64-macos.tar.gz"
      sha256 "de219222b70013ee2a3b28ae07479f438dcc297ee14f95c3a7f4e4064c222dd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-aarch64-linux.tar.gz"
      sha256 "7376741baa7c70de58659275d30193ab5af6b679a1455a7006d5bc78fcb88620"
    end
    on_intel do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-x86_64-linux.tar.gz"
      sha256 "a23f16104344d578c6c99b3e8ea6ab6f15dbfbe26163c48582ce00810aa5442c"
    end
  end

  def install
    bin.install "bootintel"
  end

  test do
    # `version` is a real subcommand and prints the detector count, so this
    # asserts the binary actually ran rather than just existing on disk.
    assert_match "bootintel #{version}", shell_output("#{bin}/bootintel version")
  end
end
