#!/usr/bin/env bash
#
# Render Formula/uncov.rb for a given uncov release tag and the sha256
# checksums of its three unix binaries. Emits the formula to stdout.
#
# Usage:
#   render-uncov-formula.sh TAG DARWIN_ARM64 DARWIN_X64 LINUX_X64
#
# Example:
#   render-uncov-formula.sh v0.1.7 ba7bd4... 8afced... 657218... > Formula/uncov.rb
#
# uncov ships bare (un-archived) binaries named
#   uncov-<os>-<arch>            (no leading 'v', hyphens, no extension)
# rather than tarballs, so each platform block installs its own file and
# renames it to `uncov`.
#
# Upstream published `<binary>.sha256` sidecar files up to v0.1.4 but stopped
# at v0.1.6, so checksums are computed from the binaries themselves — see
# .github/workflows/update-uncov-formula.yml.
#
# Kept as a standalone script so the formula can be regenerated and diffed
# locally. Do not hand-edit Formula/uncov.rb.
set -euo pipefail

if [ "$#" -ne 4 ]; then
  echo "usage: $0 TAG DARWIN_ARM64 DARWIN_X64 LINUX_X64" >&2
  exit 2
fi

tag="$1"
da_arm="$2"
da_x64="$3"
lx_x64="$4"
version="${tag#v}"

# Unquoted heredoc: ${...} bash vars expand; Ruby's #{...} has no '$' so it
# passes through literally.
cat <<EOF
# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream uncov release (after a hold window) by
# .github/workflows/update-uncov-formula.yml via scripts/render-uncov-formula.sh.
# Do not edit Formula/uncov.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-uncov-formula.sh instead.
class Uncov < Formula
  desc "CLI tool that reports files with low test coverage from Vitest/Istanbul output"
  homepage "https://github.com/llbbl/uncov"
  version "${version}"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/uncov/releases/download/${tag}/uncov-darwin-arm64"
      sha256 "${da_arm}"
    end

    on_intel do
      url "https://github.com/llbbl/uncov/releases/download/${tag}/uncov-darwin-x64"
      sha256 "${da_x64}"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/llbbl/uncov/releases/download/${tag}/uncov-linux-x64"
      sha256 "${lx_x64}"
    end
  end

  # One top-level installer rather than a \`def install\` inside each on_* block:
  # defining methods in blocks trips Sorbet/BlockMethodDefinition in brew style.
  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "uncov-darwin-arm64" : "uncov-darwin-x64"
    else
      "uncov-linux-x64"
    end

    bin.install binary => "uncov"
  end

  test do
    # uncov --version prints the bare version ("0.1.7"), not "uncov 0.1.7".
    assert_match version.to_s, shell_output("#{bin}/uncov --version")
  end
end
EOF
