cask "prtscn" do
  version "0.27.0"
  sha256 "572b52f0113ba4b36fee979652023f5d37f7bb4024f26625a42a3f6428587b50"

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
