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
  version "1.9.1"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.1/dfm_1.9.1_darwin_arm64.tar.gz"
      sha256 "043c1109ece10ab7ca40bf2b8be896e9e5c1d431f33ea536161f15baab74c63f"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.1/dfm_1.9.1_darwin_amd64.tar.gz"
      sha256 "9c6752d1ecdec94cd135533a31db0a4c3a6e2ad19378281948967ffedbfb6ad0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.1/dfm_1.9.1_linux_arm64.tar.gz"
      sha256 "baddf49d5d8dfd5bd233d243b5330efe2e298020287b4482e2e60e888665f4d4"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.1/dfm_1.9.1_linux_amd64.tar.gz"
      sha256 "248a4e7e8350ad387f46b230667e007cb5d0e11c3c94b04583f5eea771faa9cb"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
