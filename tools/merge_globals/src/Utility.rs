//!
//!
//!
//!

use std::collections::HashMap;
use std::fs::File;
use std::io::{BufRead, BufReader, Error};

pub fn merge_dict(filename: String) -> Result<HashMap<String, String>, Error> {
    let mut dictionary:HashMap<String, String> = HashMap::new();

    for result in BufReader::new(File::open(filename)?).lines() {
        let line = result?;

        println!("{}", line);
    }

    return Ok(dictionary);
}