
echo "preparing..."
# 


amixer set 'Headphone Enable' on;
amixer set 'LINEOUT Mixer DACL' on;
amixer set 'Digital' 80%;
amixer set 'DVC Out Mute' off;
amixer set 'DVC In Mute' off;
amixer set "DVC Out" 100%;
amixer set "DVC In" 100%;

echo "set default card: card 1"
{
	echo "defaults.ctl.card 1"
	echo "defaults.pcm.card 1"
	echo "defaults.timer.card 1"
} > /etc/asound.conf


# 
echo "preparing finished..."