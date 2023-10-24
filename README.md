# Linux PDF Generator

Simple BASH script to generate a single PDF from a list of PDF and JPEG/JPG files.  
This script has been created as I need to create a single PDF for my business expenses. And I tend to have PDF files and pictures of receipts taken with my phone.  

## Requirements

This script has been tested on Ubuntu/Debian, including Windows WSL.  
It requires the following packages:  

* convert
* gs / ghostscript


## Usage

To use this scrip, simply clone it, make sure it's executable, and run it, providing the full path where all your files are stored.  
```
./gen_single_pdf.sh <full path>
```
**IMPORTANT:** 
* This script append files in alphabetical order: make sure you name these files accordingly.
* It works with PDF / JPEG / JPG files ONLY.

Happy PDF'ing ;-)