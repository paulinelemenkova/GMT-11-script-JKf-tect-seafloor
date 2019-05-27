#!/bin/sh
# Purpose: World map of tectonic plates boundaries, global seafloor fabric, contours of individual coherent tectonic slab bodies and magnetic lineation picks
# Data source: http://www.soest.hawaii.edu/PT/GSFML/
# Eckert IV equal-area pseudocylindrical projection
# here: centered Pacific Ocean (180 grad)
# GMT modules: gmtset, gmtdefaults, pscoast, psxy, pstext, psbasemap, logo, psconvert
# Unix prog: echo
# Step-1. Generate a file
ps=GMT_tect_seafloor.ps
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
gmt pscoast -R -J -Gpapayawhip -Sazure -W0.25p -Dl \
    -Bpxg30f15a30 -Bpyg10f5a10 \
    -B+t"Tectonic plates boundaries, rotation poles, steps, slab contours, global seafloor fabric and magnetic lineation picks" \
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
# add poles of plates rotation: lon/lat coords and Rotation rate (deg./Ma)
# Data source: http://peterbird.name/publications/2003_PB2002/2003_PB2002.htm
#gmt makecpt -Crainbow -T0/52/1 -Z > rain.cpt
#gmt psxy -R -J PB2002_poles.dat.txt -i2,1,3 -Sc0.1c -Crain.cpt -Wthinner -O -K >> $ps
gmt psxy -R -J PB2002_poles.dat.txt -i2,1,3 -Sc0.1c -Wthinner,red -O -K >> $ps
gmt makecpt -Crainbow -T0/100/1 -Z > steps.cpt
#gmt psxy -R -J PB2002_steps.dat.txt -i3,2,6 -Sc0.1c -Wthickest,red -O -K >> $ps
gmt psxy -R -J PB2002_steps.dat.txt -i3,2,6 -Sc0.1c -Csteps.cpt -Wthinnest -O -K >> $ps
# Step-6. Add fracture zones and magnetic anomalies
gmt psxy -R -J GSFML_SF_DZ_KM.gmt -Wthin,green -O -K >> $ps
gmt psxy -R -J GSFML_SF_ER_KM.gmt -Wthin,cyan -O -K >> $ps
gmt psxy -R -J GSFML_SF_FZ_JW.gmt -Wthin,red -O -K >> $ps
gmt psxy -R -J GSFML_SF_FZ_KM.gmt -Wthin,violetred1 -O -K >> $ps
gmt psxy -R -J GSFML_SF_FZ_MC.gmt -Wthin,purple1 -O -K >> $ps
gmt psxy -R -J GSFML_SF_FZ_RM.gmt -Wthin,mediumorchid1 -O -K >> $ps
gmt psxy -R -J GSFML_SF_FZLC_KM.gmt -Wthin,orange -O -K >> $ps
gmt psxy -R -J GSFML_SF_PR_KM.gmt -Wthin,yellow -O -K >> $ps
gmt psxy -R -J GSFML_SF_UNCV_KM.gmt -Wthick,white -O -K >> $ps
gmt psxy -R -J GSFML_SF_VANOM_KM.gmt -Wthin,magenta -O -K >> $ps
# Step-7. Add magnetic lineation picks (gray-colored)
gmt psxy -R -J GSFML.global.picks.gmt -Sp -Gdimgray -O -K >> $ps
# Step-8. Add text labels
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
# Step-9. Add slab contours
gmt makecpt -Crainbow -T0/700/50 -Z > rain.cpt
#gmt psxy -R -J SC_aleutians.txt -Wthinner,red -O -K >> $ps
gmt psxy -R -J SC_aleutians.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_ryukyus.txt -Wthinner,magenta -O -K >> $ps
gmt psxy -R -J SC_ryukyus.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_camerica.txt -Wthinner,cyan -O -K >> $ps
gmt psxy -R -J SC_camerica.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_assam.txt -Wthinner,purple -O -K >> $ps
gmt psxy -R -J SC_assam.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_caribbean.txt -Wthinner,orange -O -K >> $ps
gmt psxy -R -J SC_caribbean.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_wphilippines.txt -Wthinner,blue -O -K >> $ps
gmt psxy -R -J SC_wphilippines.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_ephilippines.txt -Wthinner,green -O -K >> $ps
gmt psxy -R -J SC_ephilippines.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_solomons.txt -Wthinner,yellow -O -K >> $ps
gmt psxy -R -J SC_solomons.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_vanuatu.txt -Wthinner,yellowgreen -O -K >> $ps
gmt psxy -R -J SC_vanuatu.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_sulawesi.txt -Wthinner,slateblue1 -O -K >> $ps
gmt psxy -R -J SC_sulawesi.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_ssandwich.txt -Wthinner,orangered -O -K >> $ps
gmt psxy -R -J SC_ssandwich.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_samerica.txt -Wthinner,dodgerblue -O -K >> $ps
gmt psxy -R -J SC_samerica.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_nbritain.txt -Wthinner,lightseagreen -O -K >> $ps
gmt psxy -R -J SC_nbritain.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_molucca.txt -Wthinner,darkorange -O -K >> $ps
gmt psxy -R -J SC_molucca.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_mindanao.txt -Wthin,chartreuse -O -K >> $ps
gmt psxy -R -J SC_mindanao.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_luzon.txt -Wthin,firebrick3 -O -K >> $ps
gmt psxy -R -J SC_luzon.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_halmahera.txt -Wthin,royalblue1 -O -K >> $ps
gmt psxy -R -J SC_halmahera.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_marjapkur.txt -Wthinner,chocolate1 -O -K >> $ps
gmt psxy -R -J SC_marjapkur.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_indonesia.txt -Wthinner,brown3 -O -K >> $ps
gmt psxy -R -J SC_indonesia.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_italia.txt -Wthinner,aquamarine1 -O -K >> $ps
gmt psxy -R -J SC_italia.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_hindu2.txt -Wthinner,indianred2 -O -K >> $ps
gmt psxy -R -J SC_hindu2.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_hindu1.txt -Wthinner,olivedrab2 -O -K >> $ps
gmt psxy -R -J SC_hindu1.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_hellas.txt -Wthin,darkolivegreen3 -O -K >> $ps
gmt psxy -R -J SC_hellas.txt -Sp -Crain.cpt -O -K >> $ps
#gmt psxy -R -J SC_tonga.txt -Wthinner,deeppink1 -O -K >> $ps
gmt psxy -R -J SC_tonga.txt -Sp -Crain.cpt -O -K >> $ps
# Step-10. Add logo
gmt logo -R -J -Dx10.2/-2.7+o0.1i/0.1i+w2c -O >> $ps
# Step-11. Convert to image file using GhostScript (landscape orientation, 720 dpi)
gmt psconvert GMT_tect_seafloor.ps -A0.2c -E720 -Tj -Z
