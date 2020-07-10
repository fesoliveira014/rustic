@echo off
echo Launching VS Code with RUSTFLAGS...
set RUSTFLAGS=--sysroot %~dp0target\sysroot
cmd /C code %~dp0