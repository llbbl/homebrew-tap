# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream lsm release (after a hold window) by
# .github/workflows/update-lsm-formula.yml via scripts/render-formula.sh.
# Do not edit Formula/lsm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-formula.sh instead.
class Lsm < Formula
  desc "Per-app, per-environment age-encrypted secrets manager"
  homepage "https://github.com/llbbl/lsm"
  version "0.13.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.13.1/lsm-v0.13.1-darwin-arm64.tar.gz"
      sha256 "7b858d815e2ce41e12624d886b7af02e7c44f98e2cf09a4e12c7e82f6d0c9307"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.13.1/lsm-v0.13.1-darwin-amd64.tar.gz"
      sha256 "cb9bd70d0a016d58df7059afbb600988bfed208cae935d418e588e6619b6cf7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.13.1/lsm-v0.13.1-linux-arm64.tar.gz"
      sha256 "c2a3c23d12de31822db8b13ddfb59dc940fc9975435b2633b7f57adcf9562346"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.13.1/lsm-v0.13.1-linux-amd64.tar.gz"
      sha256 "d3e922094269b9a46791721fb221223cadaf6ed084851419ab32ba89f0280f84"
    end
  end

  def install
    bin.install "lsm"
  end

  test do
    assert_match "lsm v#{version}", shell_output("#{bin}/lsm version")
  end
end
