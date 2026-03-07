class McpImessage < Formula
  desc "Full iMessage MCP server with contacts support"
  homepage "https://github.com/antondkg/mcp-imessage"
  url "https://github.com/antondkg/mcp-imessage/releases/download/v0.1.0/mcp-imessage-aarch64-apple-darwin.tar.gz"
  sha256 "c064879e1bcb66cdf07795f887ec8a4c4a682b7579d2740ff12b9ef9a49028b0"
  version "0.1.0"

  def install
    bin.install "mcp-imessage"
  end

  def caveats
    <<~EOS
      mcp-imessage requires Full Disk Access to read ~/Library/Messages/chat.db.
      Grant it in System Settings > Privacy & Security > Full Disk Access.

      Messages.app must be running for messages_send to work.

      Add to your MCP config (~/.agents/mcp.json):
        "imessage": {
          "command": "#{opt_bin}/mcp-imessage"
        }
    EOS
  end

  test do
    assert_predicate bin/"mcp-imessage", :exist?
  end
end
