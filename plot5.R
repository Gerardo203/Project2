# Load libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Read files
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# Q5
NEI <- subset(NEI, fips == "24510" & type == 'ON-ROAD')
data <- tapply(NEI$Emissions, NEI$year, sum)
plot(names(data), data, xlab = 'Years', ylab = 'PM2.5', main = 'Emissions from Motor Vehicles in Baltimore', type = 'l')
dev.copy(device = png, filename = 'plot5.png', width = 500, height = 400)
dev.off()
