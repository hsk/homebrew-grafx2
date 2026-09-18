class Grafx2 < Formula
  desc "256-color pixel art painting program"
  homepage "https://gitlab.com/GrafX2/grafx2"
  url "https://gitlab.com/GrafX2/grafx2.git",
      revision: "f84cb09dc59d706d6e7b28778b01ba911f52298c"
  version "2.9-59-gf84cb09d"
  license "GPL-2.0-only"
  revision 1
  head "https://gitlab.com/GrafX2/grafx2.git", branch: "master"

  depends_on "fontconfig"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "lua"
  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_ttf"

  # GrafX2's official release tags (last cut in 2024) predate the fix that
  # lets the project build against modern Homebrew-provided SDL2/Lua/etc. on
  # current macOS, so we pin to the commit that introduced that support.
  def install
    system "git", "submodule", "update", "--init", "--depth", "1", "tools/8x8fonts/font8x8"

    # Upstream always starts the file browser in the user's home folder on
    # macOS (getMacosUserFolder(), i.e. NSHomeDirectory()), which makes
    # sense for a double-clicked .app bundle but not for this CLI build,
    # where `grafx2` is launched from a terminal and should start browsing
    # from the directory it was invoked in, like on every other platform.
    inreplace "src/main.c",
              "Main.selector.Directory = getMacosUserFolder();",
              "Main.selector.Directory = Get_current_directory(NULL, &Main.selector.Directory_unicode, 0);"

    system "make", "grafx2"
    system "make", "-C", "src", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "Mach-O", shell_output("file #{bin}/grafx2")
  end
end
