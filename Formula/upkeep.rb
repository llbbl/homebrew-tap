# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.2/upkeep_0.6.2_darwin_arm64.tar.gz"
      sha256 "1bf2b15679c80087421b4796f12122d6d34e1105d28f110caf6ee15383ace994"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.2/upkeep_0.6.2_darwin_amd64.tar.gz"
      sha256 "7378ba16e9a05e8e09ef7cdae387648d5efa613c74460bf7c4e95f12bf5ab12e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.2/upkeep_0.6.2_linux_arm64.tar.gz"
      sha256 "4976935568b59e55e93166b4e2b7d7911e13da2b7c88d6bab20130cf5df60f2b"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.6.2/upkeep_0.6.2_linux_amd64.tar.gz"
      sha256 "458a44d5de8ddb12d336c6928de0c9d56601d9bec690d1e22b16e9b7ef59d6c4"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
