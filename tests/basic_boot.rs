#![no_std]
#![no_main]
#![feature(custom_test_frameworks)]
#![test_runner(rustic::test_runner)]
#![reexport_test_harness_main = "test_main"]

use core::panic::PanicInfo;
use rustic::println;

#[no_mangle] // don't mangle the name of this function
pub extern "C" fn _start() -> ! {
    test_main();

    loop {}
}

fn test_runner(tests: &[&dyn rustic::Testable]) {
    rustic::test_runner(tests);
}

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    rustic::test_panic_handler(info);
}

#[test_case]
fn test_println() {
    println!("test_println output");
}