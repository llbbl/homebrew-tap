#!/usr/bin/env bash
#
# Render Formula/upkeep.rb for a given upkeep release tag and its four archive
# sha256 checksums. Emits the formula to stdout.
#
# Usage:
#   render-upkeep-formula.sh TAG DARWIN_ARM64 DARWIN_AMD64 LINUX_ARM64 LINUX_AMD64
#
# Example:
#   render-upkeep-formula.sh v0.2.0 e23274... 326be9... 0d8c55... 6eeb2f... > Formula/upkeep.rb
#
# upkeep ships GoReleaser-style archives named
#   upkeep_<version>_<os>_<arch>.tar.gz   (version has no leading 'v', underscores)
# i.e. the same scheme as dfm, so this mirrors scripts/render-dfm-formula.sh.
#
# Called by .github/workflows/update-upkeep-formula.yml. Kept as a standalone
# script so the formula template can be regenerated and diffed locally.
set -euo pipefail

if [ "$#" -ne 5 ]; then
  echo "usage: $0 TAG DARWIN_ARM64 DARWIN_AMD64 LINUX_ARM64 LINUX_AMD64" >&2
  exit 2
fi

tag="$1"
da_arm="$2"
da_amd="$3"
lx_arm="$4"
lx_amd="$5"
version="${tag#v}"

# Unquoted heredoc: ${...} bash vars expand; Ruby's #{...} has no '$' so it
# passes through literally.
cat <<EOF
# typed: false
# frozen_string_literal: true
#
# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "${version}"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/${tag}/upkeep_${version}_darwin_arm64.tar.gz"
      sha256 "${da_arm}"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/${tag}/upkeep_${version}_darwin_amd64.tar.gz"
      sha256 "${da_amd}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/${tag}/upkeep_${version}_linux_arm64.tar.gz"
      sha256 "${lx_arm}"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/${tag}/upkeep_${version}_linux_amd64.tar.gz"
      sha256 "${lx_amd}"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
EOF
