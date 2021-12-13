class Libbsat < Formula
  desc "\"Be smart about timeouts\" libev timeout utility library."
  homepage "https://github.com/andrew-canaday/libbsat"
  url "https://github.com/andrew-canaday/libbsat/releases/download/0.1.1/libbsat-0.1.1.tar.gz"
  sha256 "a0910987f577f66a9a56844cedaaca232883908644e3370cc1dbca92d8e0acec"
  license "MIT"
  depends_on "libev"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~'EOS'
      /* Wait for stdin to become readable, then read and echo the first line. */

      #include <stdio.h>
      #include <stdlib.h>
      #include <unistd.h>
      #include <ev.h>
      #include <bsat.h>

      #define TIMEOUT 0.25
      int timed_out = 0;
      struct ev_loop* loop = NULL;

      static void timeout_failed_cb(EV_P_ ev_timer* w, int revents)
      {
        ev_break(loop, EVBREAK_ALL);
        return;
      }

      static void timeout_ok_cb(bsat_toq_t* toq, bsat_timeout_t* timeout)
      {
        timed_out = 1;
        ev_break(loop, EVBREAK_ALL);
        return;
      }

      int main() {
        loop = ev_default_loop(0);

        /* We'll add an ev timer to be sure that the test doesn't
         * run forever if something is wrong with the bsat build:
         */
        ev_timer fail_timeout;
        ev_timer_init(&fail_timeout, timeout_failed_cb, TIMEOUT*2, 0.0);

        bsat_toq_t toq;
        bsat_toq_init(loop, &toq, timeout_ok_cb, TIMEOUT);

        bsat_timeout_t ok_timeout;
        bsat_timeout_init(&ok_timeout);
        bsat_timeout_start(&toq, &ok_timeout);
        ev_run(loop, 0);

        if( !timed_out ) {
          return -1;
        }

        return 0;
      }
    EOS
    system ENV.cc, "test.c", "-I#{HOMEBREW_PREFIX}/include", "-I#{include}", "-L#{HOMEBREW_PREFIX}/lib", "-L#{lib}", "-lbsat", "-lev", "-o", "test"
    system "./test"
  end
end


