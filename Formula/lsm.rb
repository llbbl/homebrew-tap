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
  version "0.9.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.9.2/lsm-v0.9.2-darwin-arm64.tar.gz"
      sha256 "b3455a77d6047294b32645acf867713292e0c7ec1ae1d5b292f171c6db483c00"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.9.2/lsm-v0.9.2-darwin-amd64.tar.gz"
      sha256 "1934749547d2e932367d0e608c81a7e6770267aeb34a3635a6b5b7253031ae0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.9.2/lsm-v0.9.2-linux-arm64.tar.gz"
      sha256 "fc749d1eca6dbcaa54dca214ea04a14b87184ef62f322b1ed8fdd5c8b19b4900"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.9.2/lsm-v0.9.2-linux-amd64.tar.gz"
      sha256 "1e47a421c3bf62774057eb8f55465a2523a3450c8797649eca40304339dae0c1"
    end
  end

  def install
    bin.install "lsm"
  end

  test do
    assert_match "lsm v#{version}", shell_output("#{bin}/lsm version")
  end
end
