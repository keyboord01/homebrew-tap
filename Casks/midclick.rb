cask "midclick" do
  version "1.0.0"
  sha256 "2b69c8ba38071d02ac38fb42fc3f3783b2a1972899a1b8e4a01917d1b158f872"

  url "https://github.com/keyboord01/MidClick/releases/download/v#{version}/MidClick.zip"
  name "MidClick"
  desc "Three-finger click becomes a middle click on trackpads and Magic Mouse"
  homepage "https://github.com/keyboord01/MidClick"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "MidClick.app"

  # The app is not notarized, so clear the download quarantine, then launch it so the
  # one-switch setup window appears right away.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MidClick.app"]
    system_command "/usr/bin/open", args: ["#{appdir}/MidClick.app"]
  end

  uninstall quit: "io.github.keyboord01.MidClick"

  zap trash: "~/Library/Preferences/io.github.keyboord01.MidClick.plist"
end
