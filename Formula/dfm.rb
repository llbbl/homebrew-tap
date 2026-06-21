# typed: false
# frozen_string_literal: true
#
# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "1.7.0"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.7.0/dfm_1.7.0_darwin_arm64.tar.gz"
      sha256 "1435c45ece42f8efea524b99a8669d2155a7b6054a5813aacea07fc4dc03c548"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.7.0/dfm_1.7.0_darwin_amd64.tar.gz"
      sha256 "24f138033cb63850d23b6928cf3c953786d4ed62fae2fa94f686e1f12c7cb528"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.7.0/dfm_1.7.0_linux_arm64.tar.gz"
      sha256 "937fa0735db76fa3acc3076e54633612af36b25f2bdf612ae1ad45065aa7c296"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.7.0/dfm_1.7.0_linux_amd64.tar.gz"
      sha256 "9c5f104117782e6e6bac969a0cf966b7cbb264724eddbebb39eeb4c644bbf0bf"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
