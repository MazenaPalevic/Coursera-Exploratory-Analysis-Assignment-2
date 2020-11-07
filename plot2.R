
library(dplyr)

SMR <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- SMR %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarize(total_emissions = sum(Emissions))

with(emissions_by_year, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from Baltimore City Sources"))

dev.copy(png,'plot2.png')
dev.off()