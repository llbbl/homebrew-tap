# typed: false
# frozen_string_literal: true
#
# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.3.0/upkeep_0.3.0_darwin_arm64.tar.gz"
      sha256 "4122a66b2ae77aab2038c14c623b25385e90e144c909f538ce178c69be879a29"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.3.0/upkeep_0.3.0_darwin_amd64.tar.gz"
      sha256 "9234936310280bd326ad034f4743a8ada8083a40cad339f50a3a7f33b9e401ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.3.0/upkeep_0.3.0_linux_arm64.tar.gz"
      sha256 "a6c4288433c71d0f32fc917b1cfa133820f650d0fee201e338c7226740c5e9af"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.3.0/upkeep_0.3.0_linux_amd64.tar.gz"
      sha256 "7e165648b561ac5302da6117d023b5736c517819e1c818da3ca36b750548d98d"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
