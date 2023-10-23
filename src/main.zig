const tty = @import("tty.zig");

export fn _start() noreturn {
    var buffer: *volatile [25 * 80]tty.VgaEntry = @ptrFromInt(0xb8000);

    var printer = tty.Tty.init(buffer);
    printer.test1(1, 2);
    printer.put_chr(&1, &1, tty.VgaEntry{ .char = 'A', .bg = tty.Color.RED, .fg = tty.Color.WHITE });

    while (true) {}
}
