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
    bg: Color = Color.BLACK, // foreground color
    fg: Color = Color.WHITE, // background color
};

///
/// Cursor of the Tty
/// it has position, and blink
///
pub const Cursor = struct {
    x: u16,
    y: u16,
    blink: bool,
    pub fn init() Cursor {
        return Cursor{ .x = 0, .y = 0, .blink = false };
    }
};

pub const Tty = struct {
    buffer: *volatile [VGA_SIZE]VgaEntry,
    cursor: Cursor,
    pub fn init() Tty {
        var buffer: *volatile [25 * 80]VgaEntry = @ptrFromInt(VGA_BUFFER);

        return Tty{ .buffer = buffer, .cursor = Cursor.init() };
    }
    pub fn put_chr(self: Tty, x: usize, y: usize, entry: VgaEntry) void {
        self.buffer[y * VGA_WIDTH + x] = entry;
    }
    /// Clears the vga text buffer
    pub fn clear(self: Tty) void {
        for (0..self.buffer.len) |i| {
            self.buffer[i] = VgaEntry{ .char = ' ', .bg = Color.BLACK, .fg = Color.BLACK };
        }
    }
    pub fn println(self: *Tty, str: []const u8) void {
        for (str) |chr| {
            // Add newline and update cursor
            if (chr == '\n') {
                self.cursor.y += 1;
                continue;
            }

            self.put_chr(self.cursor.x, self.cursor.y, VgaEntry{ .char = chr });
            self.cursor.x += 1;
        }
        // Add newline and update cursor
        self.cursor.y += 1;
    }
};
