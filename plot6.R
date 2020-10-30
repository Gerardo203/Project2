# Load libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Read files
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# Q6
data <- subset(NEI, (fips == '24510' | fips == '06037') & type == 'ON-ROAD')
data <- transform(data, city = ifelse(fips == '24510', 'Baltimore', 'Los Angeles'))
applied_data <- data %>% select(year, city, Emissions) %>% group_by(year, city) %>% summarise(across(.fns = sum))

qplot(year, Emissions, data = applied_data, color = city, geom = 'line') + ggtitle('Los Angeles vs Baltimore Emissions')


dev.copy(device = png, filename = 'plot6.png', width = 500, height = 400)
dev.off()
