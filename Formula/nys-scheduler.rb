class NysScheduler < Formula
  desc "Simple task scheduling and automation for MacOS & Linux"
  homepage "https://github.com/NateSeymour/scheduler"
  url "https://github.com/NateSeymour/scheduler/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "bd4180609480fc591c229903a3a512a608d2b5f93799da4104d454667e426fde"
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
