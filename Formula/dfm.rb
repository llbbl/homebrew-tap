# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "1.14.8"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.8/dfm_1.14.8_darwin_arm64.tar.gz"
      sha256 "a69d25e6fc1b3f49c87b1583baff088b5c7d1216b8ee30e0d0093d26bf5fddb7"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.8/dfm_1.14.8_darwin_amd64.tar.gz"
      sha256 "163d019a02f8c1fdb1f442dcefdb470f27295ecfc05595bc444a9199b8c53b1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.8/dfm_1.14.8_linux_arm64.tar.gz"
      sha256 "7955390e77571775286b29971d8af9506f366caa9d3eb78af3ba1462f1a93c54"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.8/dfm_1.14.8_linux_amd64.tar.gz"
      sha256 "d94dc610959e5ffbee1fc48e016cb16c1e733f6669f8e575e6e1cea7acbcf6f4"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
