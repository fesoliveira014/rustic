# `rustic`

`rustic` is an experimental kernel being developed for learning purposes. This project is based on [Writing an OS in Rust](https://os.phil-opp.com/).

## Building

You must install `cargo-xbuild` and `bootimage` first:

```
cargo install cargo-xbuild bootimage
```

Now you can build the project with 

```
cargo xbuild
```

## Running

If you have QEMU installed and in your Path, just run

```
cargo xrun
```

This is equivalent to the running the following commands from the project root:

```
cargo bootimage
qemu-system-x86_64 -drive format=raw,file=target/x86_64-rustic_os/debug/bootimage-rustic.bin
```