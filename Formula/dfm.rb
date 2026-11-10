# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "1.14.0"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.0/dfm_1.14.0_darwin_arm64.tar.gz"
      sha256 "c23bb4e73fc886ef2cf59f88576ed6d82b78d70ac21e107388becf00e13fe420"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.0/dfm_1.14.0_darwin_amd64.tar.gz"
      sha256 "7d513d0509f39bb676cfc9a19acd9696a0f84f950f5f69a3258d89d2dde14d92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.0/dfm_1.14.0_linux_arm64.tar.gz"
      sha256 "17c6bd39092f326f6fa80a313d9eae38cf989bc4dbb74957acb760e55852ba5c"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.0/dfm_1.14.0_linux_amd64.tar.gz"
      sha256 "224ae1dd9b36a34daf855876fbf56eff96b87ea786367f3515b0e1a7e776f4c6"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
