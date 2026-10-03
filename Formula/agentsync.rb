# typed: false
# frozen_string_literal: true

# AUTO-GENERATED on each upstream agentsync release (after a hold window) by
# .github/workflows/update-agentsync-formula.yml via scripts/render-agentsync-formula.sh.
# Do not edit Formula/agentsync.rb by hand — changes are overwritten on the next
# release. To change formatting, edit scripts/render-agentsync-formula.sh instead.
class Agentsync < Formula
  desc "Provision Claude Code agents into projects as symlinks from one canonical repo"
  homepage "https://github.com/agentic-tooling/agentsync"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentic-tooling/agentsync/releases/download/v0.0.1/agentsync-v0.0.1-darwin-arm64.tar.gz"
      sha256 "3a0ed1857ef09b269cf74ac4ccfaf039d64c5c6f2b8cefe3661611c054b361cd"
    end
    on_intel do
      url "https://github.com/agentic-tooling/agentsync/releases/download/v0.0.1/agentsync-v0.0.1-darwin-amd64.tar.gz"
      sha256 "5d6aaf2568b6c9185b053779c54a7ea5e9210ab48fc9c2f5b11d43c139714739"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentic-tooling/agentsync/releases/download/v0.0.1/agentsync-v0.0.1-linux-arm64.tar.gz"
      sha256 "6da0617e134221b95b8b0ab9880f2a77947590daf19d31ac024978da54502032"
    end
    on_intel do
      url "https://github.com/agentic-tooling/agentsync/releases/download/v0.0.1/agentsync-v0.0.1-linux-amd64.tar.gz"
      sha256 "118720b4ff09c1831a478cf7ca5b010139dc8d668b5e523af85ed51b04de0385"
    end
  end

  def install
    bin.install "agentsync"
  end

  test do
    assert_match "agentsync v#{version}", shell_output("#{bin}/agentsync --version")
  end
end
