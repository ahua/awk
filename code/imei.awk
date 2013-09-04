#!/usr/bin/env awk

#zgrep "message_type: 3" track.log-20130*.gz | cut -f 1-1,6-6,10-10,14-16 | cut -d ":" -f 1- > /tmp/res.log 


function is_right_username(ua)
{
    ua_list[1] = "user_name: 18609200080";
    ua_list[2] = "user_name: zy-001";
    ua_list[3] = "user_name: zy-002";
    ua_list[4] = "user_name: zy-003";
    ua_list[5] = "user_name: zy-004";
    ua_list[6] = "user_name: zy-005";
    ua_list[7] = "user_name: zy-006";
    
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
    user_name = is_right_username($2);
    if(user_name > 0){
	print $1, $2, $3
    }
}

