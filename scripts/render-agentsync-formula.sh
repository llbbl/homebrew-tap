#!/usr/bin/env bash
#
# Render Formula/agentsync.rb for a given agentsync release tag and its four archive
# sha256 checksums. Emits the formula to stdout.
#
# Usage:
#   render-agentsync-formula.sh TAG DARWIN_ARM64 DARWIN_AMD64 LINUX_ARM64 LINUX_AMD64
#
# Example:
#   render-agentsync-formula.sh v0.9.2 b3455a... 1934... fc74... 1e47... > Formula/agentsync.rb
#
# Called by .github/workflows/update-agentsync-formula.yml. Kept as a standalone
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

# AUTO-GENERATED on each upstream agentsync release (after a hold window) by
# .github/workflows/update-agentsync-formula.yml via scripts/render-agentsync-formula.sh.
# Do not edit Formula/agentsync.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-agentsync-formula.sh instead.
class Agentsync < Formula
  desc "Provision Claude Code agents into projects as symlinks from one canonical repo"
  homepage "https://github.com/agentic-tooling/agentsync"
  version "${version}"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentic-tooling/agentsync/releases/download/${tag}/agentsync-${tag}-darwin-arm64.tar.gz"
      sha256 "${da_arm}"
    end
    on_intel do
      url "https://github.com/agentic-tooling/agentsync/releases/download/${tag}/agentsync-${tag}-darwin-amd64.tar.gz"
      sha256 "${da_amd}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentic-tooling/agentsync/releases/download/${tag}/agentsync-${tag}-linux-arm64.tar.gz"
      sha256 "${lx_arm}"
    end
    on_intel do
      url "https://github.com/agentic-tooling/agentsync/releases/download/${tag}/agentsync-${tag}-linux-amd64.tar.gz"
      sha256 "${lx_amd}"
    end
  end

  def install
    bin.install "agentsync"
  end

  test do
    assert_match "agentsync v#{version}", shell_output("#{bin}/agentsync --version")
  end
end
EOF
