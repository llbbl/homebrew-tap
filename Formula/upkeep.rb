# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.3/upkeep_0.6.3_darwin_arm64.tar.gz"
      sha256 "4e1df9c5fdf698fba441df74dd23ece0a6a9d14d69716637b4a9a31ffd31a5b2"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.3/upkeep_0.6.3_darwin_amd64.tar.gz"
      sha256 "660b2542d57a07f3d99cb74da46c209a33db33620da764b62ee8a0789f364f3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.3/upkeep_0.6.3_linux_arm64.tar.gz"
      sha256 "68d0a64107d776f1a161450529154900c1bfacf2900f4a2eee4b533b8ae8f45c"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.3/upkeep_0.6.3_linux_amd64.tar.gz"
      sha256 "7e41e1d23c0725a596a6723fc7f403748ec77a6022f7c4233f904b8b923cd863"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
