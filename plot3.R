# Load libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Read files
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# Q3
data <- filter(NEI, fips == "24510")
data_1 <- data %>% select(year, type, Emissions) %>% group_by(year, type) %>% summarise(across(.fns = sum))

qplot(year, Emissions, data = data_1, color = type, geom = 'line') +
        ggtitle('Emissions in Baltimore') + 
        xlab('Year') +
        ylab('PM2.5')

dev.copy(device = png, filename = 'plot3.png', width = 500, height = 400)
dev.off()
