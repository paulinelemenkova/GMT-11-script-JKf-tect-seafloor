# Purpose: World tectonic map in Eckert IV equal-area pseudocylindrical projection
# here: centered Pacific Ocean (180 grad)
# GMT modules: pscoast, psxy, pstext, psbasemap, logo, psconvert
# Step-1. Generate a file
ps=GMT_tect_World.ps
# Step-2. GMT set up
gmt set FORMAT_GEO_MAP dddF \
    MAP_FRAME_PEN dimgray \
    MAP_FRAME_WIDTH 0.1c \
    MAP_TITLE_OFFSET 0.5c \
    MAP_ANNOT_OFFSET 0.2c \
    MAP_TICK_PEN_PRIMARY thinner,dimgray \
    MAP_GRID_PEN_PRIMARY thinner,dimgray \
    FONT_TITLE 12p,Palatino-Roman,black \
    FONT_ANNOT_PRIMARY 7p,Palatino-Roman,dimgray \
    FONT_LABEL 7p,Palatino-Roman,dimgray \
# Step-3. Overwrite defaults of GMT
gmtdefaults -D > .gmtdefaults
# Step-4. Add grid, scale bar, time stamp
gmt psbasemap -Rg -JKf180/9i \
    -Lx11.8c/-1.3c+c50+w10000k+l"Eckert IV equal-area pseudocylindrical projection. Scale (km)"+f \
    -UBL/45p/-40p -K > $ps
# Step-4. Add coastline, title
gmt pscoast -R -J -Gpapayawhip -Sazure -W0.25p -Dc \
    -Bpxg30f15a30 -Bpyg10f5a10 \
    -B+t"Tectonic plates boundaries: World map" \
    -Vv -O -K >> $ps
# Step-5. Add tectonic plates
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
# Step-6. Add text labels
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
# Step-7. Add logo
gmt logo -R -J -Dx10.2/-2.7+o0.1i/0.1i+w2c -O >> $ps
# Step-8. Convert to image file using GhostScript (landscape orientation, 720 dpi)
gmt psconvert GMT_tect_World.ps -A0.2c -E720 -Tj -Z
