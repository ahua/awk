#!/usr/bin/env awk

function is_right_ua(ua)
{
    ua_list[1] = "Dolphin http client/10.0.3(98) (Android)";
    ua_list[2] = "Dolphin http client/10.1.4(103) (Android)";
    ua_list[3] = "Dolphin http client/10.1.5(104) (Android)";
    ua_list[4] = "Dolphin http client/10.1.4(105) (Android)";
    ua_list[5] = "Dolphin http client/10.2.0(106) (Android)";
    ua_list[6] = "Dolphin http client/9.3.0(90) (Android)";
    ua_list[7] = "Dolphin http client/9.3.1(91) (Android)";
    ua_list[8] = "Dolphin http client/1.1.1(2) (Android)";
    
    for(i in ua_list){
	if(ua_list[i] == ua)
	    return i;
    }

    return 0;
}


BEGIN { 
    FS = "\t";
    OFS = "\t";
}

{
    ua_id = is_right_ua($7);
    if(ua_id > 0){
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

	print $1, $2, domain, path, ua_id
    }
}

