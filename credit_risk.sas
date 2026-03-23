* uploading data;
proc import datafile="/home/u64483199/german_credit_data.csv"
    out=credit
    dbms=csv
    replace;
    getnames=yes;
run;

* understanding the data;

proc contents data=credit;
run;

proc freq data=credit;
    tables target;
run;

proc means data=credit;
run;

* set up the target as binary;

data credit;
    set credit;
    if class = 2 then default = 1;
    else default = 0;
run;

* train vs. test split;

proc surveyselect data=credit out=split seed=2026
    samprate=0.7 outall;
run;

data train test;
    set split;
    if selected then output train;
    else output test;
run;

* encode categorical variables;

proc hpdmdb data=train dmdbcat=dmdb_cat;
    class Attribute1 Attribute3 Attribute4 Attribute6 Attribute7 Attribute9 Attribute10 Attribute12 
    Attribute14 Attribute15 Attribute17 Attribute19 Attribute20;
    var Attribute2 Attribute5 Attribute8 Attribute11 Attribute13 Attribute16 Attribute18;
run;

*modelling;
* random forest;
proc hpforest data=train;
    target default / level=binary;
    input Attribute2 Attribute5 Attribute8 Attribute11 Attribute13 Attribute16 Attribute18 / level=interval;
    input Attribute1 Attribute3 Attribute4 Attribute6 Attribute7 Attribute9 Attribute10 Attribute12 
    Attribute14 Attribute15 Attribute17 Attribute19 Attribute20 / level=nominal;
run;

* neural network;
proc hpneural data=train;
    target default / level=nominal;
    input Attribute2 Attribute5 Attribute8 Attribute11 Attribute13 Attribute16 Attribute18 / level=interval;
    input Attribute1 Attribute3 Attribute4 Attribute6 Attribute7 Attribute9 Attribute10 Attribute12 
    Attribute14 Attribute15 Attribute17 Attribute19 Attribute20 / level=nominal;
    hidden 10;
    train;
run;

* logistic regression;
proc logistic data=train plots = roc;
    class  Attribute1 Attribute3 Attribute4 Attribute6 Attribute7 Attribute9 Attribute10 Attribute12 
    Attribute14 Attribute15 Attribute17 Attribute19 Attribute20 / param=ref;
    model default(event='1') = Attribute2 Attribute5 Attribute8 Attribute11 Attribute13 Attribute16 Attribute18;
    score data=test out=log_scored; * save the model;
run; 
