class Azguard < Formula
  desc "One command to make sure your Azure free tier doesn't surprise you with a bill"
  homepage "https://github.com/cdobratz/AzGuard"
  license "MIT"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.3/azguard_1.0.3_darwin_arm64.zip"
      sha256 "0efc4890d1802fdea8730d422cedb439c2fbd3a019615fa412920f30b2a289ab"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.3/azguard_1.0.3_darwin_amd64.zip"
      sha256 "b97365c98257316b0af44263c62425f18f0673edb533cfae8a0a6b94297ff244"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.3/azguard_1.0.3_linux_arm64.tar.gz"
      sha256 "13985f371985fd86173acb6d5b05d5419e28c256bd0f126097ea6f4aa5e496c7"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.3/azguard_1.0.3_linux_amd64.tar.gz"
      sha256 "98e06786e59a528241abd1a46c5b87136ba41c3e7f7ae0898212c3d1b86546a0"
    end
  end

  def install
    bin.install "azguard"
  end

  test do
    system "#{bin}/azguard", "--version"
  end
end
