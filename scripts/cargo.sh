#!/bin/bash

export rust_default_toolchain=nightly

export crates=(
  cargo-edit
  rustfmt
  tock
)

export rustup_components=(
  rust-analysis
  rust-src
)

echo "
╔══════════════════════════════════════════════╗
║   Configuring Rust 🦀                        ║
╚══════════════════════════════════════════════╝
"
rustup self update
rustup update
rustup install ${rust_default_toolchain}
rustup default ${rust_default_toolchain}

echo "
╔══════════════════════════════════════════════╗
║   Installing Cargo Crates 📦                 ║
╚══════════════════════════════════════════════╝
"
install 'cargo install' ${crates[@]}

echo "
╔══════════════════════════════════════════════╗
║   Installing Rustup Components 📦            ║
╚══════════════════════════════════════════════╝
"
install 'rustup component add' ${rustup_components[@]}
