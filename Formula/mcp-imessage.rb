class McpImessage < Formula
  desc "Full iMessage MCP server with contacts support"
  homepage "https://github.com/antondkg/mcp-imessage"
  url "https://github.com/antondkg/mcp-imessage/releases/download/v0.1.3/mcp-imessage-aarch64-apple-darwin.tar.gz"
  sha256 "0928318e8dd100345ac6f69ec799f839a12b112e84c1bc898b25672cf6ebb804"
  version "0.1.3"

  def install
    bin.install "mcp-imessage"
  end

  def caveats
    <<~EOS
      mcp-imessage requires Full Disk Access to read ~/Library/Messages/chat.db.
      Grant it in System Settings > Privacy & Security > Full Disk Access.

      messages_send is disabled by default.
      Set MCP_IMESSAGE_ENABLE_SEND=1 if you want to enable sending.

      Messages.app must be running for messages_send to work when enabled.

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
