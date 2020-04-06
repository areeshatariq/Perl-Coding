# Reading a file
#!/usr/bin/perl
use strict;
use warnings;

use Path::Tiny;
use autodie; # die if problem reading or writing a file

my $dir = path("/tmp");
my $file = $dir->child("file.txt");
my $content = $file->slurp_utf8();
my $file_handle = $file->openr_utf8();

# Read in line at a time
while( my $line = $file_handle->getline() ) {
        print $line;
}