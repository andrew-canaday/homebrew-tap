class Pomd4c < Formula
  desc "Plain ol' Markdown for C — the least sophisticated doc generator for C projects since cat."
  homepage "https://github.com/andrew-canaday/pomd4c"
  url "https://github.com/andrew-canaday/pomd4c/archive/refs/tags/0.10.0.tar.gz"
  sha256 "717db6f9c802d8c362b1372fca3a043edc2a45257058190eb9ec77644d8e6938"
  license "MIT"

  def install
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    (testpath/"test.c").write <<~'EOS'
	/**
	* # pomd4c
	*/
	
	/**
	 * ## my_type
	 *
	 * This is some structure
	 */
	struct my_type {
	    int         counter;
	    const char* str;
	}
	
    EOS
    system "pomd4c", (testpath/"test.c")
    assert_equal "\n# pomd4c\n\n\n## my_type\n\nThis is some structure\n\n\n```C\nstruct my_type {\n    int         counter;\n    const char* str;\n}\n```\n\n", shell_output("pomd4c test.c")
  end
end

