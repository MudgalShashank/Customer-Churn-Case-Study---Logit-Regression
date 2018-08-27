Libname S '/folders/myfolders/sample dataset';

Proc import datafile='/folders/myfolders/sample dataset/Proactive Attrition Management-Logistic Regression Case Study/
Proactive Attrition Management-Logistic Regression Case Study.csv' out=Logit dbms=csv replace;
getnames=yes;run;


/*STATISTICS CHECK*/

proc contents data=Logit varnum; run;

ods html file='/folders/myfolders/sample dataset/Proactive Attrition Management-Logistic Regression Case Study
/outliers1.xls';
proc means data=Logit N Nmiss mean std min P1 P5 P95 P99 max ;
run;
ods html close;


/*MISSING VALUES IMPUTATION*/

data Logit;
set Logit;
if	REVENUE	=	.	then	REVENUE	=	58.8539614	;
if	MOU	=	.	then	MOU	=	525.7283924	;
if	RECCHRGE	=	.	then	RECCHRGE	=	46.8764916	;
if	DIRECTAS	=	.	then	DIRECTAS	=	0.8948011	;
if	OVERAGE	=	.	then	OVERAGE	=	40.0953598	;
if	ROAM	=	.	then	ROAM	=	1.2215262	;
if	CHANGEM	=	.	then	CHANGEM	=	-10.8464614	;
if	CHANGER	=	.	then	CHANGER	=	-1.2059256	;
if	PHONES	=	.	then	PHONES	=	1.808617	;
if	MODELS	=	.	then	MODELS	=	1.561791	;
if	EQPDAYS	=	.	then	EQPDAYS	=	380.2656307	;
if	AGE1	=	.	then	AGE1	=	31.3751128	;
if	AGE2	=	.	then	AGE2	=	21.1577153	;
run;


/*OUTLIERS CAPPING*/

data Logit;
set Logit;
if	REVENUE	>	225.22	then	REVENUE	=	225.22	;
if	MOU	>	2447.75	then	MOU	=	2447.75	;
if	RECCHRGE	>	119.99	then	RECCHRGE	=	119.99	;
if	DIRECTAS	>	9.65	then	DIRECTAS	=	9.65	;
if	OVERAGE	>	427	then	OVERAGE	=	427	;
if	ROAM	>	21.53	then	ROAM	=	21.53	;
if	CHANGEM	>	737	then	CHANGEM	=	737	;
if	CHANGER	>	117.84	then	CHANGER	=	117.84	;
if	DROPVCE	>	42	then	DROPVCE	=	42	;
if	BLCKVCE	>	47	then	BLCKVCE	=	47	;
if	UNANSVCE	>	179.33	then	UNANSVCE	=	179.33	;
if	CUSTCARE	>	21	then	CUSTCARE	=	21	;
if	THREEWAY	>	4	then	THREEWAY	=	4	;
if	MOUREC	>	772.71	then	MOUREC	=	772.71	;
if	OUTCALLS	>	164.33	then	OUTCALLS	=	164.33	;
if	INCALLS	>	77	then	INCALLS	=	77	;
if	PEAKVCE	>	500	then	PEAKVCE	=	500	;
if	OPEAKVCE	>	437	then	OPEAKVCE	=	437	;
if	DROPBLK	>	71.33	then	DROPBLK	=	71.33	;
if	CALLFWDV	>	0	then	CALLFWDV	=	0	;
if	CALLWAIT	>	23.33	then	CALLWAIT	=	23.33	;
if	CHURN	>	1	then	CHURN	=	1	;
if	MONTHS	>	49	then	MONTHS	=	49	;
if	UNIQSUBS	>	5	then	UNIQSUBS	=	5	;
if	ACTVSUBS	>	4	then	ACTVSUBS	=	4	;
if	PHONES	>	7	then	PHONES	=	7	;
if	MODELS	>	5	then	MODELS	=	5	;
if	EQPDAYS	>	1150	then	EQPDAYS	=	1150	;
if	CUSTOMER	>	1098985	then	CUSTOMER	=	1098985	;
if	AGE1	>	74	then	AGE1	=	74	;
if	AGE2	>	76	then	AGE2	=	76	;
if	CHILDREN	>	1	then	CHILDREN	=	1	;
if	CREDITA	>	1	then	CREDITA	=	1	;
if	CREDITAA	>	1	then	CREDITAA	=	1	;
if	CREDITB	>	1	then	CREDITB	=	1	;
if	CREDITC	>	1	then	CREDITC	=	1	;
if	CREDITDE	>	1	then	CREDITDE	=	1	;
if	CREDITGY	>	1	then	CREDITGY	=	1	;
if	CREDITZ	>	1	then	CREDITZ	=	1	;
if	PRIZMRUR	>	1	then	PRIZMRUR	=	1	;
if	PRIZMUB	>	1	then	PRIZMUB	=	1	;
if	PRIZMTWN	>	1	then	PRIZMTWN	=	1	;
if	REFURB	>	1	then	REFURB	=	1	;
if	WEBCAP	>	1	then	WEBCAP	=	1	;
if	TRUCK	>	1	then	TRUCK	=	1	;
if	RV	>	1	then	RV	=	1	;
if	OCCPROF	>	1	then	OCCPROF	=	1	;
if	OCCCLER	>	1	then	OCCCLER	=	1	;
if	OCCCRFT	>	1	then	OCCCRFT	=	1	;
if	OCCSTUD	>	0	then	OCCSTUD	=	0	;
if	OCCHMKR	>	0	then	OCCHMKR	=	0	;
if	OCCRET	>	1	then	OCCRET	=	1	;
if	OCCSELF	>	1	then	OCCSELF	=	1	;
if	OWNRENT	>	1	then	OWNRENT	=	1	;
if	MARRYUN	>	1	then	MARRYUN	=	1	;
if	MARRYYES	>	1	then	MARRYYES	=	1	;
if	MARRYNO	>	1	then	MARRYNO	=	1	;
if	MAILORD	>	1	then	MAILORD	=	1	;
if	MAILRES	>	1	then	MAILRES	=	1	;
if	MAILFLAG	>	1	then	MAILFLAG	=	1	;
if	TRAVEL	>	1	then	TRAVEL	=	1	;
if	PCOWN	>	1	then	PCOWN	=	1	;
if	CREDITCD	>	1	then	CREDITCD	=	1	;
if	RETCALLS	>	1	then	RETCALLS	=	1	;
if	RETACCPT	>	1	then	RETACCPT	=	1	;
if	NEWCELLY	>	1	then	NEWCELLY	=	1	;
if	NEWCELLN	>	1	then	NEWCELLN	=	1	;
if	REFER	>	1	then	REFER	=	1	;
if	INCMISS	>	1	then	INCMISS	=	1	;
if	INCOME	>	9	then	INCOME	=	9	;
if	MCYCLE	>	1	then	MCYCLE	=	1	;
if	CREDITAD	>	1	then	CREDITAD	=	1	;
if	SETPRCM	>	1	then	SETPRCM	=	1	;
if	SETPRC	>	199.99	then	SETPRC	=	199.99	;
if	RETCALL	>	1	then	RETCALL	=	1	;
if	CALIBRAT	>	1	then	CALIBRAT	=	1	;
if	REVENUE	<	10	then	REVENUE	=	10	;
if	MOU	<	0	then	MOU	=	0	;
if	RECCHRGE	<	9.19	then	RECCHRGE	=	9.19	;
if	DIRECTAS	<	0	then	DIRECTAS	=	0	;
if	OVERAGE	<	0	then	OVERAGE	=	0	;
if	ROAM	<	0	then	ROAM	=	0	;
if	CHANGEM	<	-830	then	CHANGEM	=	-830	;
if	CHANGER	<	-104.15	then	CHANGER	=	-104.15	;
if	DROPVCE	<	0	then	DROPVCE	=	0	;
if	BLCKVCE	<	0	then	BLCKVCE	=	0	;
if	UNANSVCE	<	0	then	UNANSVCE	=	0	;
if	CUSTCARE	<	0	then	CUSTCARE	=	0	;
if	THREEWAY	<	0	then	THREEWAY	=	0	;
if	MOUREC	<	0	then	MOUREC	=	0	;
if	OUTCALLS	<	0	then	OUTCALLS	=	0	;
if	INCALLS	<	0	then	INCALLS	=	0	;
if	PEAKVCE	<	0	then	PEAKVCE	=	0	;
if	OPEAKVCE	<	0	then	OPEAKVCE	=	0	;
if	DROPBLK	<	0	then	DROPBLK	=	0	;
if	CALLFWDV	<	0	then	CALLFWDV	=	0	;
if	CALLWAIT	<	0	then	CALLWAIT	=	0	;
if	CHURN	<	0	then	CHURN	=	0	;
if	MONTHS	<	6	then	MONTHS	=	6	;
if	UNIQSUBS	<	1	then	UNIQSUBS	=	1	;
if	ACTVSUBS	<	1	then	ACTVSUBS	=	1	;
if	PHONES	<	1	then	PHONES	=	1	;
if	MODELS	<	1	then	MODELS	=	1	;
if	EQPDAYS	<	7	then	EQPDAYS	=	7	;
if	CUSTOMER	<	1001007	then	CUSTOMER	=	1001007	;
if	AGE1	<	0	then	AGE1	=	0	;
if	AGE2	<	0	then	AGE2	=	0	;
if	CHILDREN	<	0	then	CHILDREN	=	0	;
if	CREDITA	<	0	then	CREDITA	=	0	;
if	CREDITAA	<	0	then	CREDITAA	=	0	;
if	CREDITB	<	0	then	CREDITB	=	0	;
if	CREDITC	<	0	then	CREDITC	=	0	;
if	CREDITDE	<	0	then	CREDITDE	=	0	;
if	CREDITGY	<	0	then	CREDITGY	=	0	;
if	CREDITZ	<	0	then	CREDITZ	=	0	;
if	PRIZMRUR	<	0	then	PRIZMRUR	=	0	;
if	PRIZMUB	<	0	then	PRIZMUB	=	0	;
if	PRIZMTWN	<	0	then	PRIZMTWN	=	0	;
if	REFURB	<	0	then	REFURB	=	0	;
if	WEBCAP	<	0	then	WEBCAP	=	0	;
if	TRUCK	<	0	then	TRUCK	=	0	;
if	RV	<	0	then	RV	=	0	;
if	OCCPROF	<	0	then	OCCPROF	=	0	;
if	OCCCLER	<	0	then	OCCCLER	=	0	;
if	OCCCRFT	<	0	then	OCCCRFT	=	0	;
if	OCCSTUD	<	0	then	OCCSTUD	=	0	;
if	OCCHMKR	<	0	then	OCCHMKR	=	0	;
if	OCCRET	<	0	then	OCCRET	=	0	;
if	OCCSELF	<	0	then	OCCSELF	=	0	;
if	OWNRENT	<	0	then	OWNRENT	=	0	;
if	MARRYUN	<	0	then	MARRYUN	=	0	;
if	MARRYYES	<	0	then	MARRYYES	=	0	;
if	MARRYNO	<	0	then	MARRYNO	=	0	;
if	MAILORD	<	0	then	MAILORD	=	0	;
if	MAILRES	<	0	then	MAILRES	=	0	;
if	MAILFLAG	<	0	then	MAILFLAG	=	0	;
if	TRAVEL	<	0	then	TRAVEL	=	0	;
if	PCOWN	<	0	then	PCOWN	=	0	;
if	CREDITCD	<	0	then	CREDITCD	=	0	;
if	RETCALLS	<	0	then	RETCALLS	=	0	;
if	RETACCPT	<	0	then	RETACCPT	=	0	;
if	NEWCELLY	<	0	then	NEWCELLY	=	0	;
if	NEWCELLN	<	0	then	NEWCELLN	=	0	;
if	REFER	<	0	then	REFER	=	0	;
if	INCMISS	<	0	then	INCMISS	=	0	;
if	INCOME	<	0	then	INCOME	=	0	;
if	MCYCLE	<	0	then	MCYCLE	=	0	;
if	CREDITAD	<	0	then	CREDITAD	=	0	;
if	SETPRCM	<	0	then	SETPRCM	=	0	;
if	SETPRC	<	0	then	SETPRC	=	0	;
if	RETCALL	<	0	then	RETCALL	=	0	;
if	CALIBRAT	<	0	then	CALIBRAT	=	0	;
run;

proc means data=Logit n nmiss min max; run;


/*CHI-SQUARE TEST*/

proc freq data=Logit;
tables
CHURN*(CHILDREN	CREDITA	CREDITAA	CREDITB	CREDITC	CREDITDE	CREDITGY	CREDITZ	PRIZMRUR	
PRIZMUB	PRIZMTWN	REFURB	WEBCAP	TRUCK	RV	OCCPROF	OCCCLER	OCCCRFT	OCCSTUD	OCCHMKR	OCCRET	
OCCSELF	OWNRENT	MARRYUN	MARRYYES	MAILORD	MAILRES	MAILFLAG	TRAVEL	PCOWN	CREDITCD	
NEWCELLY	REFER	MCYCLE	CREDITAD)/chisq nocol norow nopercent;
run;


/*STEPWISE REGRESSION*/

ods graphics off;
proc reg data=Logit;
model CHURN = REVENUE	MOU	RECCHRGE	DIRECTAS	OVERAGE	ROAM	CHANGEM	CHANGER	DROPVCE	
BLCKVCE	UNANSVCE	CUSTCARE	THREEWAY	MOUREC	OUTCALLS	INCALLS	PEAKVCE	OPEAKVCE	
DROPBLK	CALLFWDV	CALLWAIT	MONTHS	UNIQSUBS	ACTVSUBS	PHONES	MODELS	EQPDAYS	AGE1	
AGE2 INCOME	SETPRC CREDITA CREDITAA CREDITB CREDITC CREDITDE PRIZMRUR PRIZMUB PRIZMTWN 
REFURB WEBCAP OCCRET OWNRENT MARRYUN MAILORD MAILRES CREDITCD NEWCELLY REFER CREDITAD
/selection = stepwise VIF STB;
run;


/*CHECKING THE NORMALITY OF VARIABLES*/

proc univariate data=Logit;
var REVENUE	MOU	RECCHRGE	DIRECTAS	OVERAGE	ROAM	CHANGEM	CHANGER	DROPVCE	BLCKVCE	
CUSTCARE	THREEWAY	MOUREC	OUTCALLS	PEAKVCE	OPEAKVCE	DROPBLK	
CALLFWDV	CALLWAIT	MONTHS	UNIQSUBS	ACTVSUBS	PHONES	MODELS	EQPDAYS	
AGE1	AGE2	INCOME	SETPRC;
histogram; run;

/*TRANSFORMING VARIABLES*/

data Logit;
set Logit;				
ln_REVENUE	=	log(REVENUE+1)	;
sqrt_MOU	=	sqrt(MOU)	;
/* RECCHRGE	=		RECCHRGE		; */
/* ln_DIRECTAS	=	log(DIRECTAS+1)	; */
/* sqrt_OVERAGE	=	sqrt(OVERAGE)	; */
/* ln_ROAM	=	log(ROAM+1)	; */
/* ln_DROPVCE	=	log(DROPVCE+1)	; */
/* ln_BLCKVCE	=	log(BLCKVCE+1)	; */
/* ln_CUSTCARE	=	log(CUSTCARE+1)	; */
/* ln_THREEWAY	=	log(THREEWAY+1)	; */
/* ln_MOUREC	=	log(MOUREC+1)	; */
/* ln_OUTCALLS	=	log(OUTCALLS+1)	; */
sqrt_PEAKVCE	= sqrt(PEAKVCE)	;
sqrt_OPEAKVCE	=	sqrt(OPEAKVCE)	;
/* ln_DROPBLK	=	log(DROPBLK+1)	; */
/* ln_CALLWAIT	=	log(CALLWAIT+1)	; */
sqrt_MONTHS	=	sqrt(MONTHS)	;
/* UNIQSUBS	=		UNIQSUBS		; */
/* ACTVSUBS	=		ACTVSUBS		; */
/* PHONES	=		PHONES		; */
/* MODELS	=		MODELS		; */
sqrt_EQPDAYS	=	sqrt(EQPDAYS)	;
/* sqrt_AGE1	=	sqrt(AGE1)	; */
/* sqrt_AGE2	=	sqrt(AGE2)	; */
/* INCOME	=		INCOME		; */
/* sqrt_SETPRC	=	sqrt(SETPRC)	; */
run;

/*TRAINING & TESTING DATASETS*/

data dev val;
set Logit;
if calibrat = 1 then output dev;
else output val;
run;


proc logistic data=dev descending outest= Model;
model CHURN = ln_REVENUE	sqrt_MOU	RECCHRGE	DIRECTAS	OVERAGE	ROAM	CHANGEM	CHANGER	
DROPVCE	BLCKVCE	/*UNANSVCE*/	CUSTCARE	THREEWAY	MOUREC	OUTCALLS	/*INCALLS*/	
sqrt_PEAKVCE	sqrt_OPEAKVCE	DROPBLK	CALLFWDV	CALLWAIT	sqrt_MONTHS	UNIQSUBS	
ACTVSUBS	PHONES	MODELS	sqrt_EQPDAYS	AGE1	AGE2 INCOME	SETPRC CREDITA CREDITAA CREDITB 
CREDITC CREDITDE PRIZMRUR PRIZMUB /*PRIZMTWN*/ REFURB WEBCAP OCCRET OWNRENT /*MARRYUN*/ MAILORD 
MAILRES CREDITCD NEWCELLY /*REFER*/ CREDITAD
/selection= stepwise STB;
output out =tmp p=newpred;
run;

data dev;
set dev;
Y=  -0.8414 + ln_REVENUE	*	0.2844	+ sqrt_MOU	*	-0.0172	+ RECCHRGE	*	-0.00625	+
OVERAGE	*	0.00127	+ ROAM	*	0.017	+ CHANGEM	*	-0.00056	+
CHANGER	*	0.0022	+ DROPVCE	*	0.00717	+ THREEWAY	*	-0.0671	+ 
sqrt_PEAKVCE	*	-0.0212	+ DROPBLK	*	0.00672	+ sqrt_MONTHS	*	-0.1033	+ 
UNIQSUBS	*	0.2063	+ ACTVSUBS	*	-0.2002	+ PHONES	*	0.0692	+
sqrt_EQPDAYS	*	0.0526	+ AGE1	*	-0.00403	+ SETPRC	*	0.00153	+
CREDITA	*	-0.0851	+ CREDITC	*	-0.1618	+ CREDITDE	*	-0.3421	+
PRIZMUB	*	-0.0549	+ REFURB	*	0.2575	+ WEBCAP	*	-0.1798	+
MAILRES	*	-0.1009	+ NEWCELLY	*	-0.0765	+ CREDITAD	*	-0.1853;
predic = exp(Y)/1+exp(Y);
run;

data val;
set val;
Y=  -0.8414 + ln_REVENUE	*	0.2844	+ sqrt_MOU	*	-0.0172	+ RECCHRGE	*	-0.00625	+ 
OVERAGE	*	0.00127	+ ROAM	*	0.017	+ CHANGEM	*	-0.00056	+
CHANGER	*	0.0022	+ DROPVCE	*	0.00717	+ THREEWAY	*	-0.0671	+
sqrt_PEAKVCE	*	-0.0212	+ DROPBLK	*	0.00672	+ sqrt_MONTHS	*	-0.1033	+
UNIQSUBS	*	0.2063	+ ACTVSUBS	*	-0.2002	+ PHONES	*	0.0692	+
sqrt_EQPDAYS	*	0.0526	+ AGE1	*	-0.00403	+ SETPRC	*	0.00153	+
CREDITA	*	-0.0851	+ CREDITC	*	-0.1618	+ CREDITDE	*	-0.3421	+ 
PRIZMUB	*	-0.0549	+ REFURB	*	0.2575	+ WEBCAP	*	-0.1798	+
MAILRES	*	-0.1009	+ NEWCELLY	*	-0.0765	+ CREDITAD	*	-0.1853;
predic = exp(Y)/1+exp(Y);
run;


/*Development*/
proc rank data=dev  descending groups=10 out=dev;
var predic;
ranks probrank;
run;

proc sql;
select probrank, count(probrank) as cnt,sum(churn) as default_cnt, min(predic) as min_p, 
max(predic) as max_p from dev
group by probrank;
quit;


/*Validation*/

proc rank data=val  descending groups=10 out=val;
var predic;
ranks probrank;
run;

proc sql;
select probrank, count(probrank) as cnt,sum(churn) as default_cnt, min(predic) as min_p, 
max(predic) as max_p from val
group by probrank;
quit;

