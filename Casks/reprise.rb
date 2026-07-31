cask "reprise" do
  version "1.1.0"
  sha256 "e363288ff12eab68b140ae056852a0acec838519af937ddef85c877f050cf528"

  url "https://github.com/aodjo/Reprise/releases/download/v#{version}/Reprise-#{version}-macos-universal.zip",
      verified: "github.com/aodjo/Reprise/"
  name "Reprise"
  desc "Control Spotify, Apple Music, and YouTube Music from the menu bar"
  homepage "https://junx.dev/"

  livecheck do
    url "https://github.com/aodjo/Reprise"
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
