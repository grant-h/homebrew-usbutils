class Usbutils < Formula
  desc "Linux's usbutils"
  homepage "https://github.com/grant-h/usbutils-portable"
  head "https://github.com/grant-h/usbutils-portable.git", :using => :git

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "libusb"
  depends_on "pkg-config" => :build

  def install
    args = %W[--prefix=#{prefix}]

    system "./autogen.sh", *args
    system "make"

    bin.install "lsusb"
    bin.install "usbhid-dump/src/usbhid-dump"
    share.install "usb.ids"

    man8.install 'lsusb.8'
    man8.install 'usbhid-dump.8'
  end
end
