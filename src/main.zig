const tty = @import("tty.zig");

export fn _start() noreturn {
    var printer = tty.Tty.init();
    printer.clear();

    // while (i < 10) {
    //     printer.put_chr(1, i, tty.VgaEntry{ .char = 'A' + i, .bg = tty.Color.RED });
    //     i = i + 1;
    // }
    // printer.println("Hello\n");
    // var x: u8 = 0;
    // for ("Kirwe") |chr| {
    //     printer.put_chr(x, 3, tty.VgaEntry{ .char = chr });
    //     x += 1;
    // }
    var str = "Kirwe";
    _ = str;

    // var i: usize = 0;
    // var x_1: u8 = 0;
    // while (i < str.len) : (i += 1) {
    //     const chr: u8 = str[i];
    //     printer.put_chr(x_1, 5, tty.VgaEntry{ .char = chr });
    //     x_1 += 1;
    // }

    printer.put_chr(10, 10, tty.VgaEntry{ .char = 72 });
    printer.println("Hello!");
    while (true) {}
}
