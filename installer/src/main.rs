use log::{error, info, warn};
use std::{
    env::{set_var, var},
    path::PathBuf,
    process::exit,
};

fn init_logger() {
    if var("RUST_LOG").is_err() {
        unsafe { set_var("RUST_LOG", "info") };
    }
}

fn get_home_path() -> PathBuf {
    match var("HOME") {
        Ok(s) => return PathBuf::from(s),
        Err(e) => {
            error!("failed to get home environment variable: {}", e);
            exit(-1);
        }
    }
}

fn check_cache() -> bool {
    let mut home_path = get_home_path();
    let mut local_path = home_path;
}

fn main() {
    init_logger();
    println!("Hello, world!");
}
