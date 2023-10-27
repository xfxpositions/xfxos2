const tty = @import("tty.zig");

export fn _start() noreturn {
    var printer = tty.Tty.init();
    printer.clear();

    var i: u8 = 0;
    while (i < 10) {
        printer.put_chr(1, i, tty.VgaEntry{ .char = 'A' + i, .bg = tty.Color.RED });
        i = i + 1;
    }

    while (true) {}
}
