# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream lsm release (after a hold window) by
# .github/workflows/update-lsm-formula.yml via scripts/render-formula.sh.
# Do not edit Formula/lsm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-formula.sh instead.
class Lsm < Formula
  desc "Per-app, per-environment age-encrypted secrets manager"
  homepage "https://github.com/llbbl/lsm"
  version "0.13.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.13.0/lsm-v0.13.0-darwin-arm64.tar.gz"
      sha256 "06c61061cc7409903bbbabb5631621be347a5c00aca6e8113ce2819693323fab"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.13.0/lsm-v0.13.0-darwin-amd64.tar.gz"
      sha256 "eef2e11bb3f169c3829f817c6877707f0c4aa571472b59d6ca82cb5f1debffd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.13.0/lsm-v0.13.0-linux-arm64.tar.gz"
      sha256 "d882d8ee5134d13d3ae678ebc33801aed791d67b491ead3ad2ea8b3ba73f53f6"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.13.0/lsm-v0.13.0-linux-amd64.tar.gz"
      sha256 "cc2a3ef331c353891c9d4573f761156e8402f5d498eda6895e5d7abded4c37a4"
    end
  end

  def install
    bin.install "lsm"
  end

  test do
    assert_match "lsm v#{version}", shell_output("#{bin}/lsm version")
  end
end
