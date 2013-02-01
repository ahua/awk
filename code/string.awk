#!/usr/bin/env awk

BEGIN { FS = "\t";OFS = "\t"}

{
    if($7 == "Dolphin http client/9.3.0(90) (Android)" ||
	$7 == "Dolphin http client/9.2.1(89) (Android)"){
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

	print domain, path, ip
	
    }
}

