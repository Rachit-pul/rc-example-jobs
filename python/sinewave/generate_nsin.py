import numpy as np
from matplotlib.ticker import FuncFormatter, MultipleLocator
import matplotlib.pyplot as plt
import pandas as pd

# create signals
x = np.linspace(0, 10 * np.pi, num=600)
n = np.random.normal(scale=8, size=x.size)
s = 100 * np.sin(x)
y = 100 * np.sin(x) + n

'''
# show signals
plt.Figure(figsize=(1, 1.5), dpi=80)
plt.plot(x, y, label='Total')
plt.plot(x, s, label='Sine')
plt.plot(x, n, label='Gaussian White Noise')
ax = plt.gca()

ax.xaxis.set_major_formatter(FuncFormatter(
    lambda val, pos: '{:.0f}$\pi$'.format(val / np.pi) if val != 0 else '0'
))
ax.xaxis.set_major_locator(MultipleLocator(base=np.pi))

plt.legend()
plt.savefig("noiseysine.png", dpi=80)
plt.show()
'''

# load data into a csv file
df = pd.DataFrame( { "x": x, "y": y } )
df.to_csv( "noiseysine.csv", index = False )
