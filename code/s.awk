#!/usr/bin/env awk

BEGIN { FS = ",";OFS = ","}

{
    if($1 = "2cd2d9f5af024f218a027ee828015f3e"){
	print $6
    }
}

