# Audio Enhancement Using DSP Filters

This repository contains a professional MATLAB implementation designed to enhance noisy audio signals using Digital Signal Processing (DSP) techniques. 

## Project Overview
Real-world audio signals are often corrupted by environmental noise. This project demonstrates how to simulate white Gaussian noise, inject it into a clean standard audio signal (`gong.mat`), and successfully filter it out using a custom-configured **Moving Average Filter**.

## Key Features
* **Noise Simulation:** Adds controlled Gaussian noise to evaluate filter performance.
* **Signal Enhancement:** Implements an 8-point Moving Average Filter to smooth out high-frequency noise elements.
* **Quantitative Analysis:** Computes and displays the Signal-to-Noise Ratio (SNR) before and after filtering to mathematically prove the enhancement.

## Files in this Repository
* `signals_dsp.m` - Main MATLAB script containing the simulation, filtering logic, and plotting commands.
* `audio_results.png` - Visual plot output showcasing the time-domain comparison.

## Visual Results
Below is the time-domain waveform comparison showing the successful reduction of noise in the third subplot:

![Audio Enhancement Analysis]
<img width="1194" height="891" alt="DSP" src="https://github.com/user-attachments/assets/fa5aabfc-ef87-473f-a322-91931046e393" />
