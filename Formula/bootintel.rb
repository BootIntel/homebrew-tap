# Homebrew formula for the BootIntel CLI.
#
# Generated from the published GitHub release, not built from source: the
# release workflow already produces signed, checksummed binaries for every
# platform Homebrew cares about, and rebuilding here would only add a Rust
# toolchain requirement and a second thing that can differ from the release.
#
# On every version bump, update `version` and all four sha256 values from the
# SHA256SUMS artifact of the matching release. The values below are from
# https://github.com/BootIntel/cli/releases/download/cli-v0.6.0/SHA256SUMS
class Bootintel < Formula
  desc "Interactive UART capture and streaming boot-log analysis"
  homepage "https://bootintel.com"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-aarch64-macos.tar.gz"
      sha256 "3bb2ba19032a930e5dbfe7af1f6ca98a51ea95b303734e0797e7b5616bd9f56a"
    end
    on_intel do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-x86_64-macos.tar.gz"
      sha256 "86727e8fb4db983be912275a4cb9e0cdaa1bc34c463ba85129142f5dba0ce943"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-aarch64-linux.tar.gz"
      sha256 "e476c79752ea33468abc4f99baacb780eb4a460d4a52a8a3675e1f288e5d5629"
    end
    on_intel do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-x86_64-linux.tar.gz"
      sha256 "c9b7beffd52149821cf2176670197bb055bd1ddebc553ac60e1474abcaaed1b9"
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
