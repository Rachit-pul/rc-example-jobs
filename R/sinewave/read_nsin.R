
data <- read.csv( file = 'noiseysine.csv' )

x = data[ , 1 ]
y = data[ , 2 ]

png( file = 'r_noiseysine.png', type='cairo' )
plot( x, y, main='Noisey Sine Function' )
