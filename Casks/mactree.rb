cask "mactree" do
  version "1.0.2"
  sha256 "d08f581c00865e2a06366e253eb9ccf8d903a6723c8570b15378bb0a22a289d5"

  url "https://github.com/aodjo/macTree/releases/download/v#{version}/MacTree-v#{version}.zip"
  name "MacTree"
  desc "WizTree-style disk space analyzer with a zoomable treemap"
  homepage "https://github.com/aodjo/macTree"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "MacTree.app"
  binary "#{appdir}/MacTree.app/Contents/MacOS/MacTree", target: "mactree"

  uninstall quit: "com.aodjo.MacTree"

  zap trash: [
    "~/Library/Preferences/com.aodjo.MacTree.plist",
    "~/Library/Saved Application State/com.aodjo.MacTree.savedState",
  ]

  caveats <<~EOS
    For complete results, allow Full Disk Access when MacTree asks.
  EOS
end
