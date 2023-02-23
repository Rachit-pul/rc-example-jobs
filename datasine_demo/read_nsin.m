
data = readmatrix( 'noiseysine.csv' );
x = data( :, 1 );
y = data( :, 2 );

plot( x, y )
title( 'Noisey Sine Function' )
xlabel( 'x' )
ylabel( 'y' )
saveas( gcf, 'mat_noiseysine.png' )
