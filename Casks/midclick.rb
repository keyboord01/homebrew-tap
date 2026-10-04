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

  depends_on macos: :monterey

  app "MidClick.app"

  # The app is not notarized, so clear the download quarantine to let it open without a Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/MidClick.app"],
        writable_paths: ["MidClick.app"],
        writable_base:  :appdir,
        must_succeed:   false
  end

  uninstall quit: "io.github.keyboord01.MidClick"

  zap trash: "~/Library/Preferences/io.github.keyboord01.MidClick.plist"

  caveats <<~EOS
    Start MidClick and flip the switch in the window that opens:
      open -a MidClick
  EOS
end
