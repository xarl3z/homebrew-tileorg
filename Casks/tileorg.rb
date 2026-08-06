cask "tileorg" do
  version "0.1.8"
  sha256 "3457444de91a5015832de55b6eeb090857b7bcc1094f8440a81bc0aad421550c"

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
