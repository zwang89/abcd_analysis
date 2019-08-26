# this is to explore the data
import numpy as np
import pandas as pd
import sklearn

abcd_dem_og = open(r'c:\Users\zwang\Desktop\pdem02.txt', 'r').readlines()
print(abcd_dem_og)
del abcd_dem_og[1]

abcd_dem = pd.DataFrame(abcd_dem_og).head()


