cask "tileorg" do
  version "0.2.1"
  sha256 "1e32fb585539a5f1046720062adfdc20b233a243dce2997408ccff8a9f98dbb6"

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
