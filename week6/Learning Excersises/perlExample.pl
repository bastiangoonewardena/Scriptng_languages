#! /usr/local/bin/perl

#Variables
$value="Bestman";

$x=5;
$x=$x+10;

print "Hellp world\tTab test\n";
print "This is more text\n";

#output the value
print "The variable value is $value\n";
print "The value of int are: $x\n";

#Text munupulation - Regular expression Type: 
if( $value =- m/.*man$/ ) {
    print("value ends with the letters an\n");
}
else{
    print("value does not end with the letters an\n");
}