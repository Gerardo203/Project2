# Load libraries
library(tidyverse)
library(dplyr)

# Read files
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# Q1
data <- tapply(NEI$Emissions, NEI$year, sum)
plot(names(data), data, type = 'l', xlab = 'Year', ylab = 'PM 2.5', main = 'Total Emissions by Year')
dev.copy(device = png, filename = 'plot1.png', width = 500, height = 400)
dev.off()

