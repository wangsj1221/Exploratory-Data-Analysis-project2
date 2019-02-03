# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot5.png', width = 640, height = 480, units='px')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)

library(ggplot2)

# plot figure
NEI_Baltimore <- subset(NEI, fips=="24510"&type=="ON-ROAD")
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI_Baltimore, sum)

g <- ggplot(aggregatedTotalByYear, aes(as.factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City From 1999 to 2008')
print(g)
# close device
dev.off()
