import numpy as np
from matplotlib.ticker import FuncFormatter, MultipleLocator
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv( 'noiseysine.csv' )
x = df[ 'x' ].tolist()
y = df[ 'y' ].tolist()

# show signals
plt.Figure(figsize=(1, 1.5), dpi=80)
plt.plot(x, y, label='Total')
ax = plt.gca()

ax.xaxis.set_major_formatter(FuncFormatter(
    lambda val, pos: '{:.0f}$\pi$'.format(val / np.pi) if val != 0 else '0'
))
ax.xaxis.set_major_locator(MultipleLocator(base=np.pi))

plt.legend()
plt.savefig("py_noiseysine.png", dpi=80)
plt.show()
