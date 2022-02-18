# Copyright (C) 2020  Matthew "strager" Glazar
# See end of file for extended copyright information.

class QuickLintJs < Formula
  desc "Find bugs in your JavaScript code"
  homepage "https://quick-lint-js.com/"
  url "https://c.quick-lint-js.com/releases/2.2.0/source/quick-lint-js-2.2.0.tar.gz"
  license "GPL-3.0-or-later"
  head "https://github.com/quick-lint/quick-lint-js.git", branch: "master"

  depends_on "cmake" => :build

  fails_with :clang do
    build 1100  # Xcode 11.3.1
    cause "Boost.JSON doesn't like Clang's std::string_view"
  end

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
                      "-DQUICK_LINT_JS_INSTALL_EMACS_DIR=share/emacs/site-lisp/quick-lint-js",
                      "-DQUICK_LINT_JS_INSTALL_VIM_NEOVIM_TAGS=ON"
      system "cmake", "--build", "."
      system "cmake", "--install", "."
    end
  end

  test do
    system "quick-lint-js", "--version"
  end
end

# quick-lint-js finds bugs in JavaScript programs.
# Copyright (C) 2020  Matthew "strager" Glazar
#
# This file is part of quick-lint-js.
#
# quick-lint-js is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# quick-lint-js is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with quick-lint-js.  If not, see <https://www.gnu.org/licenses/>.
