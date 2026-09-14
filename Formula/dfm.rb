# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "1.13.3"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.13.3/dfm_1.13.3_darwin_arm64.tar.gz"
      sha256 "f6871ca2c786b8fa22f8b154acea9e94b4dcc1db674ea6d617e3b14c952bc9be"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.13.3/dfm_1.13.3_darwin_amd64.tar.gz"
      sha256 "41f57bb407e2d8a6afb086c4a7da819555ce4e6b0041045c2ece7ab465d2d438"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.13.3/dfm_1.13.3_linux_arm64.tar.gz"
      sha256 "a0f67b43b512446c84642780830e6c9a784691f3dd4f06abad58b2683dab124e"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.13.3/dfm_1.13.3_linux_amd64.tar.gz"
      sha256 "0cca8f5d8a910cbd5b81ebbf1814478fe76faf0b25a8ed861dff98ad2079fcb9"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
