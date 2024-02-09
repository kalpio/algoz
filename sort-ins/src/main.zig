const std = @import("std");
const expect = std.testing.expect;

pub fn main() !void {
    var arr = [100]i32{ 30, 5, 20, 17, 34, 51, 87, 49, 7, 57, 73, 47, 100, 59, 60, 97, 62, 87, 5, 68, 70, 33, 89, 96, 14, 47, 42, 83, 55, 5, 77, 70, 86, 79, 52, 95, 26, 64, 25, 35, 25, 80, 9, 21, 42, 45, 88, 23, 30, 56, 13, 82, 1, 35, 99, 60, 85, 29, 16, 19, 25, 15, 18, 98, 48, 8, 67, 2, 7, 75, 88, 82, 97, 27, 14, 1, 25, 17, 61, 99, 18, 82, 1, 35, 96, 78, 9, 46, 41, 23, 18, 37, 25, 74, 24, 39, 41, 94, 97, 16 };

    var result = insertion_sort(arr[0..]);

    std.debug.print("{any}", .{result});
}

fn insertion_sort(arr: []i32) []i32 {
    var j: usize = 1;
    while (j < arr.len) : (j += 1) {
        var key = arr[j];
        var i: i32 = @intCast(j - 1);
        while (i >= 0 and arr[@intCast(i)] > key) {
            arr[@intCast(i + 1)] = arr[@intCast(i)];
            i = i - 1;
        }
        arr[@intCast(i + 1)] = key;
    }

    return arr;
}

test "insertion_sort" {
    var data = [_]i32{ 4, 3, 4, 6, 7, 10 };
    var got = insertion_sort(data[0..]);
    var exp = [_]i32{ 3, 4, 4, 6, 7, 10 };

    try expect(std.mem.eql(i32, got, exp[0..]));
}
