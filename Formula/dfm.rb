# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "1.9.3"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.3/dfm_1.9.3_darwin_arm64.tar.gz"
      sha256 "a548ac0360489000b304aa63e75949294768920cf604927ad3cd8cb4f72a79b9"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.3/dfm_1.9.3_darwin_amd64.tar.gz"
      sha256 "d67401081264888ff5ddd0bf9ca74e9866ef3f166c8940d350b32aff99fc22e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.3/dfm_1.9.3_linux_arm64.tar.gz"
      sha256 "8f0532f60c16268961fe2c5ed47734fdfd90df15acce6b7a3d85151a5a80c446"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.9.3/dfm_1.9.3_linux_amd64.tar.gz"
      sha256 "d3274d3a280598b5fe5cc458235943b32affbb50dcfd7f8b5f17ea2ee0a457c1"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
