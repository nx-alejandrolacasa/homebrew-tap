cask "prtscn" do
  version "0.30.0"
  sha256 "42f0004cf0a5cd00785af309697068b8c9724b3a36e2d8bdfdea58c9ab4b16c0"

  url "https://github.com/nx-alejandrolacasa/prtscn/releases/download/v#{version}/PrtScn-#{version}.dmg"
  name "PrtScn"
  desc "Menu-bar screenshot utility"
  homepage "https://github.com/nx-alejandrolacasa/prtscn"

  auto_updates true
  depends_on macos: :tahoe

  app "PrtScn.app"

  # The app is signed with a stable self-signed certificate, not notarized;
  # without this Gatekeeper refuses to launch it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/PrtScn.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.alejandrolacasa.prtscn.plist",
  ]
end
