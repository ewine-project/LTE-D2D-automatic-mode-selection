# LTE-D2D-automatic-mode-selection
TCD's contribution for LTE D2D automatic mode selection algorithms between infrastructure mode and D2D mode.
# Developed by Trinity College Dublin

Two algorithms on switching between downlink and sidelink based on SNR
Downlink and sidelink are PDSCH and PSSCH PHY layer transmission based on SDR software srsLTE.
srsLTE installation is required as prerequisition.
More information please contact yi.zhang@tcd.ie
Algorithm 1. Downlink and Sidelink working at the same time for monitoring the SNR. handover is seamless.
see file:
channel_a_b.sh
Algorithm 2. Downlink and Sidelink do not work at the same time.
see two separate files:
sl.sh and dl.sh
