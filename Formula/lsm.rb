# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream lsm release (after a hold window) by
# .github/workflows/update-lsm-formula.yml via scripts/render-formula.sh.
# Do not edit Formula/lsm.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-formula.sh instead.
class Lsm < Formula
  desc "Per-app, per-environment age-encrypted secrets manager"
  homepage "https://github.com/llbbl/lsm"
  version "0.12.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.12.1/lsm-v0.12.1-darwin-arm64.tar.gz"
      sha256 "ec5b75efb35f7f9857bf187ef12bddaa6f1fc9f78098da687dcf53bc4d6bd775"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.12.1/lsm-v0.12.1-darwin-amd64.tar.gz"
      sha256 "ddd222898cd50cbd6613dec505ff9b436d5ad9e6fbf8e0147415a0622a34a6f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llbbl/lsm/releases/download/v0.12.1/lsm-v0.12.1-linux-arm64.tar.gz"
      sha256 "668f582ef0d612bc75673318e0a654c2b67e76241a159be0370902d4e4657e5f"
    end
    on_intel do
      url "https://github.com/llbbl/lsm/releases/download/v0.12.1/lsm-v0.12.1-linux-amd64.tar.gz"
      sha256 "00b3f75f9dd7012db02c497ef82cc586209255307655130b9d1b79d3450d4853"
    end
  end

  def install
    bin.install "lsm"
  end

  test do
    assert_match "lsm v#{version}", shell_output("#{bin}/lsm version")
  end
end
