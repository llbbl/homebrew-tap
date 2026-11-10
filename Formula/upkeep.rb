# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.6.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.7/upkeep_0.6.7_darwin_arm64.tar.gz"
      sha256 "0486acf656e45633dfad921bb2a3ab4e2a20324f218f697b4773a94821582af6"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.7/upkeep_0.6.7_darwin_amd64.tar.gz"
      sha256 "821122235adacd3582332109b2498d74042cae16937bcd594fffca4f7192b4f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.7/upkeep_0.6.7_linux_arm64.tar.gz"
      sha256 "d76a29d60c459764b1f08cc6fc4e867fb70998e81dff8d3f5de513756eb5c685"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.7/upkeep_0.6.7_linux_amd64.tar.gz"
      sha256 "7bebce3df1adba47ea8fc251033383ea3813d36129a01295dbbb6714dc4f10c9"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
