const std = @import("std");
const Target = std.Target;
const CrossTarget = std.zig.CrossTarget;

pub fn build(b: *std.Build) void {
    const target = CrossTarget{
        .cpu_arch = Target.Cpu.Arch.x86,
        .os_tag = Target.Os.Tag.freestanding,
        .abi = Target.Abi.none,
    };

    const optimize = b.standardOptimizeOption(.{});

    const kernel = b.addObject(.{
        .name = "kernel.o",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    const install_kernel = b.addInstallFile(kernel.getEmittedBin(), "../build/kernel.o");
    b.getInstallStep().dependOn(&install_kernel.step);
}
