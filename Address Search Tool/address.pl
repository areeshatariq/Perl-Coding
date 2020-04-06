require 'cgi-lib.pl';

# grab values passed from form:
&ReadParse(*in);

print "Content-type: text/html\n\n";

# print the top part of the response
print "<HTML><HEAD><TITLE>Addresss Book Search Results</TITLE></HEAD>\n";
print "<BODY><H1>Addresss Book Search Results</H1>\n";

# read and parse data file
$data="address.data";

open(DATA,"$data") || die "Can't open $data: $!\n</BODY></HTML>\n";
while(<DATA>) {
	chop;	# delete trailing \n
	if (/^\s*$/) {
		# break between records
		if ($match) {
			# if anything matched, print the whole record
			&printrecord($record);
			$nrecords_matched++;
		}
		undef $match;
		undef $record;
		next;
	}
	# tag: value
	($tag,$val) = split(/:/,$_,2);
	if ($tag =~ /^Name/i) {
		$match++ if( $in{'Name'} && $val =~ /\b$in{'Name'}\b/i) ;
		$record = $val;
		next;
	}
	if ($tag =~ /^Address/i) {
		$match++ if( $in{'Address'} && $val =~ /\b$in{'Address'}\b/i) ;
		$record .= "\n<BR>$val" if ($val);
		next;
	}
	if ($tag =~ /^Home\s*Pho/i) {
		$match++ if( $in{'Hphone'} && $val =~ /\b$in{'Hphone'}\b/i) ;
		$record .= "\n<BR>Home: $val" if ($val);
		next;
	}
	if ($tag =~ /^Work/i) {
		$match++ if( $in{'Wphone'} && $val =~ /\b$in{'Wphone'}\b/i) ;
		$record .= "\n<BR>Work: $val" if ($val);
		next;
	}
	if ($tag =~ /^Email/i) {
		$match++ if( $in{'Email'} && $val =~ /\b$in{'Email'}\b/i) ;
		$record .= "\n<BR><A HREF=\"mailto:$val\">$val</A>" if ($val);
		next;
	}
	if ($tag =~ /Page/i) {
		$match++ if( $in{'WWW'} && $val =~ /\b$in{'WWW'}\b/i) ;
		$record .= "\n<BR><A HREF=$val>$val</A>" if ($val);
		next;
	}
	# anything else
	$record .= $_;
}
close DATA;

if (! defined $nrecords_matched)
{ print "<H2>No Matches</H2>\n"; }

print "</BODY></HTML>\n";
exit;

sub printrecord {
	local($buf) = @_;
	print "<P>\n$buf<P>\n";
}