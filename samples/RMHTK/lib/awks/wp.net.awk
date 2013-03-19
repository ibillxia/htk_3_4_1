{
   if (NF==0) {
      if (ln>990)
	 links=1;
      else if (!ln) {
	 printf("N=%d L=%d\n",nn,nl);
	 stwd="!SENT_START";
	 printf("I=%-4d W=%s\n",0,stwd);
	 enwd="!SENT_END";
	 word="SENTENCE-END";
	 num[word]=1; words[1]=word;
	 printf("I=%-4d W=%s\n",1,enwd);
	 ln=2;
      }
   }
   else if (links) {
      if (substr($1,1,1)==">") {
	 word=substr($1,2,length($1)-1);
      }
      else {
	 like=-log(nfoll[word]);
	 if (word=="SENTENCE-END")
	    printf("J=%-5d S=%-4d E=%-4d l=%.4f\n",la,0,num[$1],like);
	 else
	    printf("J=%-5d S=%-4d E=%-4d l=%.4f\n",la,num[word],num[$1],like);
	 la++;
      }
   }
   else if (ln) {
      if (substr($1,1,1)==">") {
	 word=substr($1,2,length($1)-1);
	 nfoll[word]=0;
	 if (num[word]) {
	    n=num[word];
	 }
	 else {
	    n=ln;
	    num[word]=ln++;
	    printf("I=%-4d W=%s\n",n,word);
	 }
      }
      else
	 nfoll[word]++;
   }
   
}
