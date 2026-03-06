class Azguard < Formula
  desc "One command to make sure your Azure and AWS free tiers don't surprise you with a bill"
  homepage "https://github.com/cdobratz/AzGuard"
  license "MIT"
  version "1.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.5/azguard_1.0.5_darwin_arm64.zip"
      sha256 "3a360f4c1589e8ae67c14d14ed750eac27c65425db44d3d48ac405f9c73039b2"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.5/azguard_1.0.5_darwin_amd64.zip"
      sha256 "8ad0182e18903a2be7c86e38300be81a8620e2591e3bdbb80ab37250c1025a84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.5/azguard_1.0.5_linux_arm64.tar.gz"
      sha256 "87e7eeefe825f0975484a35558ca1a5fc80d0ab520b63b2f9ea4c056ff893ad6"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.5/azguard_1.0.5_linux_amd64.tar.gz"
      sha256 "fdf0e3b451d3c7a7587d451c76dd9784490368f8191f43fdcaa7663498b76d59"
    end
  end

  def install
    bin.install "azguard"
  end

  test do
    system "#{bin}/azguard", "--version"
  end
end
