# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "1.9.5"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.5/dfm_1.9.5_darwin_arm64.tar.gz"
      sha256 "6adcf89c2bbeb48285d73869d80cf399a3e4e38d2ebadb80b0c62e8a763bb1a2"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.5/dfm_1.9.5_darwin_amd64.tar.gz"
      sha256 "76a76b6fc11f8ba9321050730944413b44e3ca5b242cb0dc740e4ed3435215fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.5/dfm_1.9.5_linux_arm64.tar.gz"
      sha256 "eb442975a3613c6943ecc9960f6f1c97795f50cf9b4500bc726d23ff685f49bb"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.5/dfm_1.9.5_linux_amd64.tar.gz"
      sha256 "131bffd361a114410bc3898aa79de2b65a442e720ce2ca023f3073e7bdbf2faa"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
