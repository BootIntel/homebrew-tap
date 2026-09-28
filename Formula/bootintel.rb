# Homebrew formula for the BootIntel CLI.
#
# Generated from the published GitHub release, not built from source: the
# release workflow already produces signed, checksummed binaries for every
# platform Homebrew cares about, and rebuilding here would only add a Rust
# toolchain requirement and a second thing that can differ from the release.
#
# On every version bump, update `version` and all four sha256 values from the
# SHA256SUMS artifact of the matching release. The values below are from
# https://github.com/BootIntel/cli/releases/download/cli-v0.10.0/SHA256SUMS
class Bootintel < Formula
  desc "Interactive UART capture and streaming boot-log analysis"
  homepage "https://bootintel.com"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-aarch64-macos.tar.gz"
      sha256 "c23a44dac4dbb63c85662ca94ae63e38e044650bebeb1479edd5b5076662a52e"
    end
    on_intel do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-x86_64-macos.tar.gz"
      sha256 "f8ddfad51e82ec3d5846d848e01a2caabef5bdba0fe9777d6c2df8ae5e886693"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-aarch64-linux.tar.gz"
      sha256 "e5121b96d7e39cacf67d1d8e3a2629b2d9bae34826d2bfab4c439c8fc97504a3"
    end
    on_intel do
      url "https://github.com/BootIntel/cli/releases/download/cli-v#{version}/bootintel-v#{version}-x86_64-linux.tar.gz"
      sha256 "245535e204c4b6c4775fb85735900106e0e2672e1e5010a384a438feb5328d04"
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
