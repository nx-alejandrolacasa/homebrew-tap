cask "insert" do
  version "0.17.1"
  sha256 "c2f184ad610c8f9903f5a029a5cf9090c934455e45a98efe7c6088cd54db6d24"

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
