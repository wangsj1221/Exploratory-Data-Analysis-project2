# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot3.png', width = 640, height = 480, units='px')

library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# plot figure
NEI_Baltimore <- subset(NEI, fips=="24510")
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, NEI_Baltimore, sum)

g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City By "Type" from 1999 to 2008')
print(g)
# close device
dev.off()
