#A very very simple program that validates the entered password by the user, either WEAK or STRONG PASSWORD
#08-12-2014
#Von Harold Pamintuan
#CSTOOLS

for(my $loop=0; $loop<scalar(@ARGV); $loop++){

chomp(@ARGV[$loop]);
my $pass = @ARGV[$loop];
my $dictionary  = openFile();
my @stringList = split(/ /,$dictionary); 
my $newList='';
my $booleanWord =1;
my $booleanLength=0;
my $booleanSpecial=0;
my $booleanNum=0;
my $strLen = length($pass);

#validation if the password has a length of 8 and above
if($strLen>7){
	  $booleanLength =1;
	  }

#validation if the password contains number
	if ($pass =~/[0-9]+/){
	 $booleanNum=1;
	}
	
#validation if the password contains special characters
		 if ($pass =~ /[:]|[@]|[#]|[%]|[&]|[*]|[+]|[-]|[\$]/){
		 	$booleanSpecial=1;
		 }
	  
#validation if the password contains a 4 lettered word
		  for($ctr = 0; $ctr<=$strLen; $ctr++){
		    
			$strLen2 = 0;
			
				  for($ctr2 = $ctr; $ctr2<=$strLen; $ctr2++){
							
							for($ctr3 = 0; $ctr3<=$#stringList; $ctr3++){
								
								
								
								if($stringList[$ctr3]=~ /^[A-Z]/){
									if((substr($pass,$ctr,$strLen2)) eq ($stringList[$ctr3])){
									$newList =$stringList[$ctr3]." ".$newList;
									$booleanWord = 0;	
									}
								}
								elsif(((lc(substr($pass,$ctr,$strLen2))) eq lc($stringList[$ctr3])) && length($stringList[$ctr3])>3){
									$newList =$stringList[$ctr3]." ".$newList;
									$booleanWord = 0;	
									
								}
							}
							$strLen2++;
	
					}
						
		  }
	 print "\nPassword: $pass\n";
		if( ($booleanNum + $booleanSpecial + $booleanLength + $booleanWord) !=4)
		{
				
			    if($booleanLength==0){
				print"\nGiven password does not contain at least 8characters";
				}
				
				if($booleanNum==0){
				print"\nGiven password does not contain at least one numeric character";
				}
				
				if($booleanSpecial==0){
				print"\nGiven password does not contain at least one special character";
				}
				
				if($booleanWord==0){
				   
					my @wordList = split(/ /,$newList);
					
					 print $#wordList>0? "\nThe following words were found in the dictionary:":"\nOne word was found in the dictionary: "; 
					
					foreach my $word(@wordList){
						chomp($word);
						print "\n".$word;
					}
					
				}
				
					print "\n******************************************************\/";
					print "\n          $pass : WEAK PASSWORD!                    ";
					print "\n******************************************************";
		}else{
					
					print "\n******************************************************";
					print "\n         $pass : You have created a STRONG PASSWORD";
					print "\n******************************************************";
			  }
}

sub openFile(){
my $file = "dictionary.txt";

	if (-e $file){
		
		open (DATA, $file) or die "cant open";
		@lines = <DATA>;
		$stringList ='';
		foreach $item(@lines)
			{
				chomp($item);
				
				$stringList = $item." ".$stringList;
				
			}
		close(DATA);
		return $stringList;
		}
		
 	
}




