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
    -B+t"Tectonic plates boundaries: World map" -Bx30g30 -By10g10 \
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
gmt psxy -R -J TP_Juan.txt -L -Wthick,orange -O -K >> $ps
gmt psxy -R -J TP_Nasca.txt -L -Wthickest,yellow -O -K >> $ps
gmt psxy -R -J TP_North_Am.txt -L -Wthick,orchid1 -O -K >> $ps
gmt psxy -R -J TP_Scotia.txt -L -Wthick,chartreuse1 -O -K >> $ps
gmt psxy -R -J TP_South_Am.txt -L -Wthick,maroon1 -O -K >> $ps
gmt psxy -R -J TP_Somali.txt -L -Wthickest,red -O -K >> $ps
gmt psxy -R -J TP_Okhotsk.txt -L -Wthickest,red -O -K >> $ps
# Step-9. Add text labels
echo "-160 7 PA" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "130 20 PS" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "15 15 AF" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "60 -60 AN" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "43 25 AR" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "130 -25 AU" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "-75 15 CA" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "-100 8 CO" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "90 42 EU" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "75 20 IN" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "-130 45 JF" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "-100 -20 NZ" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "-100 40 NA" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "-55 -56 SC" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "-58 -10 SA" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "50 -10 SO" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
echo "150 55 OK" | gmt pstext -R -J -F+jTL+f10p,Times-Roman,black -O -K >> $ps
# Add scale bar
gmt psbasemap -R -J \
--FONT=8p,Palatino-Roman,dimgray \
    -Lx11.8c/-1.3c+c50+w10000k+l"Eckert IV equal-area pseudocylindrical projection. Scale (km)"+f \
    -UBL/45p/-40p -O -K >> $ps
# Add logo
gmt logo -R -J -Dx10.2/-2.7+o0.1i/0.1i+w2c -O >> $ps
