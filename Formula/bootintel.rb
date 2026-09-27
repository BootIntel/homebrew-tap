# Homebrew formula for the BootIntel CLI.
#
# Generated from the published GitHub release, not built from source: the
# release workflow already produces signed, checksummed binaries for every
# platform Homebrew cares about, and rebuilding here would only add a Rust
# toolchain requirement and a second thing that can differ from the release.
#
# On every version bump, update `version` and all four sha256 values from the
# SHA256SUMS artifact of the matching release. The values below are from
# https://github.com/BootIntel/cli/releases/download/cli-v0.7.0/SHA256SUMS
class Bootintel < Formula
  desc "Interactive UART capture and streaming boot-log analysis"
  homepage "https://bootintel.com"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-aarch64-macos.tar.gz"
      sha256 "f48cf3072ee85c61fc07c094f5682f9229d455dc8357d9226a6a036a25d79923"
    end
    on_intel do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-x86_64-macos.tar.gz"
      sha256 "affa830e1ceb7b364e296baaf4b355d451a0099635673bb91d591c9060b11dcc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-aarch64-linux.tar.gz"
      sha256 "aa599f8160d54b66bb23f7e4564cb9dc373b8f932f24179aad6e071a67bdb330"
    end
    on_intel do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-x86_64-linux.tar.gz"
      sha256 "d5bf34a42efdb09bfe18606878ab215a34212c7b9621eba0cb1f3514f7447b98"
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
