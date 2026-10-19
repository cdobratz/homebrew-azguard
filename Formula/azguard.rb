class Azguard < Formula
  desc "One command so Azure and AWS free tiers don't surprise you with a bill"
  homepage "https://github.com/cdobratz/AzGuard"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.1.0/azguard_1.1.0_darwin_arm64.zip"
      sha256 "2ef1159773d9c41f770ad2baa4add6e6fd3eb9f9e6763edd6be19f704910c4e3"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.1.0/azguard_1.1.0_darwin_amd64.zip"
      sha256 "1245863df6f5281b4bbfdc246f4c97c65129639536dcf5404387a8dc89a6c5fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.1.0/azguard_1.1.0_linux_arm64.tar.gz"
      sha256 "9b822ee162be34634f32929d757651002e47200a3ae9b647053724a292358ee9"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.1.0/azguard_1.1.0_linux_amd64.tar.gz"
      sha256 "305d47f06622cdad8a98660ed323f1b2d662c4aa2b2689189f7da54edf019909"
    end
  end

  def install
    bin.install "azguard"
  end

  test do
    system bin/"azguard", "--version"
  end
end
