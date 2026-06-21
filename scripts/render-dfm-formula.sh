#!/usr/bin/env bash
#
# Render Formula/dfm.rb for a given dotfiles-manager release tag and its four
# archive sha256 checksums. Emits the formula to stdout.
#
# Usage:
#   render-dfm-formula.sh TAG DARWIN_ARM64 DARWIN_AMD64 LINUX_ARM64 LINUX_AMD64
#
# Example:
#   render-dfm-formula.sh v1.7.0 1435c4... 24f138... 937fa0... 9c5f10... > Formula/dfm.rb
#
# dotfiles-manager ships GoReleaser-style archives named
#   dfm_<version>_<os>_<arch>.tar.gz   (version has no leading 'v', underscores)
# which differs from lsm's naming, so this is a separate renderer.
#
# Called by .github/workflows/update-dfm-formula.yml. Kept as a standalone
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
# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "${version}"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/${tag}/dfm_${version}_darwin_arm64.tar.gz"
      sha256 "${da_arm}"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/${tag}/dfm_${version}_darwin_amd64.tar.gz"
      sha256 "${da_amd}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/${tag}/dfm_${version}_linux_arm64.tar.gz"
      sha256 "${lx_arm}"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/${tag}/dfm_${version}_linux_amd64.tar.gz"
      sha256 "${lx_amd}"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
EOF
