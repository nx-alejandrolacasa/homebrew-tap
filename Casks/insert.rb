cask "insert" do
  version "0.19.1"
  sha256 "bb1de92f6535afc7f4f961e60b4cb06b5cf172b790d312077ead770c8411736c"

  url "https://github.com/nx-alejandrolacasa/insert/releases/download/v#{version}/Insert-#{version}.dmg"
  name "Insert"
  desc "Calm, native macOS app for projects, notes and tasks — stored as plain Markdown"
  homepage "https://github.com/nx-alejandrolacasa/insert"

  depends_on macos: :tahoe

  app "Insert.app"

  # The app is signed with a stable self-signed certificate, not notarized;
  # without this Gatekeeper refuses to launch it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Insert.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.alejandrolacasa.insert.plist",
  ]
end
