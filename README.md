# Default Classification

This is a project that was done in SAS studio. Full coding script available here. 

We have a multivariate credit data for 100 customers and contains 20 features and 1 target binary classification. if `class` = 1, then a good customer. If `class` = 2, bad. 

we have 70% good customers and 30% bad customers in the data. 

The description for features as following: 

| #  | Attribute                           | Type        | Description / Possible Values                                                                                                                                                                                                                                            |
| -- | ----------------------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Attribute 1  | Status of existing checking account | Qualitative | A11: < 0 DM <br> A12: 0 ≤ … < 200 DM <br> A13: ≥ 200 DM / salary assigned ≥ 1 year <br> A14: No checking account                                                                                                                                                         |
| Attribute 2  | Duration                            | Numerical   | Duration in months                                                                                                                                                                                                                                                       |
| Attribute 3  | Credit history                      | Qualitative | A30: No credits taken / all credits paid back duly <br> A31: All credits at this bank paid back duly <br> A32: Existing credits paid back duly till now <br> A33: Delay in paying off in the past <br> A34: Critical account / other credits existing (not at this bank) |
| Attribute 4  | Purpose                             | Qualitative | A40: Car (new) <br> A41: Car (used) <br> A42: Furniture/equipment <br> A43: Radio/television <br> A44: Domestic appliances <br> A45: Repairs <br> A46: Education <br> A47: Vacation (?) <br> A48: Retraining <br> A49: Business <br> A410: Others                        |
| Attribute 5  | Credit amount                       | Numerical   | Credit amount in DM                                                                                                                                                                                                                                                      |
| Attribute 6  | Savings account / bonds             | Qualitative | A61: < 100 DM <br> A62: 100 ≤ … < 500 DM <br> A63: 500 ≤ … < 1000 DM <br> A64: ≥ 1000 DM <br> A65: Unknown / no savings account                                                                                                                                          |
| Attribute 7  | Present employment since            | Qualitative | A71: Unemployed <br> A72: < 1 year <br> A73: 1 ≤ … < 4 years <br> A74: 4 ≤ … < 7 years <br> A75: ≥ 7 years                                                                                                                                                               |
| Attribute 8  | Installment rate                    | Numerical   | Installment rate as % of disposable income                                                                                                                                                                                                                               |
| Attribute 9  | Personal status and sex             | Qualitative | A91: Male, divorced/separated <br> A92: Female, divorced/separated/married <br> A93: Male, single <br> A94: Male, married/widowed <br> A95: Female, single                                                                                                               |
| Attribute 10 | Other debtors / guarantors          | Qualitative | A101: None <br> A102: Co-applicant <br> A103: Guarantor                                                                                                                                                                                                                  |
| Attribute 11 | Present residence since             | Numerical   | Number of years at current residence                                                                                                                                                                                                                                     |
| Attribute 12 | Property                            | Qualitative | A121: Real estate <br> A122: Building society savings / life insurance <br> A123: Car / other (not in attribute 6) <br> A124: Unknown / no property                                                                                                                      |
| Attribute 13 | Age                                 | Numerical   | Age in years                                                                                                                                                                                                                                                             |
| Attribute 14 | Other installment plans             | Qualitative | A141: Bank <br> A142: Stores <br> A143: None                                                                                                                                                                                                                             |
| Attribute 15 | Housing                             | Qualitative | A151: Rent <br> A152: Own <br> A153: For free                                                                                                                                                                                                                            |
| Attribute 16 | Number of existing credits          | Numerical   | Number of credits at this bank                                                                                                                                                                                                                                           |
| Attribute 17 | Job                                 | Qualitative | A171: Unemployed / unskilled – non-resident <br> A172: Unskilled – resident <br> A173: Skilled employee / official <br> A174: Management / self-employed / highly qualified employee / officer                                                                           |
| Attribute 18 | People liable for maintenance       | Numerical   | Number of people dependent on applicant                                                                                                                                                                                                                                  |
| Attribute 19 | Telephone                           | Qualitative | A191: None <br> A192: Yes, registered under customer’s name                                                                                                                                                                                                              |
| Attribute 20 | Foreign worker                      | Qualitative | A201: Yes <br> A202: No                                                                                                                                                                                                                                                  |


We cleaned the original `DAT` file to .csv file with Python, and uploadded the csv file o SAS for analysis. The oreiginal dataset can be found here. 

In the first few steps, we checked the missing values, understanding the data and calculated some distributions (means, std) for numerical features. set up the target variable `default` and encode the categorical variables. 

we then fitted a logistic regression model as baseline, ML models : random forest and neural network. 

the picture above shows the predictive power for each feature according to their Gini score. The highest predictive power roghly in Attribute 5, 13, 2, 1, and attribute 8. which maps to credit amount, age, duration, status of existing chequing account. 

neural networks looks like is good at capturing good customers (59.42% true negative rate), and false negative rate is 9.7%, i.e., the likelihood of identifying a defaulter as good customer. 

we then fitted logistic regression model, achieving an AUC of 0.6696. 
 





