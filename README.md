# Generalized_Linear_Model
In this red wine dataset, we’re trying to check how two different independent variables impact the dependent variable (quality) of wine.

In this scenario, pH and sulphates acts as independent variable on quality which is a dependent variable. We’re performing a binomial regression analysis for our non-distributed data. We get our p value as 0.06959 which shows no significant difference in quality. The Residual deviance is 118.40 on 1597 degrees of freedom. As per the odds ratio, it shows for every one increase of level in pH the quality of wine decreases by 0.03449905. Now, we multiply both pH and sulphate to see if adding sulphate creates any difference, but there is no significant difference as such.

After running the ‘Chi square’ test we see that after adding the second variable there is no significant improvement in the quality of wine where value of p is 0.07565. After looking into Figure 2 and Figure 3 overall we see that pH doesn’t impact wine quality but sulphate does impact the quality of wine.
