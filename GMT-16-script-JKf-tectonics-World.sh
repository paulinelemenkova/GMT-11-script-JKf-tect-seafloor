# Purpose: World tectonic map in Eckert IV equal-area pseudocylindrical projection
# here: centered Pacific Ocean (180 grad)
# GMT modules: pscoast, psxy, logo
ps=GMT_tectonics_World
gmt pscoast -Rg -JKf180/9i -Gpapayawhip -Sazure -W0.25p -Dc \
    --FORMAT_GEO_MAP=dddF \
    --MAP_FRAME_PEN=dimgray \
    --MAP_FRAME_WIDTH=0.1c \
    --MAP_TITLE_OFFSET=0.5c \
    --MAP_TICK_PEN_PRIMARY=thinner,dimgray \
    --FONT_TITLE=12p,Palatino-Roman,black \
    --FONT_ANNOT_PRIMARY=8p,Helvetica,dimgray \
    --FONT_LABEL=8p,Helvetica,dimgray \
    -B+t"Tectonic plates boundaries, World map" -Bx30g30 -By10g10 \
    --FONT_TITLE=12p,Helvetica,dimgray \
-Vv -K > $ps
# Add tectonic plates
gmt psxy -R -J TP_Pacific.txt -L -Wthick,red -O -K >> $ps
gmt psxy -R -J TP_Philippine_Sea.txt -L -Wthick,green1 -O -K >> $ps
gmt psxy -R -J TP_African.txt -L -Wthick,turquoise1 -O -K >> $ps
gmt psxy -R -J TP_Antarctic.txt -L -Wthick,purple -O -K >> $ps
gmt psxy -R -J TP_Arabian.txt -L -Wthick,deeppink -O -K >> $ps
gmt psxy -R -J TP_Australian.txt -L -Wthick,darkolivegreen -O -K >> $ps
gmt psxy -R -J TP_Caribbean.txt -L -Wthick,magenta -O -K >> $ps
gmt psxy -R -J TP_Cocos.txt -L -Wthick,mediumpurple -O -K >> $ps
gmt psxy -R -J TP_Eurasian.txt -L -Wthick,gold -O -K >> $ps
gmt psxy -R -J TP_Indian.txt -L -Wthick,indianred2 -O -K >> $ps
gmt psxy -R -J TP_Juan.txt -L -Wthick,tomato -O -K >> $ps
gmt psxy -R -J TP_Nasca.txt -L -Wthickest,yellow -O -K >> $ps
gmt psxy -R -J TP_North_Am.txt -L -Wthick,orchid1 -O -K >> $ps
gmt psxy -R -J TP_Scotia.txt -L -Wthick,chartreuse1 -O -K >> $ps
gmt psxy -R -J TP_South_Am.txt -L -Wthick,maroon1 -O -K >> $ps
# Add scale bar
gmt psbasemap -R -J \
--FONT=8p,Palatino-Roman,dimgray \
-Lx5.3i/-0.5i+c50+w10000k+l"Eckert IV equal-area pseudocylindrical projection. Scale (km)"+f \
    -UBL/45p/-40p -O -K >> $ps
# Add logo
gmt logo -R -J -Dx10.5/-2.7+o0.1i/0.1i+w2c -O >> $ps
