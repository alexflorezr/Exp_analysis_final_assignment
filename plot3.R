# go to the working directory
wd <- "/Users/afr/Desktop/PhD/CCW/Courses/Coursera/Data_Science_spc/Exploratory_data/Exp_analysis_final_assignment"
# set workiing directory
setwd(wd)
# read the input files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Plot number 3
library(ggplot2)
png("plot3.png")
baltimore <- subset(NEI, NEI$fips == "24510")
ggplot(baltimore, aes(x = factor(year), y=Emissions)) +
        stat_summary(fun.y =sum, geom="bar") + 
        facet_wrap(~type) +
        ylab("Emissions (tons)") + xlab("years")
dev.off()
