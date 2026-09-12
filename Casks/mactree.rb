cask "mactree" do
  version "1.0.1"
  sha256 "47e1f49e97af697fe6a28aa2bad985dd584bbd3b8b18e260df0606fbc69ab0c3"

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
    MacTree is not notarized. If macOS says it cannot be opened, go to
    System Settings > Privacy & Security and click "Open Anyway".

    For complete results, allow Full Disk Access when MacTree asks.
  EOS
end
