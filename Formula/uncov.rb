# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream uncov release (after a hold window) by
# .github/workflows/update-uncov-formula.yml via scripts/render-uncov-formula.sh.
# Do not edit Formula/uncov.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-uncov-formula.sh instead.
class Uncov < Formula
  desc "CLI tool that reports files with low test coverage from Vitest/Istanbul output"
  homepage "https://github.com/llbbl/uncov"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/uncov/releases/download/v0.1.8/uncov-darwin-arm64"
      sha256 "9195225d0f8f839e946948409c97a2ac53cbe37c8e94c9c90aa590c51267e3c2"
    end

    on_intel do
      url "https://github.com/llbbl/uncov/releases/download/v0.1.8/uncov-darwin-x64"
      sha256 "53327dab9878bd506196c55ead10b0980755c6bd4f4edf7cfad96afd927ddd06"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/llbbl/uncov/releases/download/v0.1.8/uncov-linux-x64"
      sha256 "697bc7881180277eb4ce74248156c7210fde9a55d5c1e9405822edc247345241"
    end
  end

  # One top-level installer rather than a `def install` inside each on_* block:
  # defining methods in blocks trips Sorbet/BlockMethodDefinition in brew style.
  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "uncov-darwin-arm64" : "uncov-darwin-x64"
    else
      "uncov-linux-x64"
    end

    bin.install binary => "uncov"
  end

  test do
    # uncov --version prints the bare version ("0.1.7"), not "uncov 0.1.7".
    assert_match version.to_s, shell_output("#{bin}/uncov --version")
  end
end
