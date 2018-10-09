# These codes are under the AGPLv3 licence.

# LTE-D2D-automatic-mode-selection

TCD's contribution for LTE D2D automatic mode selection algorithms between infrastructure mode and D2D mode.

# Developed by Trinity College Dublin 

Two algorithms on switching between downlink and sidelink based on SNR.

Downlink and sidelink are PDSCH and PSSCH PHY layer transmission based on open-source SDR software srsLTE (https://github.com/srsLTE).

srsLTE installation is required as prerequisition.

Algorithm 1. Downlink and Sidelink working at the same time for monitoring the SNR. handover is seamless.

see file:

channel_a_b.sh

Algorithm 2. Downlink and Sidelink do not work at the same time.

see two separate files:

sl.sh and dl.sh

# The folder of srsLTE_D2D_PHY contains a partial (ongoing) implementation of PHY PSSCH channel based on srsLTE

eNodeB.zip, Relay_UE.zip, Remote_UE.zip have to be unzipped, installed in 3 different PCs.

More information please contact yi.zhang@tcd.ie
