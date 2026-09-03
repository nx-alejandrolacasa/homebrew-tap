cask "insert" do
  version "0.20.0"
  sha256 "c8f4948297ec58d63272b145feda998319700716c317f9723bc88fe43530192d"

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
