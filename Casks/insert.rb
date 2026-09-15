cask "insert" do
  version "0.24.2"
  sha256 "07652ba1b07fc0021cd6d8e219e1f504559b4df8ba8c78c9326d7404d49ae32d"

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
