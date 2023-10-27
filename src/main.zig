const tty = @import("tty.zig");

export fn _start() noreturn {
    var printer = tty.Tty.init();
    printer.clear();
    for (0..10) |i| {
        printer.put_chr(1, i, tty.VgaEntry{ .char = 'A', .bg = tty.Color.RED, .fg = tty.Color.WHITE });
    }
    while (true) {}
}
