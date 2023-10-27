const VGA_BUFFER = 0xB8000;
const VGA_WIDTH = 80;
const VGA_HEIGHT = 25;
const VGA_SIZE = VGA_WIDTH * VGA_HEIGHT;

pub const Color = enum(u4) { BLACK = 0, BLUE = 1, GREEN = 2, CYAN = 3, RED = 4, MAGENTA = 5, BROWN = 6, WHITE = 7, GRAY = 8, LBLUE = 9, LGREEN = 0xA, LCYAN = 0xB, LRED = 0xC, LMAGENTA = 0xD, YELLOW = 0xE, BRIGHTWHITE = 0xF };

///
/// VgaEntry representes each character on the vga buffer.
/// Total size is 16-bit
///
pub const VgaEntry = packed struct {
    char: u8,
    bg: Color, // foreground color
    fg: Color, // background color
};

pub const Tty = struct {
    buffer: *volatile [VGA_SIZE]VgaEntry,
    pub fn init(buffer: *volatile [VGA_SIZE]VgaEntry) Tty {
        return Tty{ .buffer = buffer };
    }
    pub fn put_chr(self: Tty, x: *const u8, y: *const u8, entry: VgaEntry) void {
        self.buffer[x.* * y.*] = entry;
    }
    pub fn test1(self: Tty, x: u8, y: u8) void {
        _ = y;
        _ = x;
        _ = self;
    }
};