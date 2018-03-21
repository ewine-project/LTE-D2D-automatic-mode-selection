#!/bin/bash
#This software is developed by Yi Zhang and Shekhar Jain from Trinity College Dublin, finished in September 2017.
#This file is subject to the terms and conditions defined in file 'LICENSE.txt', which is part of this source code package.

exec /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/pssch_rx_new -f 2600000000 -r 1234 -k 12345 &

#sleep 20

#killall pdsch_ue_new

while true;do
   
   sleep 30
   read snr_sl  < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_SL.txt
   echo $snr_sl

   
   BASELINE=15.0
   
   HELLO=$(echo "$snr_sl > $BASELINE" | bc)
   if [ $HELLO == 1 ]
   then 
    echo SNR_SIDELINK

   #if [ "$snr_dl > $BASELINE" ]
   #then
     #echo hello world


    echo $snr_sl
   else
     echo hello
     killall pssch_rx_new
    
     #replace with sidelink bash
     #exec /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/pdsch_ue_new -f 2500000000 -r 1234 -k 12345 &
     exec /home/ctvr/internal_gui_v2/dl.sh

     read snr_dl < /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/SNR_DL.txt
     sleep 20


     if( $snr_dl < $snr_sl)
     then
        killall pdsch_ue_new
        #add sl bash file
        exec /home/ctvr/srsLTE_sidelink/srslte_sidelink/build/srslte/examples/pssch_ue_new -f 2600000000 -r 1234 -k 12345
     
     else
        break
     
     fi
  fi
done

