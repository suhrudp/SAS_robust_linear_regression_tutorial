/*IMPORT DATA*/
proc import datafile="/home/u62868661/Datasets/Robust Linear Regression/Album Sales.csv"
dbms=csv
out=df
replace;
run;

/*ORDINARY LEAST-SQUARES REGRESSION*/
proc reg data=df alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	model sales=adverts airplay attract /;
run;

/*ROBUST LINEAR REGRESSION*/
proc robustreg data=df;
   model sales=adverts airplay attract; 
run;