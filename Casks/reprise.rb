cask "reprise" do
  version "1.0.0"
  sha256 "1282aa66edc03d0280602c1845dc7d278d70596b7c0804d6b86d12bcbdd48f0f"

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
