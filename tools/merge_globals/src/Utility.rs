//!
//!
//!
//!

// 標準ライブラリ取り込み
use std::collections::HashMap;
use std::fs::File;
use std::io::{BufRead, BufReader, Error};

// 正規表現ライブラリ取り込み
extern crate regex;
use regex::Regex;

// Encoding handler
use encoding_rs::WINDOWS_1252;
use encoding_rs_io::DecodeReaderBytesBuilder;

pub struct GlobalDict {
    store: HashMap<String, String>
}

impl GlobalDict {
    pub fn new() -> Result<GlobalDict, Error> {
        let store = HashMap::new();

        Ok(GlobalDict{store})
    }

    // global.ini 形式のファイルを取り込み、HashMap<String,String>の保持する。
    pub fn merge(&mut self, filename:&String) {
        let re = Regex::new(r"^(.+)=(.*)$").unwrap();

        let file = match File::open(filename) {
            Err(_) => panic!("Failed to open file : {}", filename),
            Ok(file) => file,
        };

        let reader = BufReader::new(DecodeReaderBytesBuilder::new()
                        .encoding(Some(WINDOWS_1252))
                        .build(file));
    
        for (i, rst) in reader.lines().enumerate() {
            let line_number :u32 = (i+1).try_into().unwrap();
            if let Ok(line) = rst {
                if re.is_match(&line) {
                    let caps = re.captures(&line).unwrap();
                    self.store.insert((&caps[1]).to_string(), (&caps[2]).to_string());    
                } else {
                    println!("No match : {}", line);
                }    
            } else {
                println!("Invalid line : {}", line_number);
            }
        }
    }

    pub fn exists(&self, keyname:String) -> bool {
        let val = self.store.get(&keyname);
        match val {
            Some(_) => true,
            None => false
        }
    }

    pub fn update(&self, basefile:&String) -> Result<(), Error> {
        let re = Regex::new(r"^(.+)=(.*)$").unwrap();

        let file = File::open(basefile)?;

        let reader = BufReader::new(DecodeReaderBytesBuilder::new()
            .encoding(Some(WINDOWS_1252))
            .build(file));

        for (i, rst) in reader.lines().enumerate() {
            let line_number :u32 = (i+1).try_into().unwrap();
            if let Ok(line) = rst {
                if re.is_match(&line) {
                    let caps = re.captures(&line).unwrap();
                    let keyname = &caps[1];
                    let val = self.store.get(keyname);
                    match val {
                        Some(_) => {println!("{}={}", keyname, val.unwrap())},
                        None    => {println!("{}", line)}
                    }
                } else {
                    println!("No match : {}", line);
                }    
            } else {
                println!("Invalid line : {}", line_number);
            }
        }
        Ok(())
    }

    pub fn count(&self) -> usize {
        self.store.len()
    }
}

