<?php


//      **************************************************************
//	Let's attempt some documentation...
/*	Functions:

	Public:
	BindNS	initialize	named	activate

	getDomain	getNameserver
	getContact	getSerial	getRefresh	getRetry	getExpire
	getTtl		getNS		getA		getMX
	getCNAME	getIP

	setNameserver	setContact	setSerial	setRefresh
	setRetry	setTtl		addNS		addA
	addMX		addCNAME	autoSerial	incSerial
	addReverse
					
	delNS		delA	delMX	delCNAME	delReverse
	fdelA	ldelA	fdelMX	ldelMX	fdelCNAME	ldelCNAME
	fdelNS	ldelNS	delMXp

	Private:
	dnsReadFile	dnsWriteFile


	What they Scooby Doo:

			BindNS(): Main baddy that calls initialize();
				Call with domain name OR not if you just want to query named.conf.

			initialize(): Initializes a domain DB file.  Called with a domain name.
					Depending on the setting of $CREATE will auto-create
					the domain DB file immediatelly. Also initializes $DATE

			named():	Queries named.conf and initializes certain fun filled variables:
					$HOSTS, and $ZONES.
			
			activate():	Adds or deletes a domain (Zone) from named.conf.  No value defaults to add,
					any other word besides "add" (or null) will delete the domain.

			getDomain():	For the space cadet scripter, forgot what domain name you're working on,
					if any.  Just call this func.
			getNameserver():	Get the nameserver responsible for that/this domain.
			getContact():	Returns email address (yes a REAL email address) of domain contact.
			getSerial():	Returns the serial number of the domain.
			getRefresh(),getRetry(),getExpire(),getTtl():	Returns the Refresh,Retry, and TTL values for cur domain.
			getNS():	Returns Array with all the NS records for the domain.
			getA():		Returns Array with all the A records for the domain (someone say round robin?).
					Use split on : to get records for sub domains.
			getMX():	Returns Array with MX records.
					Use split on space to get priority number and domain name.
			getCNAME():	Returns Array with CNAME records.
					Use split on space to get priority number and domain name.
			getIP():	Returns ONLY the ip of the main domain.

			set""():	Does the opposite of it's get* borther.

			addNS(X):	Add to the NS array.

			addA(X):	Add to the A array. Var X can be either an IP number or <var>:IP.
					Where var=sub domain prefix for subdomain IP numbers.

			addCNAME(X):	Add to the CNAME array. Var X must be the subdomain.

			addReverse():	Add a reverse entry to named.conf, AND create or add to an existing
					IN-ADDR.ARPA file.  Currently UNIMPLEMENTED!
 
			del*():		These boys delete the specified record from the array.

			delA(X):	Delete all occurances of X or <sub domain>:X

			delMXp(X):	Delete all occurances of MX with the priority X.

			fdel*():	Delete the First occurance of var only!

			ldel*():	Delete the Last occurance of var only!

			autoSerial():	Generates a serial number and updates required variables.

			incSerial():	Gets the current serial, increments it, and updates the proper variables.

			dnsReadFile():	Parses the domain DB file till it's blue and initializes array's to make the
					above funcitons work.  Don't call directly unless you're a glutton for punishment.

			dnsWriteFile():	Write out the domain DB file (ie. creates the domain entry).  Ditto about calling
					it directly.


*/


class BindNs {

		//Global vars
	var	$PROGRAM = 	'class.bind8.php';
	var	$VERSION = 	'Revision 0.82a 2000/09/19 16:46:00 alex@dayak.com';
	var	$NDHEAD =	'(C) Alexey Zilber, 9/7/2000';
	var	$LICENSE = 	'LGPL v2.1, ref: http://www.gnu.org/copyleft/lesser.html';

	var $DEBUG	= false;		// Bool, Debug.
	var $CONTENTS = "";		// Raw dns config contents.
	var $DOMAIN	= "";		// Placeholder.
	var $DOMAINFILE = "";		// ""
	var $DOMAINS = array();		// Array. Bit of a misnomer, contains info from ONE domain.
	var $ERROR = "";		// Last Error.
	var $CREATE = false;		// Bool. If domain file doesn't exist, create?
	var $DEL = false;		// Bool. Delete the domain.
	var $EMPTY = false;		// Bool. Is the domain empty?
	var $SANE	= false;	// Bool. True if everything checks out a-ok.
	var $EXISTS	= false;	// Bool. Domain file exists?
	var $ZONES = 0;		// Total number of domains hosting.
	var $SEMLOCK	= 453;		// Int.  Semaphore identifier for named.conf file locking.
	var $HOSTS = array();		// Array. Holds host information.
	var $NAMEDCONF = "/var/named/chroot/etc/named.conf";	// Location of named.conf
	var $DIRECTORY = "/var/named/chroot/var/named";		// Location of dns flies, err.. files.
	var $RELATIVEDIRECTORY = "/var/named";
	var $DATE	= "";			// String. Will store current date/time.

//      **************************************************************
//      An auto-constructor, can initilize the named.conf
//      called from new()


        function BindNs ($domain = "")
        {

                if(!empty($domain))
                {
                        $this->initialize($domain);
                }
                return;
        }

//      **************************************************************
//      The Initialize function sets up the domain, checks it
//      for sanity, then saves it and updated $NAMEDCONF

        function initialize ($domain){

		$this->DOMAIN	=	$domain;
	
		$this->EXISTS=false;
		
		if(!$domain) $this->CREATE=false;

		srand((double)microtime()*1000000); // Seed the random number gen

		$this->DATE = date("D, M j @ h:ia T Y"); 
		
		if($domain)
		$this->DOMAINFILE = $this->DIRECTORY . "/" .$domain;

		if($this->DEBUG){
			echo "Using: $this->DOMAINFILE\n<BR>";
		}

		if($domain)	
		if(!is_file($this->DOMAINFILE)){
			if($this->CREATE==true){
				if(!touch($this->DOMAINFILE)){ $this->error("Cannot Initialize $domain.",1);
					exit;
				}
			}

			$this->EMTPY=true;
		}

		if(file_exists($this->DOMAINFILE)){

			 $this->EXISTS = true;
                        if($this->sane($this->DOMAINFILE))
                        {
                                $this->SANE = true;
                                if($this->EMPTY==false) $this->dnsReadFile();
                        }
                        else
                        {
                                // Preserve the error generated by sane()
                                return;
                        }
                }
                else
                {
                        $this->SANE=true;       // Non-existant files are safe
                }
                return;
        }



//	*************************************************************
//	Reads in the domain files... *sigh*

	function dnsReadFile(){


	global $php_errormsg;

		$Mytemp         = array();
                $Myjunk         = array();
                $Junk           = array();
                $count          = 0;
		$track		= 3;
		$lobo		= 0;
		$domain		= "";
		$domainame	= "";
		$host		= "";
		$origin		= "";
		$nameserver	= "";
		$contact	= "";
		$bufa		= "";
		$bufb		= "";
		$bufc		= "";
		$contents	= "";
		$serial		= "";
		$refresh	= 0;
		$retry		= 0;
		$expire		= 0;
		$ttl		= 0;
		$mxtrack	= 0;
		$nstrack	= 0;
		$ctrack		= 0;
		$atrack		= 0;
		$loop		= 0;
		$ip		= "";
		$ns		= array();
		$mx		= array();
		$cname		= array();
		$crap		= "";

		$filename= $this->DOMAINFILE;
		$filesize = filesize($this->DOMAINFILE);

	if(!empty($filename)){

		$this->EMPTY = false;

		$fd = fopen( $filename, "r" );

		if(empty($fd))
                        {
                                $this->error("FATAL File access error [$php_errormsg]",1);

				if($this->DEBUG){
                                        echo "Could not open $this->DOMAINFILE!\n";
				}
                                exit; // Just in case
                        }

		$contents = fread( $fd, filesize( $filename ) );
                        fclose( $fd );

                        $this->CONTENTS = $contents;

			if(!$contents){
				$this->EMPTY=true;
				return true;
			}

		$Mytemp = split("\n",$contents);
		list($origin,$bufa) = split(" ",$Mytemp[0],2);
		list($bufb,$crap,$crap,$nameserver,$contact) = split('[[:space:]]+',$Mytemp[1],6);
		$domain=substr($bufa,0,3);
		$domainame= substr($bufb, 0, -1);
		$host=$bufb;
		trim($domainame);

if($this->DEBUG){
                                        echo "Returned $domainame<br>\n";
                                        echo "Nameserver: $nameserver<br>\n";
                                        echo "Contact: $contact<br>\n";
}

			if(strcmp($domainame,$this->DOMAIN)!=0){

				//$this->error("FATAL domain file does not match domain [$php_errormsg]<br>",1);
                             //   exit; // Just in case
                        }

		list($crap,$serial,$refresh,$retry,$expire,$ttl) = split('[[:space:]]+',$Mytemp[2],7);

		$Myjunk["$domainame"]["nameserver"]=$nameserver;
		$Myjunk["$domainame"]["contact"]=$contact;
		$Myjunk["$domainame"]["serial"]=$serial;
		$Myjunk["$domainame"]["refresh"]=$refresh;
		$Myjunk["$domainame"]["retry"]=$retry;
		$Myjunk["$domainame"]["expire"]=$expire;
		$Myjunk["$domainame"]["ttl"]=$ttl;

if($this->DEBUG){
		echo"Read in:----\n<BR>Nameserver: $nameserver\n<BR>Contact: $contact\n<BR>Serial: $serial\n<BR>";
		echo "Refresh: $refresh\n<BR>Retry: $retry\n<BR>Expire: $expire\n<BR>Ttl: $ttl\n<BR>\n";
}

for($count=3;$count<count($Mytemp);$count++){
		list($bufc,$bufa,$bufb,$crap) = split('[[:space:]]+',$Mytemp[$count],4);


			 if($this->DEBUG)echo "<font color=green>In loop0: [$bufa][$bufb][$crap]+[$bufc]</font>\n<BR>"; 

				if($bufa == "IN"){

					if($this->DEBUG){ echo "Found IN record!<BR>"; }

						if($bufb == "NS"){
							$Myjunk["$domainame"]["NS"][$nstrack]=$crap;
							$nstrack++;
							if($this->DEBUG) echo "NS record: $crap\n<BR>"; 
							$bufa="";
						}

						if($bufb == "A"){
							$Myjunk["$domainame"]["A"][$atrack]=$crap;
							$bufa="";
							if($this->DEBUG){ echo "[$atrack] A record: $crap\n<BR>"; }
							$atrack++;
						}

						if($bufb == "MX"){
							if($this->DEBUG){ echo "Found MX record!<BR>"; }
							$Myjunk["$domainame"]["MX"][$mxtrack]="$crap";
							$mxtrack++;
							$bufa="";
						}
				} # end IN




						if($bufb=="CNAME"){
							if($this->DEBUG){ echo "Found CNAME record!<BR>"; }
							$Myjunk["$domainame"]["CNAME"][$ctrack]="$bufc";
							$ctrack++;
							$bufc="";
						}

						if($bufb == "A"){
							if($this->DEBUG){ echo "Found A record!<BR>"; }
							$Myjunk["$domainame"]["A"][$atrack]="$bufc" . ":$crap";
							$bufc="";
							$atrack++;
						}


} # end for each


//print_r($Myjunk);
$this->DOMAINS=$Myjunk;

} else { $this->EMPTY=true; }  // End if
		
		

	} //end dnsReadFile

//      *************************************************************
//      Writes the domain file... 

	function dnsWriteFile(){

		$domainfile = $this->DOMAINFILE;
		$domain = $this->DOMAIN;
		$dhead = "";
		$nameserver = "";
		$contact = "";
		$serial = "";
		$echeck = "";
		$refresh = "";
		$retry = "";
		$expire = "";
		$ttl = "";
		$MX = "";
		$dtail = "";
		$NS = "";
		$count = 0;
		

if($this->DEBUG){
	echo "<font color=red>We are writing $domainfile</font>\n<BR>";
}
		list($dhead,$dtail) = split("\.",$domain,2);
		

		if ($this->EMPTY)        { return false; }	// We don't want blank files..
                if (empty($domain)) { return false; }


		if($this->DEL==true){
			unlink($domainfile);
				return true;
		}
	$fd = fopen( $domainfile, "w" );

                if(empty($fd))
                {

if($this->DEBUG){
        echo "<font color=red>Could not open $domainfile</font>\n<BR>";
}
                        $myerror = $php_errormsg;       // In case the unlink generates
                                                                                // a new one - we don't care if
                                                                                // the unlink fails - we're
                                                                                // already screwed anyway
                        unlink($domainfile);
                        $this->error("FATAL File [$domainfile] access error [$myerror]",1);
                        exit; // Just in case
                }
			
			$nameserver = $this->DOMAINS[$domain]["nameserver"];
			$contact = $this->DOMAINS[$domain]["contact"];
			$ttl = $this->DOMAINS[$domain]["ttl"];
			fwrite($fd,"\$ttl $ttl\n$dhead.$dtail.\tIN\tSOA\t$nameserver $contact (\n");
			$serial = $this->DOMAINS[$domain]["serial"];
			$refresh = $this->DOMAINS[$domain]["refresh"];
			$retry = $this->DOMAINS[$domain]["retry"];
			$expire = $this->DOMAINS[$domain]["expire"];
			fwrite($fd,"\t\t$serial\t $refresh\t $retry \t$expire\t $ttl \t )\n");
if($this->DEBUG){
        echo "<font color=red>Loaded values.</font>\n<BR>";
}
		$echeck="";
		$echeck=$this->DOMAINS[$domain]["NS"];
		if(!empty($echeck)){
			for($count=0;$count<count($this->DOMAINS[$domain]["NS"]);$count++){
					$NS = $this->DOMAINS[$domain]["NS"][$count];
				if(!empty($NS)) fwrite($fd,"$domain.\t\tIN\tNS\t$NS\n");
			}
		}

		$echeck="";
		$echeck=$this->DOMAINS[$domain]["MX"];
		if(!empty($echeck)){
			for($count=0;$count<count($this->DOMAINS[$domain]["MX"]);$count++){
                           $MX = $this->DOMAINS[$domain]["MX"][$count];
                                if(!empty($MX)) fwrite($fd,"$domain.\t\tIN\tMX\t$MX\n");
                        }
                }

		$echeck="";
		$echeck=$this->DOMAINS[$domain]["A"];
		if(!empty($echeck)){
                        for($count=0;$count<count($this->DOMAINS[$domain]["A"]);$count++){
				if(!eregi(":",$this->DOMAINS[$domain]["A"][$count])){
                           		$A = $this->DOMAINS[$domain]["A"][$count];
                                	//if(!empty($A)) fwrite($fd,"\t\tIN\tA\t$A\n");
				}
                        }
                }

		//fwrite($fd,"\$ORIGIN $domain.\n");

		$echeck="";
		$echeck=$this->DOMAINS[$domain]["A"];
		if(!empty($echeck)){
				for($count=0;$count<count($this->DOMAINS[$domain]["A"]);$count++){
					if(eregi(":",$this->DOMAINS[$domain]["A"][$count])){
						list($dhead,$A) = split(":",$this->DOMAINS[$domain]["A"][$count],2);
						if(!empty($A) && !empty($dhead)) fwrite($fd,"$dhead\t\tIN\tA\t$A\n");
					}
				}
		}

		$echeck="";
                $echeck=$this->DOMAINS[$domain]["CNAME"];
                if(!empty($echeck)){
                        for($count=0;$count<count($this->DOMAINS[$domain]["CNAME"]);$count++){
                                if(!eregi(":",$this->DOMAINS[$domain]["CNAME"][$count])){
                                        $CNAME = $this->DOMAINS[$domain]["CNAME"][$count];
                                        if(!empty($CNAME)) fwrite($fd,"$CNAME\t\tIN\tCNAME\t$domain.\n");
                                }
                        }
                }
/*  //Mah boy, cnames can't point to wierd things....
		$echeck="";
		$echeck=$this->DOMAINS[$domain]["CNAME"];
		if(!empty($echeck)){
                                for($count=0;$count<count($this->DOMAINS[$domain]["CNAME"]);$count++){
                                        if(eregi(":",$this->DOMAINS[$domain]["CNAME"][$count])){
                                                list($dhead,$CNAME) = split(":",$this->DOMAINS[$domain]["CNAME"][$count],2);
                                                if(!empty($CNAME)) fwrite($fd,"$dhead\t\tIN\tCNAME\t$CNAME\n");
                                        }
                                }
                }
*/

	fclose($fd);
if($this->DEBUG){
        echo "<font color=red>Wrote: $domainfile</font>\n<BR>";
}
	return true;
	}

//      **************************************************************
//      Loads the domains in named.conf for your viewing pleasure.

        function named(){
			
		$Mytemp = array();
                $hosts = array();
		$contents = "";
                $buf = "";
		$zhost = "";
                $count = 0;
		$sem = 0;

	$filename = $this->NAMEDCONF;

        if($this->DEBUG){
                                        echo "Reading named.conf<BR>\n";
                                }

		$sem=sem_get($this->SEMLOCK);
		if($sem==false){

			$this->error("Semaphore $this->SEMLOCK failed to init, will retry.\n",0);
			sleep(1);
			$sem=sem_get($this->SEMLOCK);
				if($sem==false){
					$this->error("Semaphore $this->SEMLOCK failed to init.\n",0);
					return false;
				}
		}
		if(!sem_acquire($sem)){
				$this->error("Semaphore $this->SEMLOCK failed to aquire.\n",0);
                                        return false;
                                }
        $fd = fopen( $filename, "r" );

        if(!$fd){
                $this->error("Cannot activate $domainame.  $filename inaccessible.");
                return false;
        }

        $contents = fread( $fd, filesize( $filename ) );
                        fclose( $fd );

		if(!sem_release($sem)){
				$this->error("Semaphore failed to release.\n",1);
                                        return false;
                                }

                $Mytemp = split("\n",$contents);

                for($count=0;$count<count($Mytemp);$count++){

                        if($this->DEBUG){
                                        echo "<font color=gray>Within loop, count: $count</font><BR>\n";
                                }

                	if(eregi("^zone",$Mytemp[$count])){
                       		list($crap,$buf)=split('[[:space:]]+',$Mytemp[$count],3);
				$crap=trim($buf); $buf=$crap;
                        	$zhost=eregi_replace("\"","",$buf);
				if($zhost!="." && !eregi("IN-ADDR.ARPA",$zhost)){
                        		array_push($hosts,$zhost);
					if($this->DEBUG){
                                      		echo "Added host: $zhost<BR>\n";
                                	}
				}
                	}
		}

	$this->HOSTS=$hosts;
	$this->ZONES=$count;

return true;
} // end named


//	**************************************************************
//	Set the contact email addy for the domain.

        function setContact($email){

		$buf = "";
		$domain = "";
		$cdomain = "";

		$domain = $this->DOMAIN;

		if(!$email){ return false; }
		if (empty($domain)){ return false; }

                list($buf,$cdomain)=split ("@",$email,2);

                $email = $buf . "." . $cdomain;

		$this->DOMAINS[$domain]["contact"]=$email;

        return true;
        } //end setContact


		

//      **************************************************************
//	Activates the domain in named.conf
//	How you ask?  We read in named.conf, parse the sh*t out of it,
//	store the options, and rebuild everything else. What a drag.

	function activate($command = "add"){

		$Mytemp = array();	
		$named = array();
		$hosts = array();
		$domain = $this->DOMAIN;
		$contents = "";
		$buf = "";
		$bufa = "";
		$bufb = "";
		$bufc = "";
		$crap = "";
		$tbuf = "";
		$val = "";
		$directory = "";
		$count = 0;
		$optrack = 0;
		$ztrack = 0;
		$sem = 0;
		$innamed = false;



		$tempfile       = tempnam( "/tmp", "nmd" );

	$domainame=$this->DOMAINFILE;

	$filename = $this->NAMEDCONF;

	if($this->DEBUG){
                                        echo "Activating named.conf<BR>\n";
                                }

	$sem=sem_get($this->SEMLOCK);
	if($sem==false){

                        $this->error("Semaphore $this->SEMLOCK failed to init, will retry.\n",0);
                        sleep(2);
                        $sem=sem_get($this->SEMLOCK);
                                if($sem==false){
                                        $this->error("Semaphore $this->SEMLOCK failed to init.\n",0);
                                        return false;
                                }
                }
                if(!sem_acquire($sem)){
                                $this->error("Semaphore $this->SEMLOCK failed to aquire.\n",0);
                                        return false;
                                }
	$fd = fopen( $filename, "r" );

	if(!$fd){
		$this->error("Cannot activate $domainame.  $filename inaccessible.");
		return false;
	}

	$contents = fread( $fd, filesize( $filename ) );
                        fclose( $fd );

//Fat chance:	eregi("options \{[[:space:]]+directory \"(.*)\"",$contents,$directory);

		$Mytemp = split("\n",$contents);

		for($count=0;$count<count($Mytemp);$count++){

			if($this->DEBUG){
                                        echo "<font color=gray>Within loop, count: $count</font><BR>\n";
                                }

//			if(empty($Mytemp[$count])){ if($this->DEBUG){ echo "Loop break<br>\n"; } break; }

//Deal quick with all options.  Just pass them through like bad chili.

		if(eregi("^options",$Mytemp[$count])){
			$count++;

			while(!eregi("^\};",$Mytemp[$count]) && !eregi("^zone",$Mytemp[$count])){
				$tcrap=trim($Mytemp[$count]);
				$named["options"][$optrack]=$tcrap;

				if($this->DEBUG){
					echo "Options: $Mytemp[$count]<BR>\n";
				}
				$count++; $optrack++;
				if($optrack>$count){
					$this->error("$this->NAMEDCONF syntax error!\n",0);
					break;
				}
			}
			$optrack=0;
		}


//We want to deal better with zones since we have to tell what's what, what to kill, and what to just maime.
// We also want to filter out the domain name we specified since we will be re-creating that entry.

		if(eregi("^zone",$Mytemp[$count])){
			list($crap,$buf)=split('[[:space:]]+',$Mytemp[$count],3);
			$crap=trim($buf);
			$buf=$crap;
			$zhost=eregi_replace("\"","",$buf);
//			if($command!="add" && $domain==$zhost){
if($this->DEBUG){
                                       echo "<font color=purple>Domain: $domain\n<BR>ZHost: $zhost!</font>\n<BR>";
}
			if(eregi("$domain","$zhost")){
if($this->DEBUG){
                                        echo "<font color=purple>$domain matches $zhost!</font>\n<BR>";
}
				while(!eregi("^\};",$Mytemp[$count]) && !eregi("^zone",$Mytemp[$count])){ $count++; }
				} else {
				if($this->DEBUG){
                                        echo "Within Zone $zhost<BR>\n";
                                }
				array_push($hosts,$zhost);
                        	$count++;
				while(!eregi("^\};",$Mytemp[$count]) && !eregi("^zone",$Mytemp[$count])){
					$tcrap=trim($Mytemp[$count]);
					$named[$zhost]["zone"][$ztrack]=$tcrap;
					if($this->DEBUG){
                               	         echo "Zones: $Mytemp[$count]<BR>\n";
                                	}
					$count++;
					$ztrack++;
					if($ztrack>$count){
                                	        $this->error("$this->NAMEDCONF syntax error!\n",0);
                                        	break;
                                	}
                		}
			$ztrack=0;
			}
		}


/* // Let's keep it simple for now and just save this stuff. 

			list($crap,$bufa,$bufb) = split('[[:space:]]+',$Mytemp[$count],3);

			$crap=trim($bufb);
			$bufb=$crap;

			$ztype=eregi_replace(";","",$bufb);
*/



		}

		$this->HOSTS=$hosts;
		$this->ZONES=$count;

// Now we "activate" the new domain......
		if($command=="add"){
			$ztrack=0;
			$named[$this->DOMAIN]["zone"][$ztrack]="type master;"; $ztrack++;
			$named[$this->DOMAIN]["zone"][$ztrack]="file \"" . $this->RELATIVEDIRECTORY.DIRECTORY_SEPARATOR.$this->DOMAIN ."\";"; $ztrack++;
			$ztrack=0;
			array_push($hosts,$this->DOMAIN);
			$count++;
			$this->ZONES=$count;
		}

//Now we write out a new named.conf (with a side order of temp).


			$fd = fopen( $tempfile, "w" );

                if(empty($fd))
                {
                        $myerror = $php_errormsg;       // In case the unlink generates
                                                                                // a new one - we don't care if
                                                                                // the unlink fails - we're
                                                                                // already screwed anyway
                        unlink($tempfile);
                        $this->error("FATAL File [$tempfile] access error [$myerror]",1);
                        exit; // Just in case
                }


		fwrite($fd, "#\n# named.conf - generated $this->DATE\n# Generated by $this->PROGRAM $this->VERSION\n#\n\n");
		if($named["options"]){

			fwrite($fd,"options {\n");

			for($otrack=0;$otrack<count($named["options"]);$otrack++){
				$buf=$named["options"][$otrack];
				fwrite($fd,"\t$buf\n");
			}
			fwrite($fd,"};\n\n");
		}

		if($hosts){

			foreach($hosts as $val){

				fwrite($fd,"zone \"$val\" {\n");
				for($ztrack=0;$ztrack<count($named[$val]["zone"]);$ztrack++){
					$buf=$named[$val]["zone"][$ztrack];
					fwrite($fd,"\t$buf\n");
				}
				fwrite($fd,"};\n\n");
			}
				
		}


		fclose($fd);

		if($command=="del") $this->DEL=true;
		$this->dnsWriteFile();	//We write the domain.db file!
#			unlink($filename);
			copy($tempfile,$filename);
			unlink($tempfile);

				if(!sem_release($sem)){
                                $this->error("Semaphore failed to release.\n",1);
                                        return false;
                                }
	return true;
	}


//      **************************************************************
//      Returns the current domain name.

        function getDomain(){


                $domain = "";

                $domain = $this->DOMAIN;

                if (empty($domain)) return false; 


        return $domain;
        } //end getDomain


//      **************************************************************
//	Returns the Name Server

	function getNameserver(){


		$nameserver = "";
		$domain = "";
		$len = 0;

		$domain = $this->DOMAIN;

		if ($this->EMPTY)        { return false; }
		if (empty($domain)){ return false; }

		$nameserver=$this->DOMAINS[$domain]["nameserver"];	

		trim($nameserver);
                $len=strlen($nameserver);
                $len--;
                $nameserver = substr($nameserver,0,$len);

	return $nameserver;
	} //end getNameserver

//      **************************************************************
//      Returns the Contact as email addy.

        function getContact(){

		$email="";
		$domain="";
		$cdomain="";
		$buf="";
		$len=0;


		$domain=$this->DOMAIN;

                if ($this->EMPTY)        { return false; }
                if (empty($domain)) { return false; }


if($this->DEBUG){
		$test=$this->DOMAINS[$domain]["contact"];
		echo "Stored Contact getContact: $test\n<BR>";
}

                list($buf,$cdomain)=split ("\.",$this->DOMAINS[$domain]["contact"],2);

		trim($cdomain);
		$len=strlen($cdomain);
		$len--;
		$cdomain = substr($cdomain,0,$len);

		$email = $buf . "@" . $cdomain;

        return $email;
        } //end getContact

//      **************************************************************
//      Returns the Serial

        function getSerial(){

		$domain = "";
                $serial= "";

		$domain=$this->DOMAIN;

                if ($this->EMPTY)        { if($this->DEBUG){ echo "this->EMTPY is TRUE for getSerial!\n<BR>";} return false; }
                if (empty($domain)){ if($this->DEBUG){ echo "empy domain [$domain] for getSerial!\n<BR>";} return false; }

                $serial=$this->DOMAINS[$domain]["serial"];

if($this->DEBUG){
	echo "getSerial:  Serial: $serial\n<BR>";
}

        return $serial;
        } //end getSerial

//      **************************************************************
//      Returns the Refresh

        function getRefresh(){

		$domain = "";
                $refresh = "";

                if ($this->EMPTY)        { return false; }
                if (empty($domain)){ return false; }

                $refresh=$this->DOMAINS[$domain]["refresh"];

        return $refresh;
        } //end getRefresh

//      **************************************************************
//      Returns the Retry

        function getRetry(){

		$domain = "";
                $retry= "";

		$domain = $this->$DOMAIN;

                if ($this->EMPTY)        { return false; }
                if (empty($domain)){ return false; }

                $retry=$this->DOMAINS[$domain]["retry"];

        return $retry;
        } //end getRetry

//      **************************************************************
//      Returns the Expire field

        function getExpire(){

                $domain = "";
                $expire = "";

                $domain = $this->DOMAIN;

                if ($this->EMPTY)        { return false; }
                if (empty($domain)){ return false; }

                $ttl=$this->DOMAINS[$domain]["expire"];

        return $ttl;
        } //end getExppire

//      **************************************************************

//      **************************************************************
//      Returns the TTL

        function getTtl(){

		$domain = "";
                $ttl = "";

		$domain = $this->DOMAIN;

                if ($this->EMPTY)        { return false; }
                if (empty($domain)){ return false; }

                $ttl=$this->DOMAINS[$domain]["ttl"];

        return $ttl;
        } //end getTtl

//      **************************************************************
//      Returns the NS array.

        function getNS(){

		$domain = "";
                $NS = array();

		$domain = $this->$DOMAIN;

                if ($this->EMPTY)        { return false; }
                if (empty($domain)){ return false; }

                $NS = $this->DOMAINS[$domain]["NS"];

		trim($NS);
                $len=strlen($NS);
                $len--;
                $NS = substr($NS,0,$len);

        return $NS;
        } //end getNS

//      **************************************************************
//      Returns the A array.

        function getA(){

		$domain = "";
                $A = array();

		$domain = $this->DOMAIN;

                if ($this->EMPTY)        { return false; }
                if (empty($domain)){ return false; }

                $A = $this->DOMAINS[$domain]["A"];
			
        return $A;
        } //end getA

//      **************************************************************
//      Returns the MX array.

        function getMX(){

		$domain = "";
                $MX = array();

		$domain = $this->DOMAIN;

                if ($this->EMPTY)        { return false; }
                if (empty($domain)){ return false; }

                $MX = $this->DOMAINS[$domain]["MX"];

        return $MX;
        } //end getMX

//      **************************************************************
//      Returns the CNAME array.

        function getCNAME(){

		$domain = "";
                $CNAME = array();

		$domain=$this->DOMAIN;

                if ($this->EMPTY)        { return false; }
                if (empty($domain)){ return false; }

                $CNAME = $this->DOMAINS[$domain]["CNAME"];

        return $CNAME;
        } //end getCNAME

//      **************************************************************
//      Returns the main IP addy.

        function getIP(){


                $IP = "";
		$count = 0;
		$domain = "";

		$domain = $this->DOMAIN;

                if ($this->EMPTY)        { if($this->DEBUG){ echo "EMPTY set to TRUE\n<BR>";} return false; }
                if (empty($domain)){ if($this->DEBUG){ echo "this-DOMAIN s empty\n<BR>";} return false; }



if($this->DEBUG){
		$count=count($this->DOMAINS[$domain]["A"]);
		echo "Domain A count: [$count]\n<BR>";
		$count=0;
}

		for($count=0;$count<count($this->DOMAINS[$domain]["A"]);$count++){

if($this->DEBUG){
		$test=$this->DOMAINS[$domain]["A"][$count];
		echo "$count A record: $test\n<BR>";
}
			if(!ereg(":",$this->DOMAINS[$domain]["A"][$count])){
                		$IP = $this->DOMAINS[$domain]["A"][$count];
			}
		}
			

        return $IP;
        } //end getIP

//      **************************************************************
//      Sets the Name Server

        function setNameserver($nameserver){

		$buf = "";
		$domain = $this->DOMAIN;

                if(!$nameserver){ return false; }
		if (empty($domain)){ return false; }

		$buf = $nameserver . ".";
		$nameserver=$buf;	
                $this->DOMAINS[$domain]["nameserver"]=$nameserver;

        return true;
        } //end setNameserver

//      **************************************************************
//      Sets the Contact as email addy.

 

//      **************************************************************
//      Sets the Serial

        function setSerial($serial){

		$domain = $this->DOMAIN;

                if(!$serial){ return false; }
		if (empty($domain)){ return false; }

                $this->DOMAINS[$domain]["serial"]=$serial;

        return true;
        } //end setSerial

//      **************************************************************
//      Sets the Refresh

        function setRefresh($refresh="10800"){

		$domain = $this->DOMAIN;

		if(!$refresh){ return false; }
		if (empty($domain)){ return false; }

                $this->DOMAINS[$domain]["refresh"]=$refresh;

        return true;
        } //end setRefresh

//      **************************************************************
//      Sets the Retry

        function setRetry($retry="3600"){

		$domain = $this->DOMAIN;

                if(!$retry){ return false; }
		if (empty($domain)){ return false; }

                $this->DOMAINS[$domain]["retry"]=$retry;

        return true;
        } //end setRetry

//      **************************************************************
//      Sets the Expire

        function setExpire($expire = "604800"){

                $domain = $this->DOMAIN;
                
                if(!$expire){ return false; }
                if (empty($domain)){ return false; }

                $this->DOMAINS[$domain]["expire"]=$expire;
                
        return true;
        } //end setExpire

//      **************************************************************
//      Sets the TTL

        function setTtl($ttl="86400"){

		$domain = $this->DOMAIN;

                if(!$ttl){ return false; }
		if (empty($domain)){ return false; }
if($this->DEBUG){
	echo "<font color=blue>Setting TTL: $ttl</font>\n<BR>";
}
                $this->DOMAINS[$domain]["ttl"]=$ttl;

        return true;
        } //end setTtl

//      **************************************************************
//      Adds to the NS array.

        function addNS($NS){

		$count = 0;
		$buf = "";
		$domain = $this->DOMAIN;

                if(!$NS){ return false; }
		if (empty($domain)){ return false; }

		$buf=$NS . ".";
		$NS=$buf;
	if(empty($this->DOMAINS[$domain]["NS"])){
		$count=0;
	} else {
			$count=count($this->DOMAINS[$domain]["NS"]);
			//$count++;
	}
                $this->DOMAINS[$domain]["NS"][$count]=$NS;

        return true;
        } //end addNS

//      **************************************************************
//      Adds to the A array.  Remember, $A can be either an ip or in
//	in the format: subdomain:ip  ie.:  www:10.1.1.50

        function addA($A){

                $count = 0;
		$domain = $this->DOMAIN;

                if(!$A){ return false; }
		if (empty($domain)){ return false; }


		if(empty($this->DOMAINS[$domain]["A"])){
			$count=0;
		} else {
                        $count=count($this->DOMAINS[$domain]["A"]);
                       // $count++;
		}
                $this->DOMAINS[$domain]["A"][$count]=$A;

        return true;
        } //end addA

//      **************************************************************
//      Adds to the MX array.

        function addMX($priority,$where){

                $count = 0;
		$MX = "";
		$domain = $this->DOMAIN;

                if(!$where) return false;
		if(!$priority) return false;
		if (empty($domain)) return false;


		$MX = "$priority" . " " . "$where" . ".";

		if(empty($this->DOMAINS[$domain]["MX"])){
                        $count=0;
                } else {
                        $count=count($this->DOMAINS[$domain]["MX"]);
                        //$count++;
		}
                $this->DOMAINS[$domain]["MX"][$count]=$MX;

        return true;
        } //end addMX

//      **************************************************************
//      Adds to the CNAME array. Remember, $CNAME can be either an ip or in
//      in the format: subdomain:ip  ie.:  www:10.1.1.50

        function addCNAME($CNAME){

                $count = 0;
		$buf = "";
		$domain = $this->DOMAIN;

                if(!$CNAME){ return false; }
                if (empty($domain)){ return false; }

//		$buf = $CNAME . ".";
//		$CNAME = $buf;
		if(empty($this->DOMAINS[$domain]["CNAME"])){
                        $count=0;
                } else {
                        $count=count($this->DOMAINS[$domain]["CNAME"]);
                        //$count++;
		}
                $this->DOMAINS[$domain]["CNAME"][$count]=$CNAME;
if($this->DEBUG){
	echo "Adding CNAME: $CNAME to $domain.\n<BR>";
}

        return true;
        } //end addCNAME

//      **************************************************************
//      Adds or creates a reverse lookup entry to an IN-ADDR.ARPA file and
//      updates named.conf loaded variables to reflect reverse lookup.

        function addReverse($action="add"){

		$ip = $this->getIP();
	
		if(empty($ip)) return false;

/*	Our mode of action here is to parse out ever A ip as well as subdomain:ip
	combo.  Make sure they are unique, then parse in (if exists) and IN-ADDR.ARPA
	file and add the data...  whew!
*/

/*
	                if(!ereg(":",$this->DOMAINS[$domain]["A"][$count])){
                                $IP = $this->DOMAINS[$domain]["A"][$count];
                        }
                }
*/

//	Unimplemented!

	return false;
	} //end addReverse

//      **************************************************************
//      Deletes a reverse lookup entry to an IN-ADDR.ARPA file and
//      updates named.conf loaded variables to reflect reverse lookup.

        function delReverse(){

/*	Pretty much the same deal as above, except we parse the data and remove it
	from a reverse lookup file.
*/

//      Unimplemented!

        return false;
        } //end addReverse


//      **************************************************************
//      Automatically generates a random serial number in the format:
//	YYYYMMDDNNN  (Where Y=Year, M=Month, D=Day, N=Number).
//	We generate with the current date and number starting at 0.

        function autoSerial(){

		$Serial = "YYYYMMDDNNN";
		$NUM = 0;
		$date = "";
		$domain = $this->DOMAIN;

		if (empty($domain)){ return false; }

			$date = date("Ymd");

//			preg_replace("YYYYMMDDNNN","$date001",$serial);
			$Serial = $date . "001";

                $this->DOMAINS[$domain]["serial"]=$Serial;

        return true;
        } //end autoSerial

//      **************************************************************
//      Automatically increments the serial in this format:
//      YYYYMMDDNNN  (Where Y=Year, M=Month, D=Day, N=Number).
//	We set the date, and increment the number.

        function incSerial(){

                $Serial = "";
		$NewSerial = "";
                $NUM = "";
                $date = "";
		$domain = $this->DOMAIN;

                if (empty($domain)){ return false; }

                        $date = date("Ymd");

		$Serial = $this->DOMAINS[$domain]["serial"];
/*
                      preg_replace("YYYYMMDDNNN","$date001",$serial);
                        $Serial = $date . "001";

                $this->DOMAINS[$domain]["serial"]=$Serial;
*/

		$buf = substr ($Serial,8,3);
		$buf++;
//		$NUM = $buf + 1;
		$NUM = sprintf("%03d",$buf);
		
		$Serial = $date . "$NUM";

if($this->DEBUG){
		echo "NUM: [$NUM]\tSerial: [$Serial]\n<BR>";
}

		$this->DOMAINS[$domain]["serial"]=$Serial;

        return true;
        } //end incSerial

//      **************************************************************
//      Deletes the first occurance of $A from domain db.
//      in the format: subdomain:ip  ie.:  www:10.1.1.50 or just IP.
//      Note: strings must match!

        function fdelA($A){

                $count = 0;
                $curip = "";
                $domain = $this->DOMAIN;

                if(!$A){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["A"])){ return false; }


                for($count=0;$count<count($this->DOMAINS[$domain]["A"]);$count++){

                        $curip=$this->DOMAINS[$domain]["A"][$count];
                        if(preg_match("/$A/i",$curip)){
                                $this->DOMAINS[$domain]["A"][$count]="";
				break;
			}
                }
        return true;
        } //end fdelA

//      **************************************************************
//      Deletes the last occurance of $A from domain db.
//      in the format: subdomain:ip  ie.:  www:10.1.1.50 or just IP.
//      Note: strings must match!

        function ldelA($A){

                $count = 0;
		$lcount = 0;
                $curip = "";
                $domain = $this->DOMAIN;

                if(!$A){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["A"])) return false;


                for($count=0;$count<count($this->DOMAINS[$domain]["A"]);$count++){

                        $curip=$this->DOMAINS[$domain]["A"][$count];
                        if(preg_match("/$A/i",$curip))
				$lcount=$count;
                }

			$this->DOMAINS[$domain]["A"][$lcount]="";
        return true;
        } //end ldelA

//      **************************************************************
//      Deletes all occurance of $A from domain db.
//      in the format: subdomain:ip  ie.:  www:10.1.1.50 or just IP.
//	Note: strings must match!

        function delA($A){

                $count = 0;
                $curip = "";
                $domain = $this->DOMAIN;

                if(!$A){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["A"])) return false;
                

		for($count=0;$count<count($this->DOMAINS[$domain]["A"]);$count++){
        
                	$curip=$this->DOMAINS[$domain]["A"][$count];
			if(preg_match("/$A/i",$curip))
				$this->DOMAINS[$domain]["A"][$count]="";
		}
        return true;
        } //end delA


//      **************************************************************
//      Deletes $NS from the NS array.

        function delNS($NS){

                $count = 0;
                $buf = "";
		$curns = "";
                $domain = $this->DOMAIN;

                if(!$NS){ return false; }
                if (empty($domain)){ return false; }

                $buf=$NS . ".";
                $NS=$buf;
        if(empty($this->DOMAINS[$domain]["NS"])) return false;
                        
		for($count=0;$count<count($this->DOMAINS[$domain]["NS"]);$count++){
			
			$curns=$this->DOMAINS[$domain]["NS"][$count];
			if(preg_match("/$NS/i",$curns))
                		$this->DOMAINS[$domain]["NS"][$count]="";
		}

        return true;
        } //end delNS

//      **************************************************************
//      Deletes the first occurance of $NS from domain db.
//      Note: strings must match!

        function fdelNS($NS){

                $count = 0;
                $curns = "";
                $domain = $this->DOMAIN;

                if(!$NS){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["NS"])){ return false; }


                for($count=0;$count<count($this->DOMAINS[$domain]["NS"]);$count++){

                        $curns=$this->DOMAINS[$domain]["NS"][$count];
                        if(preg_match("/$NS/i",$curns)){
                                $this->DOMAINS[$domain]["NS"][$count]="";
                                break;
                        }
                }
        return true;
        } //end fdelNS

//      **************************************************************
//      Deletes the last occurance of $NS from domain db.
//      Note: strings must match!

        function ldelNS($NS){

                $count = 0;
                $lcount = 0;
                $curns = "";
                $domain = $this->DOMAIN;

                if(!$NS){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["NS"])) return false;


                for($count=0;$count<count($this->DOMAINS[$domain]["NS"]);$count++){

                        $curns=$this->DOMAINS[$domain]["NS"][$count];
                        if(preg_match("/$NS/i",$curns))
                                $lcount=$count;
                }

                        $this->DOMAINS[$domain]["NS"][$lcount]="";
        return true;
        } //end ldelNS

//      **************************************************************
//      Deletes all occurance of $MX from domain db.
//      Note: strings must match!

        function delMX($MX){

                $count = 0;
                $curmx = "";
		$priority = 0;
                $domain = $this->DOMAIN;

                if(!$MX){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["MX"])) return false;


                for($count=0;$count<count($this->DOMAINS[$domain]["MX"]);$count++){

                        list($priority,$curmx)=split(" ",$this->DOMAINS[$domain]["MX"][$count]);
                        if(preg_match("/$MX/i",$curmx))
                                $this->DOMAINS[$domain]["MX"][$count]="";
                }
        return true;
        } //end delMX

//      **************************************************************
//      Deletes all occurance of $priority for MX from domain db.
//      Note: strings must match!

        function delMXp($delp){

                $count = 0;
                $curmx = "";
                $priority = 0;
                $domain = $this->DOMAIN;

                if(!$delp){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["MX"])) return false;


                for($count=0;$count<count($this->DOMAINS[$domain]["MX"]);$count++){

                        list($priority,$curmx)=split(" ",$this->DOMAINS[$domain]["MX"][$count]);
                        if(preg_match("/$delp/i",$priority))
                                $this->DOMAINS[$domain]["MX"][$count]="";
                }
        return true;
        } //end delMXp

//      **************************************************************
//      Deletes the first occurance of $MX from domain db.
//      Note: strings must match!

        function fdelMX($MX){

                $count = 0;
                $curmx = "";
                $priority = 0;
                $domain = $this->DOMAIN;

                if(!$MX){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["MX"])) return false;


                for($count=0;$count<count($this->DOMAINS[$domain]["MX"]);$count++){

                        list($priority,$curmx)=split(" ",$this->DOMAINS[$domain]["MX"][$count]);
                        if(preg_match("/$MX/i",$curmx)){
                                $this->DOMAINS[$domain]["MX"][$count]="";
                                break;
                        }
                }
        return true;
        } //end fdelMX

//      **************************************************************
//      Deletes the last occurance of $NS from domain db.
//      Note: strings must match!

        function ldelMX($MX){

                $count = 0;
                $lcount = 0;
                $curmx = "";
		$priority = 0;
                $domain = $this->DOMAIN;

                if(!$MX){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["MX"])) return false;


                for($count=0;$count<count($this->DOMAINS[$domain]["MX"]);$count++){

                        list($priority,$curmx)=split(" ",$this->DOMAINS[$domain]["MX"][$count]);
                        if(preg_match("/$MX/i",$curmx))
                                $lcount=$count;
                }

                        $this->DOMAINS[$domain]["MX"][$lcount]="";
        return true;
        } //end ldelMX

//      **************************************************************
//      Deletes all occurance of $CNAME from domain db.
//      Note: strings must match!

        function delCNAME($CNAME){

                $count = 0;
                $curcn = "";
                $domain = $this->DOMAIN;

                if(!$CNAME){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["CNAME"])) return false;


                for($count=0;$count<count($this->DOMAINS[$domain]["CNAME"]);$count++){

                        $curcn=$this->DOMAINS[$domain]["CNAME"][$count];
                        if(preg_match("/$CNAME/i",$curcn))
                                $this->DOMAINS[$domain]["A"][$count]="";
                }
        return true;
        } //end delCNAME

//      **************************************************************
//      Deletes the first occurance of $NS from domain db.
//      Note: strings must match!

        function fdelCNAME($CNAME){

                $count = 0;
                $curcn = "";
                $domain = $this->DOMAIN;

                if(!$CNAME){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["CNAME"])){ return false; }


                for($count=0;$count<count($this->DOMAINS[$domain]["CNAME"]);$count++){

                        $curcn=$this->DOMAINS[$domain]["CNAME"][$count];
                        if(preg_match("/$CNAME/i",$curcn)){
                                $this->DOMAINS[$domain]["CNAME"][$count]="";
                                break;
                        }
                }
        return true;
        } //end fdelCNAME

//      **************************************************************
//      Deletes the last occurance of $CNAME from domain db.
//      Note: strings must match!

        function ldelCNAME($CNAME){

                $count = 0;
                $lcount = 0;
                $curcn = "";
                $domain = $this->DOMAIN;

                if(!$CNAME){ return false; }
                if (empty($domain)){ return false; }


                if(empty($this->DOMAINS[$domain]["CNAME"])) return false;


                for($count=0;$count<count($this->DOMAINS[$domain]["CNAME"]);$count++){

                        $curcn=$this->DOMAINS[$domain]["CNAME"][$count];
                        if(preg_match("/$CNAME/i",$curcn))
                                $lcount=$count;
                }

                        $this->DOMAINS[$domain]["CNAME"][$lcount]="";
        return true;
        } //end ldelNS

//      **************************************************************
//      Error handling. Fatals immediately exit the program (very
//      few errors generate a fatal exit. Most just carp a warning
//      and continue. Logged via error_log method.

        function error ($errMsg,$die)
        {
                $this->ERROR = $errMsg;

                //      croak or carp?

                //      If logging is turned off AND this is not
                //      a Fatal error, just return

                if( (!($this->DEBUG)) && ($die != 1) ){
                        return;
                }

                if ($this->DEBUG)
                {
                        error_log($this->ERROR,0);
                }

                if($die == 1)
                {
                        echo "<B> ERROR $this->ERROR </B> <BR> \n";
                        exit;
                }

                return;
        }

//      **************************************************************
//	Check sanity

	function sane($filename){

/*
		if(!(is_file($fileaname))){
			$this->error("File [$filename] not a file.",0);
			return false;
		} 
*/
		if (!(is_readable($filename)))
                {
                        $this->error("File [$filename] not readable",0);
                        return false;
                }
                if (!(is_writeable($filename)))
                {
                        $this->error("File [$filename] not writeable",0);
                        return false;
                }
                if(is_dir($filename))
                {
                        $this->error("File [$filename] is a directory",0);
                        return false;
                }
                if(is_link($filename))
                {
                        $this->error("File [$filename] is a symlink",0);
                        return false;
                }

	return true;
	}

}

?>
