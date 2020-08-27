#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{

    int i;
    int index =0;
    float j[92];
    float sin_val;
    FILE *fp;

    if((fp=fopen("sindata.txt","w")) == NULL)
    {
        printf("File could not be opened for writing \n");
        exit(1);
    }

      for(i=0;i<=90;i++)
      {
       sin_val = sin(M_PI*i/180.0);
       j[i] = sin_val;
     }

      for(i=1;i<=23;i++){
        fprintf(fp,"DCD\t");
        fprintf(fp,"%f,",j[index]);
        fprintf(fp,"%f,",j[index+1]);
        fprintf(fp,"%f,",j[index+2]);
        fprintf(fp,"%f",j[index+2]);
        fprintf(fp,"\n");
        index +=4;


      }
    fclose(fp);

    return 0;
}
