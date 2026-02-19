class Azguard < Formula
  desc "One command to make sure your Azure free tier doesn't surprise you with a bill"
  homepage "https://github.com/cdobratz/AzGuard"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.0/azguard_1.0.0_darwin_arm64.zip"
      sha256 "a177b9169a7ffa482c3383a0d2c847a11afd2e5a22f6f85b80e773bee643e163"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.0/azguard_1.0.0_darwin_amd64.zip"
      sha256 "009fdfd82332ca867c6bbc682a07fa94a8f40c3e2f4c0d605342bb7c1f8968eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.0/azguard_1.0.0_linux_arm64.tar.gz"
      sha256 "cd1edb898deaa17074ffee9a7713f1086bae475330708368243f5c9530fcd78c"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.0/azguard_1.0.0_linux_amd64.tar.gz"
      sha256 "56d43962d9672c95a17181bb99b11d6fce53ea9a93ef2f59f266607ff2408ade"
    end
  end

  def install
    bin.install "azguard"
  end

  test do
    system "#{bin}/azguard", "--version"
  end
end
