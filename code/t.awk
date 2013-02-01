#!/usr/bin/env awk

BEGIN { FS = "\t";OFS = "\t"}

{
    if($7 == "Dolphin http client/9.3.0(90) (Android)" ||
	$7 == "Dolphin http client/9.2.1(89) (Android)"){
	print $2, substr($4, 8)
    }
}

