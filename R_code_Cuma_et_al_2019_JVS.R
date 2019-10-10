# Cuma, F., Bauman, D., Shutcha, N.M., Meerts, P. Trait divergence # 
# of woody species in relation to affinity for termite mounds in 
# Upper Katanga (DR Congo). Journal of Vegetation Science.
####################################################################
# R code appendix:
# ################


data <- read.table("traitsTetNT.txt", h = T, sep = "\t")

corr <- cor(data)
write.table(corr, file = "correlations_traits.txt", col.names = NA, sep = "\t")

library(usdm)
# Check multicollinearity using variation inflation factor (VIF):
vifcor(data, th = 0.7)

# Wilcoxon tests
# **************

# Defines termitophily factor:
term <- as.factor(Termitophilie)

# Wilcoxon test to be run for each trait:
wilcox.test(Zn ~ Termitophilie)

# Chi-squared tests:
# ******************

# For spinescence and propagule type:
# ***********************************
chisq.test(matrix(c(3, 10, 1, 13), 2, 2, byrow = TRUE), correct = FALSE)

# Foliar phenology
# ****************
chisq.test(matrix(c(4, 5, 4, 2, 10, 2), 2, 3, byrow = TRUE), correct = FALSE)


# P-value adjustment for multiple tests:
# **************************************

# Store p-values of each test in the vector 'p':
p <- c()

# P-value correction using Benjamini & Hochberg's (1995)
# false discovery rate criterion:

p.adjust(p, 'fdr')