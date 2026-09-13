cask "prtscn" do
  version "0.22.0"
  sha256 "23b3f678826930e6b3c46e5f23d6a2eee3a63070f99566f9e5553f79ee5d9ae5"

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
