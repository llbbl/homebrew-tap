# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream upkeep release (after a hold window) by
# .github/workflows/update-upkeep-formula.yml via scripts/render-upkeep-formula.sh.
# Do not edit Formula/upkeep.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-upkeep-formula.sh instead.
class Upkeep < Formula
  desc "JS/TS repository maintenance toolkit built with Bun"
  homepage "https://github.com/llbbl/upkeep"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.4.0/upkeep_0.4.0_darwin_arm64.tar.gz"
      sha256 "7477ea4294d1f2b93b3b00e15da1fb97a96093c6dc881abcfe4bdc9efd2934f0"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.4.0/upkeep_0.4.0_darwin_amd64.tar.gz"
      sha256 "bec14ad81c25183334105bf88bf7129c89cb7d1daf19d0ef5679392c4dfa1660"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/upkeep/releases/download/v0.4.0/upkeep_0.4.0_linux_arm64.tar.gz"
      sha256 "ae26f89f403fc37d84fc9239e44c93513668513ae09e524f65670cf196b4489b"
    end
    on_intel do
      url "https://github.com/llbbl/upkeep/releases/download/v0.4.0/upkeep_0.4.0_linux_amd64.tar.gz"
      sha256 "c3fdc3ab0c8862469b3f75fc38248d04c2332e0911cfc2d8119b9108d770733b"
    end
  end

  def install
    bin.install "upkeep"
  end

  test do
    assert_match "upkeep v#{version}", shell_output("#{bin}/upkeep --version")
  end
end
