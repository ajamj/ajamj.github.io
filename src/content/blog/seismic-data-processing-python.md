---
title: "Seismic Data Processing with Python"
author: "Ajam Jamaludin"
date: 2024-01-15
tags: ["geofisika", "python", "pemrograman"]
description: "Exploring seismic data processing techniques using Python libraries like ObsPy and NumPy for earthquake analysis and visualization."
---

# Seismic Data Processing with Python

In geophysics, seismic data processing is a fundamental skill. This post explores how to work with seismic data using Python.

## Getting Started with ObsPy

ObsPy is a Python framework for processing seismological data. Here's how to read a seismic trace:

```python
from obspy import UTCDateTime
from obspy.clients.fdsn import Client

# Connect to IRIS datacenter
client = Client("IRIS")

# Get waveform data
starttime = UTCDateTime("2023-01-01T00:00:00")
endtime = starttime + 3600  # 1 hour of data

st = client.get_waveforms(
    network="IU",
    station="ANMO",
    location="00",
    channel="BHZ",
    starttime=starttime,
    endtime=endtime
)

print(st)
```

## Basic Signal Processing

Seismic data often needs filtering to remove noise:

```python
import numpy as np
from scipy.signal import butter, filtfilt

def bandpass_filter(data, lowcut, highcut, fs, order=4):
    """Apply bandpass filter to seismic data."""
    nyq = 0.5 * fs
    low = lowcut / nyq
    high = highcut / nyq
    b, a = butter(order, [low, high], btype='band')
    y = filtfilt(b, a, data)
    return y

# Apply filter
filtered_data = bandpass_filter(tr.data, 0.1, 10.0, tr.stats.sampling_rate)
```

## Visualization

Using Matplotlib for seismic wiggles:

```python
import matplotlib.pyplot as plt

fig, ax = plt.subplots(figsize=(12, 6))
for i, tr in enumerate(st):
    times = np.linspace(0, tr.stats.delta * tr.stats.npts, tr.stats.npts)
    ax.plot(times, tr.data + i * 1e7, 'k-', linewidth=0.5)

ax.set_xlabel('Time (s)')
ax.set_ylabel('Trace Number')
ax.set_title('Seismic Waveforms')
plt.show()
```

## Summary

Python provides excellent tools for seismic data processing:
- **ObsPy**: For reading/writing various seismic data formats
- **NumPy/SciPy**: For numerical computations and filtering
- **Matplotlib**: For visualization

These tools form the backbone of modern seismological research.
