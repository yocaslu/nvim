use log::{error, info, warn};
use std::{
    env::{current_dir, set_var, var},
    fs::{create_dir, remove_dir_all},
    io::Error,
    os::unix::fs::symlink,
    path::PathBuf,
    process::exit,
};

fn init_logger() {
    unsafe { set_var("RUST_LOG", "trace") };
    env_logger::init();
}

fn get_home_path() -> PathBuf {
    match var("HOME") {
        Ok(s) => return PathBuf::from(s),
        Err(e) => {
            error!("failed to get $HOME: {}", e);
            exit(-1);
        }
    }
}

fn clean_config() -> Result<(), Error> {
    let config_path = get_home_path().join(".config");

    if !config_path.exists() {
        info!("creating: {:?}", &config_path);
        create_dir(&config_path)?;
    }

    let nvim_config: PathBuf = config_path.join("nvim");
    if nvim_config.exists() {
        warn!("deleting: {:?}", &nvim_config);
        remove_dir_all(nvim_config)?;
    }

    Ok(())
}

fn clean_cache() -> Result<(), Error> {
    let local_path: PathBuf = get_home_path().join(".local/");

    if !local_path.exists() {
        info!("creating: {:?}", &local_path);
        create_dir(&local_path)?;
        return Ok(());
    }

    for subdir in ["share/nvim", "state/nvim"] {
        let path: PathBuf = local_path.join(subdir);
        if path.exists() {
            warn!("deleting: {:?}", &path);
            remove_dir_all(path)?;
        } else {
            info!("nvim not found in {:?}", path)
        }
    }

    Ok(())
}

fn install() -> Result<(), Error> {
    let repo_nvim_path: PathBuf = current_dir()?.join("nvim/");
    let home_config_path: PathBuf = get_home_path().join(".config/");

    if repo_nvim_path.exists() {
        symlink(&repo_nvim_path, &home_config_path.join("nvim"))?;
    } else {
        error!("{:?} does not exist.", &repo_nvim_path);
    }

    Ok(())
}

fn main() {
    init_logger();
    match clean_cache() {
        Ok(()) => info!("cache succefully cleaned."),
        Err(e) => {
            error!("failed to clean cache: {}", e);
            exit(-1);
        }
    }

    match clean_config() {
        Ok(()) => info!("config succefully cleaned."),
        Err(e) => {
            error!("failed to clean config: {}", e);
            exit(-1);
        }
    }

    let home_path: PathBuf = get_home_path();
    match install() {
        Ok(()) => info!("nvim config linked to {:?}", home_path.join(".config/")),
        Err(e) => {
            error!(
                "failed to link nvim config to {:?} due to: {}",
                home_path.join(".config/"),
                e
            );

            exit(-1);
        }
    };
}
