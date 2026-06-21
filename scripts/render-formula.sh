#!/usr/bin/env bash
#
# Render Formula/lsm.rb for a given lsm release tag and its four archive
# sha256 checksums. Emits the formula to stdout.
#
# Usage:
#   render-formula.sh TAG DARWIN_ARM64 DARWIN_AMD64 LINUX_ARM64 LINUX_AMD64
#
# Example:
#   render-formula.sh v0.9.2 b3455a... 1934... fc74... 1e47... > Formula/lsm.rb
#
# Called by .github/workflows/update-lsm-formula.yml. Kept as a standalone
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
# AUTO-GENERATED on each upstream lsm release (after a hold window) by
# .github/workflows/update-lsm-formula.yml via scripts/render-formula.sh.
# Do not edit Formula/lsm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-formula.sh instead.
class Lsm < Formula
  desc "Per-app, per-environment age-encrypted secrets manager"
  homepage "https://github.com/llbbl/lsm"
  version "${version}"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/${tag}/lsm-${tag}-darwin-arm64.tar.gz"
      sha256 "${da_arm}"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/${tag}/lsm-${tag}-darwin-amd64.tar.gz"
      sha256 "${da_amd}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/${tag}/lsm-${tag}-linux-arm64.tar.gz"
      sha256 "${lx_arm}"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/${tag}/lsm-${tag}-linux-amd64.tar.gz"
      sha256 "${lx_amd}"
    end
  end

  def install
    bin.install "lsm"
  end

  test do
    assert_match "lsm v#{version}", shell_output("#{bin}/lsm version")
  end
end
EOF
