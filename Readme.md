# Prescription parser


## Install, run and testing

### Requirements:

- rvm or rbenv
- ruby 3.0.0
- bundler version 2.2.3

### Pre-run steps:


$ cd Prescription/


### Usage

#### Grant permissions:


$ chmod +x bin/main


#### Running the script:


$ bin/main public/pharmacy_system.txt

## Folders

### Bin Folder:

- main - a written script for calling a class, to which I will pass the necessary classes as parameters. ARGV - array of arguments that we pass when running the script on the command line.

### Lib Folder:

- application.rb
- reader.rb 
- data_collector.rb
- drug_counter.rb
- total_income.rb
- printer.rb
- performance.rb

### Public Folder:

- pharmacy_system.txt - the file with the sample of input data.
