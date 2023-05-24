# Remove system beep
rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf

# Install fonts
# Copy them to ~/.fonts
fc-cache -vf
