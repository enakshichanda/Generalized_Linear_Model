getwd()
wine_data <- read.csv("redWine.csv")
wine_data$quality <- factor(wine_data$quality, ordered = T)

layout(matrix(1:2,ncol=2))
cdplot(quality ~ pH, data=wine_data)
cdplot(quality ~ sulphates, data=wine_data)

# fit the model
#check for pH
ph_quality <- glm(quality ~ pH, data = wine_data,
          family = binomial())

summary(ph_quality)

# 95% Confidence Interval
confint(ph_quality, parm = "pH")

# odds-ratio
exp(coef(ph_quality)["pH"])

# 95% Confidence Interval around coefficient
exp(confint(ph_quality, parm = "pH"))

# Now with sulphate
ph_sulphate_quality <- glm(quality ~ pH + sulphates,
          data=wine_data, family = binomial())

# results
summary(ph_sulphate_quality) 

# better model?
anova(ph_quality, ph_sulphate_quality, test = "Chisq")

################### Multiply ###############################
# Now with sulphate
ph_sulphate_quality_interact <- glm(quality ~ pH * sulphates,
                           data=wine_data, family = binomial())

# results
summary(ph_sulphate_quality_interact) 

# better model?
anova(ph_quality, ph_sulphate_quality_interact, test = "Chisq")

prob <- predict(ph_sulphate_quality_interact, type="response")

# bubble plot 1
plot(sulphates ~ pH, 
     data = wine_data, 
     xlim = c(2, 5),
     ylim = c(-1, 3), 
     pch = ".")
symbols(wine_data$pH, 
        wine_data$sulphates, 
        circles = prob,
        add = TRUE)

#bubble plot 2
ggplot(wine_data, aes(x=pH, y=sulphates, size = quality, color=quality)) +
        geom_point(alpha=0.5)

################################################################################################

getwd()
wine_data <- read.csv("redWine.csv")

wine_data$quality <- factor(wine_data$quality, ordered = T)


layout(matrix(1:2,ncol=2))
cdplot(quality ~ alcohol, data=wine_data)
cdplot(quality ~ sulphates, data=wine_data)

## fit the model
#check with alcohol
alcohol_quality <- glm(quality ~ alcohol, data = wine_data,
                  family = binomial())

summary(alcohol_quality)

# 95% Confidence Interval
confint(alcohol_quality, parm = "alcohol")

# odds-ratio
exp(coef(alcohol_quality)["alcohol"])

# 95% Confidence Interval around coefficient
exp(confint(alcohol_quality, parm = "alcohol"))

# Now with sulphate
alcohol_sulphate_quality <- glm(quality ~ alcohol + sulphates,
                           data=wine_data, family = binomial())

# results
summary(alcohol_sulphate_quality)

# better model?
anova(alcohol_quality, alcohol_sulphate_quality, test = "Chisq")

prob <- predict(ph_sulphate_quality, type="response")

# bubble plot 1
plot(sulphates ~ alcohol, 
     data = wine_data, 
     xlim = c(-20, 40),
     ylim = c(-10, 20), 
     pch = ".")
symbols(wine_data$alcohol, 
        wine_data$sulphates, 
        circles = prob,
        add = TRUE)

#bubble plot 2
ggplot(wine_data, aes(x=alcohol, y=sulphates, size = quality, color=quality)) +
        geom_point(alpha=0.5)

