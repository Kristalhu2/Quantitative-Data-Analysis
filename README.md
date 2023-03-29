# Quantitative-Data-Analysis
## Introduction
Vaccination has high levels of effectiveness to prevent coronavirus and the Canadian government invests to promote vaccine confidence through information sharing while there are still some people are resistant or hesitant of getting vaccinated. ​

In this research, we are interested in finding out the impact of income, symptoms, likelihood of stock up foods, concern about travel by airplane, and going to restaurants on the likelihood of people getting vaccine once available.



## Hypotheses
H1: Having enough income to meet the necessary needs does not affect the likelihood of getting vaccinated​

H2: Higher willingness of getting tested if experience symptoms does not affect the likelihood of getting vaccinated​

H3: Concerning about travelling by airplane does not affect the likelihood of getting vaccinated​

H4: Expecting to spend more on takeout foods does not affect the likelihood of getting vaccinated​

H5: Concerning about going to restaurants, bars does not affect the likelihood of getting vaccinated​

H6: Stock up on food and other essentials before the next potential outbreak does not affect the likelihood of getting vaccinated​

## Models
Dependent variable: Let Y = likelihood of getting COVID-19 vaccine once available​

x1, x2, x3, x4, x5, x6 are our key independent variables, remaining x7, x8, x9 are our control variables, and ε is the error term ​

The regression equations are the following: ​

Model 1:  Y = a + b1*x1 + b7*x7 + b8*x8 + b9*x9 + ε​

Model 2:  Y = a + b2*x2 + b7*x7 + b8*x8 + b9*x9 + ε​

Model 3:  Y = a + b3*x3 + b7*x7 + b8*x8 + b9*x9 + ε​

Model 4:  Y = a + b4*x4 + b7*x7 + b8*x8 + b9*x9 + ε​

Model 5:  Y = a + b5*x5 + b7*x7 + b8*x8 + b9*x9 + ε​

Model 6:  Y = a + b6*x6 + b7*x7 + b8*x8 + b9*x9 + ε​

## Model A
Combinate all independent variables and develop a grand model. 
Linear model gives a P-value < 0.05; therefore, the model is significant​

Model A:  VacLikelihood = 1.079 + 0.166*IncomeMeetNeeds + 0.144*SymptomsGetTest + 0.060*OrderTakeout + 0.263*ConcernGoRestaurants + 0.242*ConcernTravelPlane - 0.0118*StockFoodsEssentials + 0.065*HouseSize + 0.060*Age + 0.035*EdLevel + ε​

The AIC of the model is 7435.622​

I checked if the model has multicollinearity issue, all variables have a VIF value below 5, therefore, no need to worry​

Here, I discovered that StockFoodsEssentials has a P-value > 0.05, which does not improve the model, so I will remove this variable in the next model.​

## Model Improvement​

Remove StockFoodsEssentials from the model, which generates model B​

Apply OLR to the model B, which generates model C, and compare AIC​

Pick the lower AIC model, check for multicollinearity issue, add interaction terms if necessary, which generates model D​

The interaction term ConcernGoRestaurants*ConcernTravelPlane is added to the model to solve the multicollinearity issue​

After adding the interaction term, VIF of both variables are high, structural multicollinearity issue exits, this will be addressed in the Future Improvement section​

The AIC of the model is 4967.827​

Ordinal Logistic Regression gives P-values < 0.05; therefore, the variables are statistically significant​

So far, model D has demonstrated the largest adjusted R square and smallest AIC, therefore, the best model until this point​

## Results
In summary, I applied Linear Regression and Ordinal Logistic Regression to each smaller model, they all demonstrated significance statistically.​

When assembling the grand model, I discovered that StockFoodsEssentials did not affect the accuracy of the model; therefore, removed. ​

I concluded that the remaining independent variables all significantly affect the dependent variable.​

Thus, this model D is an efficient model to predict Y
