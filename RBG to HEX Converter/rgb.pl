require 'cgi-lib.pl';

# print header:
&ReadParse(*in);
$blort=&PrintHeader;

print "$blort\n";

print "<HTML><HEAD><TITLE>RGBtoHex: Results</TITLE></HEAD><BODY>\n";
print "<H2>RGBtoHex: Result</H2>\n";
print "<HR>\n";
# check for all values:
if (($in{'red'} eq '') || ($in{'green'} eq '') || ($in{'blue'} eq '')) {
	print "You need to give all three values!";
}
else {
	print "<p> RGB values of $in{'red'} $in{'green'} $in{'blue'} 
equals the hexadecimal value <B>";
	printf (" #%2.2X%2.2X%2.2X\n",$in{'red'},$in{'green'},$in{'blue'});
}