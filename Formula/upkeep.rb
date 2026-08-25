# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.0/upkeep_0.6.0_darwin_arm64.tar.gz"
      sha256 "df15977e2aeae93cb08fb4fb3b9d799e5a1f570fb33ae3c5ead7b315159e7cc9"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.0/upkeep_0.6.0_darwin_amd64.tar.gz"
      sha256 "f861e0dd6468d584bcbac9a9f83663b11a7f79f2f490e9281202dd0c87f66041"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.0/upkeep_0.6.0_linux_arm64.tar.gz"
      sha256 "34d214dbf9c7143c12ea5e13092db1f716ca656c970c6fcda82a64b44963cc10"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.0/upkeep_0.6.0_linux_amd64.tar.gz"
      sha256 "57ae597a667c3ee9b6e8f7cdd0a5d8f67e3b4f6932f98460b0799f4c83d99620"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
