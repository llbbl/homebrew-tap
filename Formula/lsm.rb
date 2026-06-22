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
  version "0.10.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.10.0/lsm-v0.10.0-darwin-arm64.tar.gz"
      sha256 "c18b675b606b4175286eef1b3905d9c7eea897a508c29214fe111f4292964792"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.10.0/lsm-v0.10.0-darwin-amd64.tar.gz"
      sha256 "dd31f637cf6a808708e96e46c805c79ea45ba5534a83d19758dec89544da5c44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.10.0/lsm-v0.10.0-linux-arm64.tar.gz"
      sha256 "20cfc6e7065b3169392c9b5ff6ef7cd71e3da8dcf34c0fdacd8e024f2ac2469a"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.10.0/lsm-v0.10.0-linux-amd64.tar.gz"
      sha256 "ce2970ff8ec3815d25028d43bb7c954730633c8c718ff811db8635cc7e67b055"
    end
  end

  def install
    bin.install "lsm"
  end

  test do
    assert_match "lsm v#{version}", shell_output("#{bin}/lsm version")
  end
end
