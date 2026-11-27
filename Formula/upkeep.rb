# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.6.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.10/upkeep_0.6.10_darwin_arm64.tar.gz"
      sha256 "557271264d516657ea80d83bb881d19f394beb53e2721be8d8e3496d10062a9c"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.10/upkeep_0.6.10_darwin_amd64.tar.gz"
      sha256 "7abac693f9ca3f78b7fd23b94999dce27750a562997b18fe977214c019eebed5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.10/upkeep_0.6.10_linux_arm64.tar.gz"
      sha256 "b99fa38418cc47519ffd1d05a2a39b026591d53a2fddf69bde5bd39e9fc63889"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.10/upkeep_0.6.10_linux_amd64.tar.gz"
      sha256 "f78174f082691f5a3a039e6c7f96f58dae2117f70da4f5b2759809895dab2d6c"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
