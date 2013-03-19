{
   if (NR==1) {
      printf("N=%d L=%d\n",nn,nl);
      stwd="!SENT_START";
      printf("I=%-4d W=%s\n",0,stwd);
      enwd="!SENT_START";
      word="SENTENCE-END";
      num[word]=1; words[1]=word;
      printf("I=%-4d W=%s\n",1,enwd);
      nullwd="!NULL";
      printf("I=%-4d W=%s\n",2,nullwd);
      ln=3;
   }
   if (NF==1) {
      printf("I=%-4d W=%s\n",ln++,$1);
   }
}
END {
   like=-log(ln-2);
   printf("J=%-5d S=%-4d E=%-4d l=%.4f\n",la++,0,2,0.0);
   printf("J=%-5d S=%-4d E=%-4d l=%.4f\n",la++,2,1,like);
   for (i=3;i<ln;i++)
      printf("J=%-5d S=%-4d E=%-4d l=%.4f\n",la++,2,i,like);
   for (i=3;i<ln;i++)
      printf("J=%-5d S=%-4d E=%-4d l=%.4f\n",la++,i,2,0.0);
}
