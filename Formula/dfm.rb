# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream dotfiles-manager release (after a hold window)
# by .github/workflows/update-dfm-formula.yml via scripts/render-dfm-formula.sh.
# Do not edit Formula/dfm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-dfm-formula.sh instead.
class Dfm < Formula
  desc "Manage, version, and AI-improve dotfiles with a private backup repo"
  homepage "https://github.com/llbbl/dotfiles-manager"
  version "1.14.10"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.10/dfm_1.14.10_darwin_arm64.tar.gz"
      sha256 "725ef47cd0c391803ab6476e9bf38e0b3f001687b39eac69ba7c038b14270e32"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.10/dfm_1.14.10_darwin_amd64.tar.gz"
      sha256 "82c8368afcdc509f1bc78f4730d5bff1c011cc49c3465fe66f1b9be8fd0a1a3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.10/dfm_1.14.10_linux_arm64.tar.gz"
      sha256 "e32be7ed55bc1a8efef8ade235af0b0f045de3b3f18f00424321c59a67cfd520"
    end
    on_intel do
      url "https://github.com/llbbl/dotfiles-manager/releases/download/v1.14.10/dfm_1.14.10_linux_amd64.tar.gz"
      sha256 "8f1317fe8b5c383b8236b899e7438d2f80c0931e148dafb24ecded34237497e7"
    end
  end

  def install
    bin.install "dfm"
  end

  test do
    assert_match "dfm #{version}", shell_output("#{bin}/dfm version")
  end
end
