# Load libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Read files
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# Q4
coal <- grepl('Fuel Comb.*Coal$', SCC$EI.Sector)
coal_scc <- SCC[coal,1]
NEI <- subset(NEI, SCC == levels(coal_scc))
NEI <- tapply(NEI$Emissions, NEI$year, sum)
plot(names(NEI), NEI, xlab = 'Years', ylab = 'PM2.5', main = 'Emissions by Year for Coal Combustion-Related Sources ', type = 'l')
dev.copy(device = png, filename = 'plot4.png', width = 500, height = 400)
dev.off()
