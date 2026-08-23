# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.4.4/upkeep_0.4.4_darwin_arm64.tar.gz"
      sha256 "4ccac566b9ed3fd911eb14627a6f3820ad8d7a38d4b4022a5553c1920c15bcea"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.4.4/upkeep_0.4.4_darwin_amd64.tar.gz"
      sha256 "80a7add59257725cc33500c04c538d409d8459ffff8c355565f35ccf01ad558c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.4.4/upkeep_0.4.4_linux_arm64.tar.gz"
      sha256 "2fbc75b8d6a787416d19eb94c98f69222fbf284cae9b1f06c312e05be6bf3360"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.4.4/upkeep_0.4.4_linux_amd64.tar.gz"
      sha256 "df15c3441c9c435f7e0623be7d25e3f5aa109e9f2dba49432edf3e60ef44154e"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
