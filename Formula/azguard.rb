class Azguard < Formula
  desc "One command to make sure your Azure free tier doesn't surprise you with a bill"
  homepage "https://github.com/cdobratz/AzGuard"
  license "MIT"
  version "1.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.4/azguard_1.0.4_darwin_arm64.zip"
      sha256 "6a64fcd0835cee2d5233a031f927d0f55c23d1c5713c806884f2bf75f5d06c08"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.4/azguard_1.0.4_darwin_amd64.zip"
      sha256 "9c504f9a076406bf330405cb79fd49f0a1caa8478bb5a5a17dfeb57067985f73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.4/azguard_1.0.4_linux_arm64.tar.gz"
      sha256 "75bb8426575bfa56613c761359820116da4f13bf8fa9938696be30c59b7db543"
    else
      url "https://github.com/cdobratz/AzGuard/releases/download/v1.0.4/azguard_1.0.4_linux_amd64.tar.gz"
      sha256 "dd83665056c34ee0f2a3d0ed8e645120ee428fc7b401b1707df481e3600d1e44"
    end
  end

  def install
    bin.install "azguard"
  end

  test do
    system "#{bin}/azguard", "--version"
  end
end
