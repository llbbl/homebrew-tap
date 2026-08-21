# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream lsm release (after a hold window) by
# .github/workflows/update-lsm-formula.yml via scripts/render-formula.sh.
# Do not edit Formula/lsm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-formula.sh instead.
class Lsm < Formula
  desc "Per-app, per-environment age-encrypted secrets manager"
  homepage "https://github.com/llbbl/lsm"
  version "0.11.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.11.2/lsm-v0.11.2-darwin-arm64.tar.gz"
      sha256 "c6aee81c64bf568c6ea20f2cdeaa045bde562a832815d407ab1d4237a002c469"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.11.2/lsm-v0.11.2-darwin-amd64.tar.gz"
      sha256 "c1986c8d7e0189a47ae18c268aef69eb7d7f8742b1a55a875a5fecf2fab7e56e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.11.2/lsm-v0.11.2-linux-arm64.tar.gz"
      sha256 "f13d18436db4f49456937f308a2c9506076522d1c6e905730398ba7b2548380a"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.11.2/lsm-v0.11.2-linux-amd64.tar.gz"
      sha256 "8fb1822172d1ae065d43936ddf065b986b85dd8ec57f3d4e9960594dacb06a99"
    end
  end

  def install
    bin.install "lsm"
  end

  test do
    assert_match "lsm v#{version}", shell_output("#{bin}/lsm version")
  end
end
