# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream uncov release (after a hold window) by
# .github/workflows/update-uncov-formula.yml via scripts/render-uncov-formula.sh.
# Do not edit Formula/uncov.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-uncov-formula.sh instead.
class Uncov < Formula
  desc "CLI tool that reports files with low test coverage from Vitest/Istanbul output"
  homepage "https://github.com/llbbl/uncov"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/uncov/releases/download/v0.1.7/uncov-darwin-arm64"
      sha256 "ba7bd47126d9564e47813ee29d21fcb0c8477fa5dcd03ee53f63f178c35125c7"
    end

    on_intel do
      url "https://github.com/llbbl/uncov/releases/download/v0.1.7/uncov-darwin-x64"
      sha256 "8afcede9e31e3bfe46901e1afafb25723edc5264cc3d651d2c0457d9ddbf6e5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/llbbl/uncov/releases/download/v0.1.7/uncov-linux-x64"
      sha256 "6572182814b6f93b62fa84e66fabc05f1a9ceab4df59fe45e4cee954c4b08a53"
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
