cask "prtscn" do
  version "0.18.7"
  sha256 "b332da13332fb3cafe48866ba116f65d2c2d7a5353a7be1ddb262dfb72412e3e"

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
