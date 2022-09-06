class NysScheduler < Formula
  desc "Simple task scheduling and automation for MacOS & Linux"
  homepage "https://github.com/NateSeymour/scheduler"
  url "https://github.com/NateSeymour/scheduler/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "9b82437ebe2484972f382c374ec4bae62888843bce297d9d4b84f2ac83eb9d18"
  license "MIT"

  depends_on "sqlite"
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build", "--target=nys-scheduler"
    system "cmake", "--install", "build"
  end

  test do
    system "${bin}/libnys_test"
  end
end
