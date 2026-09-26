# BootIntel Homebrew tap

```sh
brew tap bootintel/tap
brew install bootintel
```

Installs the published release binary for your platform, verified against the
SHA-256 the release workflow publishes.

`bootintel` is an interactive UART terminal that understands boot logs. Local
identification runs entirely offline and uploads nothing; hosted analysis is
opt-in per command. See [bootintel.com/cli](https://bootintel.com/cli) and the
[CLI repository](https://github.com/BootIntel/cli).

## Other ways to install

This tap is a convenience, not the only path:

```sh
# One-liner, no Homebrew, Linux and macOS:
curl -sSfL https://raw.githubusercontent.com/BootIntel/cli/main/packaging/scripts/install.sh | sh

# From crates.io, builds from source, needs a Rust toolchain:
cargo install bootintel
```

## Keeping this in step

The formula pins a version and four checksums. On a new upstream release,
update `version` and all four `sha256` values from that release's SHA256SUMS
artifact. A stale formula is worse than a missing one: it installs an old
binary while appearing to work.
