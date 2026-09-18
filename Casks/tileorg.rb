cask "tileorg" do
  version "0.2.0"
  sha256 "c1338bb172d3d4023f029ae869b553ae3686315f2bd3e01b91a290a24fc7149d"

  url "https://github.com/xarl3z/tileorg-releases/releases/download/v#{version}/TileOrg.dmg",
      verified: "github.com/xarl3z/tileorg-releases/"

  name "TileOrg"
  desc "Project-based window organization with tiling for macOS"
  homepage "https://www.tileorg.com/"

  livecheck do
    url "https://www.tileorg.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "TileOrg.app"

  uninstall quit: "com.tileorg.TileOrg"

  zap trash: [
    "~/Library/Application Support/TileOrg",
    "~/Library/Caches/com.tileorg.TileOrg",
    "~/Library/Preferences/com.tileorg.TileOrg.plist",
  ]

  caveats <<~EOS
    TileOrg requires Accessibility permission to manage windows.
    Grant access in System Settings > Privacy & Security > Accessibility.
  EOS
end
