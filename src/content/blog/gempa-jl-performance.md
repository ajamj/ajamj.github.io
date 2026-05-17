---
title: "Gempa.jl: High-Performance Seismology in Pure Julia"
description: "Why I built a seismology framework from scratch in Julia and how it outperforms traditional Python-based tools by up to 20x."
date: 2026-05-17
tags: ["JULIA", "SEISMOLOGY", "PERFORMANCE"]
---

## The Performance Bottleneck in Seismology

For years, Python and ObsPy have been the standard tools for seismic data processing. While excellent for rapid prototyping, Python often hits a performance wall when dealing with large-scale seismic arrays or real-time high-frequency data. 

**Gempa.jl** was born out of the need for a framework that combines the ease of use of high-level languages with the performance of C/Fortran.

## Why Julia?

Julia's just-in-time (JIT) compilation and native multi-threading allow **Gempa.jl** to handle complex signal processing tasks with incredible efficiency. In my benchmarks, Gempa.jl consistently outperforms Python-based alternatives:

| Operation                      | ObsPy (Python) | Gempa.jl (Julia) | Speedup Factor |
|--------------------------------|----------------|------------------|----------------|
| Butterworth Bandpass Filter    | 1.84 s         | 0.09 s           | **20.4x**      |
| FFT & Spectral Amplitude       | 0.65 s         | 0.04 s           | **16.2x**      |
| Recursive STA/LTA (1M samples) | 3.12 s         | 0.18 s           | **17.3x**      |
| Earthquake Location Solver     | 12.4 s         | 0.85 s           | **14.6x**      |

## Key Technical Features

1. **Native MiniSEED/SAC Support**: Production-grade I/O for standard seismic formats.
2. **State-of-the-Art Phase Picking**: Real-time recursive STA/LTA and AIC pickers.
3. **TauP Travel-Time Engine**: High-precision 1D travel-time calculations.
4. **Non-linear Inversion**: Advanced earthquake location solvers using Levenberg-Marquardt.

## Quick Start Example

Conditioning a multi-component stream and running event detection in Gempa.jl is straightforward:

```julia
using Gempa

# Read and condition data
stream = read_mseed("data/test.mseed")
demean!(stream)
detrend!(stream)
filter!(stream, freqmin=1.0, freqmax=15.0, type=:bandpass)

# High-performance event detection
onsets, offsets = recursive_sta_lta(stream[1], nsta=100, nlta=1000, thr_on=3.5)
println("Detected $(length(onsets)) seismic events!")
```

## Future Direction

Gempa.jl is an open-source mission to modernize geophysical software infrastructure. I am currently working on integrating more machine learning models directly into the picking pipelines and expanding support for 3D velocity models.

[View the full project on GitHub](https://github.com/ajamj/Gempa.jl)
