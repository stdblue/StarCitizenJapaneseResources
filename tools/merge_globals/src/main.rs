//! Star Citizens localization resource merger
//!
//! This module merges translated resources in order left to right.
//! You can overwrite old translated resouce with new ones.
//!
//! # Usage
//!
//! ```
//!   merge_global global.ini [translated global.ini ...]
//!
//!  Options:
//!      global.ini : newest english resource
//!      translated global.ini : translated resource same with global.ini format
//!
//! ```

// 環境変数取得
use std::env;
use std::io::Error;

mod argument;
mod utility;

/// Startup
fn main() -> Result<(), Error> {

    // 引数取得
    let ops = argument::Argument::new( &(env::args().collect()) );

    println!("Global.ini basefile : {}", ops.basefile().unwrap());

    let mut gdict = utility::GlobalDict::new().unwrap();

    for file in ops.translated() {
        println!("Translated file {} : applying ...", file);
        gdict.merge(&file);
    }

    println!("Dictionary stored : {}", gdict.count());

    gdict.update(ops.basefile().unwrap());

    Ok(())
}
