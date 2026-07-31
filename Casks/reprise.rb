cask "reprise" do
  version "1.0"
  sha256 "d0bab6befba5ca483134a6afdb71a2f5b314e901641a719a39d58ed7ecb24c84"

  url "https://github.com/aodjo/reprise-releases/releases/download/v#{version}/Reprise-#{version}-macos-universal.zip",
      verified: "github.com/aodjo/reprise-releases/"
  name "Reprise"
  desc "Control Spotify and Apple Music from the menu bar"
  homepage "https://junx.dev/"

  livecheck do
    url "https://github.com/aodjo/reprise-releases"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Reprise.app"

  uninstall quit: "dev.junx.Reprise"

  zap trash: [
    "~/Library/Application Scripts/dev.junx.Reprise",
    "~/Library/Caches/dev.junx.Reprise",
    "~/Library/Containers/dev.junx.Reprise",
    "~/Library/HTTPStorages/dev.junx.Reprise",
    "~/Library/Preferences/dev.junx.Reprise.plist",
  ]
end
