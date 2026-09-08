# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream lsm release (after a hold window) by
# .github/workflows/update-lsm-formula.yml via scripts/render-formula.sh.
# Do not edit Formula/lsm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-formula.sh instead.
class Lsm < Formula
  desc "Per-app, per-environment age-encrypted secrets manager"
  homepage "https://github.com/llbbl/lsm"
  version "0.11.4"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.11.4/lsm-v0.11.4-darwin-arm64.tar.gz"
      sha256 "4be52b67a1355ae880517c9af3e52c105be2b709c4017540d65da23e63cb9aa3"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.11.4/lsm-v0.11.4-darwin-amd64.tar.gz"
      sha256 "718af5b3da03df53a60bc751f00df20b4f95907656ffff72477af1db4334d71c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.11.4/lsm-v0.11.4-linux-arm64.tar.gz"
      sha256 "656aa1c1968ce65c128c7ebd4cf8e5060a1d420579e326a06d83fe02f6459d1a"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.11.4/lsm-v0.11.4-linux-amd64.tar.gz"
      sha256 "ce75af5ca72594f1b805b66f11ed3bbad695ac26b85118574912d3dbf457bf82"
    end
  end

  def install
    bin.install "lsm"
  end

  test do
    assert_match "lsm v#{version}", shell_output("#{bin}/lsm version")
  end
end
