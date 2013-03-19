{
   ph[++np]=$1;
}
END {
   printf("sil\nsp\n");
   ph[++np]="sil";
   for (j=1;j<np;j++) {
      printf("%s\n",ph[j]);
      for (i=1;i<=np;i++) {
	 printf("%s-%s\n%s+%s\n",ph[i],ph[j],ph[j],ph[i]);
	 for (k=1;k<=np;k++)
	    printf("%s-%s+%s\n",ph[i],ph[j],ph[k]);
      }
   }
}
