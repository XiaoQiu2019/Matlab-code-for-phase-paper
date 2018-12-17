#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jul 29 13:50:06 2018

@author: Zhaojie
"""

import numpy as np
from numpy import pi
import matplotlib.pyplot as plt
from scipy import optimize
import scipy.io as iso
import scipy.signal as signal

def dtrndanl(g):
    
    lg=g.shape[0]
    window=48
    res=np.zeros((g.shape[1],g.shape[0]))
    
    for k in range (res.shape[0]):
        id_g=g[:,k].T
        d_g=np.zeros((g.shape[0]-window+1,lg))
        s=np.zeros((g.shape[0]-window+1,lg))
        for j in range (g.shape[0]-window+1):
            d_g[j,j:j+window]=signal.detrend(id_g[j:j+window])
            s[j,j:j+window]=1
        for i in range(d_g.shape[1]):
            a=d_g[:,i]
            ss=s[:,i]
            ass=np.dot(a,ss)
            res[k,i]=ass/np.sum(ss)
           
    for i in range(res.shape[0]):
        res[i,:]=res[i,:]-np.mean(res[i,:])  
    return res



data=iso.loadmat('C:/Users/ZD/Desktop/08262015-clock cell-results/local maxium separate cell/all/1cell.mat')
light_intensity=iso.loadmat('C:/Users/ZD/Desktop/08262015-clock cell-results/local maxium separate cell/all/light_intensity_calculated_from_RhodamineB')



y=data['g']/light_intensity['p'].T
y=y[:480,:]
y=dtrndanl(y)

T=np.zeros((y.shape[0]))
tx=np.arange(0,240,0.5)
phi=np.zeros((y.shape[0]))

fitfunc = lambda p, x: p[0]*np.sin(2*np.pi/p[1]*x+p[2]) # Target function
errfunc = lambda p, x, y: fitfunc(p, x) - y# Distance to the target function

for i in range( y.shape[0]):
    p0 = [2., 21, 0.8,] # Initial guess for the parameters 
    yi=y[i,:].reshape((480))
    p1, success = optimize.leastsq(errfunc, p0[:], args=(tx, yi))
    phi[i]=p1[2]
    T[i]=p1[1]
    if np.abs(phi[i])>2*pi:
        phi[i]=np.mod(phi[i],2*pi)
        if phi[i]<0:
           phi[i]=phi[i]+2*pi
    if phi[i]<0 and np.abs(phi[i])<=2*pi:
        phi[i]=phi[i]+2*pi
        
w=2*np.pi/T

ave_phi=np.mean(phi)
std_phi=np.std(phi)    
ave_w=np.mean(w)
std_w=np.std(w)        
        

