cask "prtscn" do
  version "0.20.0"
  sha256 "b3e2285203eee4a4dd3fad63a0505060c8be6529c571a4d29443e7903e49dc8c"

  url "https://github.com/nx-alejandrolacasa/prtscn/releases/download/v#{version}/PrtScn-#{version}.dmg"
  name "PrtScn"
  desc "Menu-bar screenshot utility"
  homepage "https://github.com/nx-alejandrolacasa/prtscn"

  auto_updates true
  depends_on macos: :tahoe

  app "PrtScn.app"

  # The app is signed with a stable self-signed certificate, not notarized;
  # without this Gatekeeper refuses to launch it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PrtScn.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.alejandrolacasa.prtscn.plist",
  ]
end
