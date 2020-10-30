# Load libraries
library(tidyverse)
library(dplyr)

# Read files
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# Q2
data <- filter(NEI, fips == "24510")
data <- tapply(data$Emissions, data$year, sum)
plot(names(data), data, xlab = 'Year', ylab = 'PM 2.5', main = 'Emissions by year for Baltimore', type = 'l')
dev.copy(device = png, filename = 'plot2.png', width = 500, height = 400)
dev.off()