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
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.2.0/upkeep_0.2.0_darwin_arm64.tar.gz"
      sha256 "e232742de9d961f70a3faff7b703f9b41082e09dbc797cdef59b330dfe1b103a"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.2.0/upkeep_0.2.0_darwin_amd64.tar.gz"
      sha256 "326be9c966cf0c0b3104b78bb999d56a9cc8aca2b9d59cda2df636086a3fbdd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.2.0/upkeep_0.2.0_linux_arm64.tar.gz"
      sha256 "0d8c550dfc2db55175a0f1f6a8b6347d0d44491b53fd2e56eaf58a293941d000"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.2.0/upkeep_0.2.0_linux_amd64.tar.gz"
      sha256 "6eeb2f3c5e27f5e5672e8e5bf07c6b4a5a4dcf37140b238656c7c2b49be3cb9e"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
