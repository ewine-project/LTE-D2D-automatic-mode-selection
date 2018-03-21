#!/bin/bash
#This software is developed by Yi Zhang and Shekhar Jain from Trinity College Dublin, finished in September 2017.
#This file is subject to the terms and conditions defined in file 'LICENSE.txt', which is part of this source code package.

exec /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/pssch_rx_new -f 2600000000 -r 1234 -k 12345 &

sleep 30

exec /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/pdsch_ue_new -f 2500000000 -r 1234 -k 12345 &

sleep 30

read snr_dl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_DL.txt
read snr_sl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_SL.txt

echo INITIAL 
echo $snr_dl
echo $snr_sl

while true;do
   sleep 10
   CASE_SL_DL=$(echo "$snr_sl > $snr_dl" | bc)
   if [ $CASE_SL_DL == 1 ]
   then 
       killall pdsch_ue_new
       echo DOWNLINKKILLED
       snr_dl=0
       BASELINE=10.0
       read snr_sl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_SL.txt
       CASE_SL_BASE=$(echo "$snr_sl < $BASELINE" | bc) 
       if [ $CASE_SL_BASE == 1 ] 
       then  
           exec /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/pdsch_ue_new -f 2500000000 -r 1234 -k 12345 &
           sleep 30
           read snr_dl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_DL.txt
           read snr_sl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_SL.txt
           
           echo IFNUMBER2 
           echo SNR_DOWNLINK $snr_dl
           echo SNR_SIDELINK $snr_sl
           CASE_SL_DL_2=$(echo "$snr_dl > $snr_sl" | bc)
           if [ $CASE_SL_DL_2 == 1 ]
           then
               killall pssch_rx_new
           fi
       fi
    else
       killall pssch_rx_new
       echo SIDELINKKILLED
       snr_sl=0
       BASELINE=10.0
       read snr_dl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_DL.txt
       CASE_DL_BASE=$(echo "$snr_dl < $BASELINE" | bc)
       echo RUNNING 
       if [ $CASE_DL_BASE == 1 ] 
       then  
           echo shekhar
           exec /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/pssch_rx_new -f 2600000000 -r 1234 -k 12345 &
           sleep 30
           read snr_dl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_DL.txt
           read snr_sl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_SL.txt
           
           echo IFNUMBER3
           echo SNR_DOWNLINK $snr_dl
           echo SNR_SIDELINK $snr_sl
           CASE_SL_DL_3=$(echo "$snr_sl > $snr_dl" | bc)
           if [ $CASE_SL_DL_3 == 1 ]
           then
               killall pdsch_ue_new
           fi 
       fi
    fi   
done




