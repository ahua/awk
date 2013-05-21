#!/usr/bin/env awk

BEGIN { FS = "\t";OFS = "\t"}

{
    if($7 == "Dolphin http client/10.0.0(95) (Android)" ||
       $7 == "Dolphin http client/10.0.1(96) (Android)" ||
       $7 == "Dolphin http client/10.0.2(97) (Android)" ||
       $7 == "Dolphin http client/10.0.3(98) (Android)" ||
       $7 == "Dolphin http client/10.1.0(99) (Android)" ||
       $7 == "Dolphin http client/10.1.1(100) (Android)"){
	ip = $2
	domain = substr($4, 8)
	url = substr($3, 5)
	path = substr(url, length(domain)+1)
	if(! path){
	    path = "/"
	}
	i = index(substr(path, 2), "/")
	if(i){
	    path = substr(path, 1, i)
	}

	print $1, $2, domain, path, $7
    }
}

