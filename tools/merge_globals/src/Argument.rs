//!
//!
//!


#[derive(Debug)]
pub struct Argument {
    origin: Vec<String>,
}

impl Argument {
    pub fn new(args: &Vec<String>) -> Argument {
        let origin = args.clone();

        Argument { origin }
    }

    pub fn basefile(&self) -> Option<&String> {
        return self.origin.get(1);
    }

    pub fn translated(&self) -> Vec<String> {
        let mut files: Vec<String> = vec![];
        let mut flag = 0;
        for file in &self.origin {
            if flag < 2 {
                flag += 1;
                continue;
            }
            files.push(file.to_string());
        }

        return files;
    }
}