class Azguard < Formula
  desc "One command so Azure and AWS free tiers don't surprise you with a bill"
  homepage "https://github.com/cdobratz/AzGuard"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.2.1/azguard_1.2.1_darwin_arm64.zip"
      sha256 "87da7298c00af8d8d1fa31b8e6fd6ae9f755390118447df031b3dc87d7fd5fac"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.2.1/azguard_1.2.1_darwin_amd64.zip"
      sha256 "1e033d043d73e194f25286ab2c2349d78f1dfcc817b4a50a961dedade3df1962"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.2.1/azguard_1.2.1_linux_arm64.tar.gz"
      sha256 "7d130c4296c380e1b7c210c1c3d7a01f15a136afd7cc4bbc03587fe3448a4587"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.2.1/azguard_1.2.1_linux_amd64.tar.gz"
      sha256 "b1d9cd9f2b0be5601bf26c0c589cb78634bdc13dd18dc24657a85a5981ce9d02"
    end
  end

  def install
    bin.install "azguard"
  end

  test do
    system bin/"azguard", "--version"
  end
end
