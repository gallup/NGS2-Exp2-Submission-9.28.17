#Created by Pablo Diego Rosell, PhD, for Gallup inc. in March 2017

# Load data for analysis
exp2_cooperation <- read.csv(url("https://raw.githubusercontent.com/gallup/NGS2-Exp2-Submission-9.28.17/master/cooperation_exp2.csv"),
                             header = TRUE,
                             sep = ',')

exp2_rewire <- read.csv(url("https://raw.githubusercontent.com/gallup/NGS2-Exp2-Submission-9.28.17/master/rewire_exp2.csv"),
                        header = TRUE,
                        sep = ',')

########################################################################################################################
#Hypothesis tests
########################################################################################################################
#1.1.	Individuals will be more likely to form connections with in-group members than with out-group members

glmm1.1 <- glmer(connect~ingroup + (1|playerid), data = exp2_rewire, family="binomial")
Hypothesis.1.1 <- summary(glmm1.1, corr = FALSE)

#1.2	Overall cooperation level will increase with successive rounds

glmm1.2 <- glmer(decision0d1c~round_num + (1|playerid), data = exp2_cooperation, family="binomial")
Hypothesis.1.2 <- summary(glmm1.2, corr = FALSE)

#Average cooperation by round
#plot(aggregate(cooperation$decision0d1c, list(cooperation$round_num), mean))

#2.1	In-group favoritism will be more likely in the biased pairing condition

glmm2.1 <- glmer(decision0d1c~ingroup*biased + (1|playerid), data = exp2_cooperation, family="binomial")
Hypothesis.2.1 <- summary(glmm2.1, corr = FALSE)

#3.1	Individuals in the 2 avatar condition will be more likely to form connections with in-group members than those in the 4 avatar condition

glmm3.1 <- glmer(connect~ingroup*identities + (1|playerid), data = exp2_rewire, family="binomial")
Hypothesis.3.1 <- summary(glmm3.1, corr = FALSE)

#3.2	Individuals in the 2 avatar condition will be less likely to cooperate with in-group members than those in the 4 avatar condition

glmm3.2 <- glmer(decision0d1c~ingroup*identities + (1|playerid), data = exp2_cooperation, family="binomial")
Hypothesis.3.2 <- summary(glmm3.2, corr = FALSE)
