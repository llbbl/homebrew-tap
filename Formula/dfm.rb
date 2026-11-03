# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "1.13.10"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.13.10/dfm_1.13.10_darwin_arm64.tar.gz"
      sha256 "32ae5b85c8543b922c3d2ed316690e009290f90a7fe489d02fac58e82e7c59a5"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.13.10/dfm_1.13.10_darwin_amd64.tar.gz"
      sha256 "875a9bf64b7153868f4d7bd908514bbfde6ee70d3f86acf118fe11687528a170"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.13.10/dfm_1.13.10_linux_arm64.tar.gz"
      sha256 "db7c88f8570d0a40a648a00554bf6b69e1381f48e2915200f54840a10b364b3c"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.13.10/dfm_1.13.10_linux_amd64.tar.gz"
      sha256 "a1590a65087a7a7e7709538ac852f672926900252e95a20ce240e994b00a4620"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
