cask "sill" do
  version "0.6.2-textfocus.1"
  sha256 "07c32834939fe54339c3b32290218e3a4d5cb4d9c97a95cc6ddcee8409b7da86"

  url "https://github.com/aminehmida/sill/releases/download/v#{version}/Sill.zip"
  name "Sill"
  desc "Window streaming to phones, with keyboards that follow text focus"
  homepage "https://github.com/aminehmida/sill"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-[\w.]+)?)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Sill.app"

  # Ad hoc signed and not notarized: without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Sill.app"]
  end

  zap trash: [
    "~/Library/Caches/me.saffer.sill.mac",
    "~/Library/Logs/Sill",
    "~/Library/Preferences/me.saffer.sill.mac.plist",
  ]

  caveats <<~EOS
    This build is ad hoc signed. After every install or upgrade, grant Sill Screen Recording
    and Accessibility again in System Settings › Privacy & Security, and choose Always Allow
    when macOS asks to let Sill use "Sill Remote Access" from your keychain (your paired
    devices live there).
  EOS
end
