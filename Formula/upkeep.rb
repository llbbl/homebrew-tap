# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.6.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.8/upkeep_0.6.8_darwin_arm64.tar.gz"
      sha256 "47e30161091a60ecd16af0278776ff1250131a107580be7aa3ef0959a19c396d"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.8/upkeep_0.6.8_darwin_amd64.tar.gz"
      sha256 "d87720a810ae66272950b703972a89688b7ee0ba388d62e42108b353ea1621d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.8/upkeep_0.6.8_linux_arm64.tar.gz"
      sha256 "80d94d4b13d0e6ef33b1483ce83c7cf71a39fa46f2efb141e6ed9a5749fdcea4"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.8/upkeep_0.6.8_linux_amd64.tar.gz"
      sha256 "0e42ea04741512a9c7e10c82098a23c969f7d352e9b5d05f52cbf46651ef4865"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
