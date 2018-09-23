
#Declaring the variables in BEGIN block
BEGIN  {
	
}


#Body part starts from here
{
    #check for PLAN1 in file CDR.txt
	if($4=="PLAN1") 
	{   
	    #Check for MOC in CDR.txt which corresponds to PLAN1
		if($5=="MOC") 
		{  
		    #c11 used for averaging
			c11++; 
			#calculating charge for call and sms
			call_1+=$8
			MOC1+=$8;

		}
		#Check for MTC in CDR.txt which corresponds to PLAN1
		if($5=="MTC")
		{
			c12++;
			MTC1+=$8;
		}
		#Check for incoming and outgoing in CDR.txt which corresponds to PLAN1
		if($5=="SMS-MO")
		{   
			sms_1+=$8
			SMSMO1+=$8;
		}
		if($5=="SMS-MT")
			SMSMT1+=SMSMT1;
   
        #generating PLAN1.txt file
		print > "PLAN1.txt";
	}
	 
    #check for PLAN1 in file CDR.txt
	else if($4=="PLAN2")
	{
		    #Check for MOC in CDR.txt which corresponds to PLAN2
			if($5=="MOC") 
			{   
			 	#c21 used for averaging
				c21++;
				#calculating charge for call and sms
				call_2+=$8;
				MOC2+=$8;
			}
			#Check for MTC in CDR.txt which corresponds to PLAN2
			if($5=="MTC")
			{
				c22++;
				MTC2+=$8;
			}

		#Check for incoming and outgoing in CDR.txt which corresponds to PLAN2
		if($5=="SMS-MO")
	 	{   
	 		sms_2+=$8;
			SMSMO2+=$8;
		}
		if($5=="SMS-MT")
			SMSMT2+=SMSMT2;

		 #generating PLAN2.txt file
		 print > "PLAN2.txt";
	}

	else
	{
	    #Check for MOC in CDR.txt which corresponds to PLAN3
		if($5=="MOC") 
		{   
		    #c31 used for averaging
			c31++;
			#calculating charge for call and sms
			call_3+=$8;
			MOC3+=$8;
		}
		#Check for MTC in CDR.txt which corresponds to PLAN3
		if($5=="MTC")
		{
			c32++;
			MTC3+=$8;
		}
		#Check for incoming and outgoing in CDR.txt which corresponds to PLAN3
		if($5=="SMS-MO")
		{   
			sms_3+=$8;
			SMSMO3+=SMSMO3;
		}
		if($5=="SMS-MT")
			SMSMT3+=SMSMT3;

		  #generating PLAN3.txt file
		 print > "PLAN3.txt"
	}

}

END{
print "\n\n"
print "MOC(in Minutes): ",MOC1/(60*c11)
print "MTC(in Minutes): ",MTC1/(60*c12)
print "SMS-MO(in Seconds): ",SMSMO1
print "SMS-MT(in Seconds): ",SMSMT1

print "\n\n"
print "MOC(in Minutes): ",MOC2/(60*c21)
print "MTC(in Minutes): ",MTC2/(60*c22)
print "SMS-MO(in Seconds): ",SMSMO2
print "SMS-MT(in Seconds): ",SMSMT2

print "\n\n"
print "MOC(in Minutes): ",MOC3/(60*c31)
print "MTC(in Minutes): ",MTC3/(60*c32)
print "SMS-MO(in Seconds): ",SMSMO3
print "SMS-MT(in Seconds): ",SMSMT3

print "\n\n"
print "Plan1: "
print "MOC ",call_1
print "SMS-MO ",sms_1
print "Total Amount ",call_1+sms_1

print "\n\n"
print "Plan1: "
print "MOC ",call_2
print "SMS-MO ",sms_2
print "Total Amount ",call_2+sms_2

print "\n\n"
print "Plan1: "
print "MOC ",call_3
print "SMS-MO ",sms_3
print "Total Amount ",call_3+sms_3






}


