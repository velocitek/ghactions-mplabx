FROM ubuntu:18.04

RUN dpkg --add-architecture i386 && apt-get update && \
  apt-get install -y libc6:i386 libx11-6:i386 libxext6:i386 libstdc++6:i386 libexpat1:i386 wget sudo make && \
  rm -rf /var/lib/apt/lists/*
RUN wget -nv -O /tmp/xc16 http://ww1.microchip.com/downloads/en/DeviceDoc/xc16-v1.41-full-install-linux-installer.run && \
  chmod +x /tmp/xc16 &&  \
  /tmp/xc16 --mode unattended --unattendedmodeui none --netservername localhost --LicenseType FreeMode --prefix /opt/microchip/xc16/v1.41 && \
  rm /tmp/xc16 && \
  cd /opt/microchip/xc16/v1.41/support/ && ls |grep -v -E '24F|templates|generic' |xargs rm -fr
RUN wget -nv -O  wget -nv -O /tmp/pic24 http://ww1.microchip.com/downloads/en//softwarelibrary/pic24%20mcu%20dspic%20peripheral%20lib/peripheral-libraries-for-pic24-and-dspic-v2.00-linux-installer.run &&\
  chmod +x /tmp/pic24 && /tmp/pic24 --mode unattended --prefix /opt/microchip/xc16/v1.41 && \
  rm /tmp/pic24
RUN wget -nv -O /tmp/mplabx http://ww1.microchip.com/downloads/en/DeviceDoc/MPLABX-v5.25-linux-installer.tar &&\
  cd /tmp && tar -xf /tmp/mplabx && rm /tmp/mplabx && \
  mv MPLAB*-linux-installer.sh mplabx && \
  sudo ./mplabx --nox11 -- --unattendedmodeui none --mode unattended --ipe 0 --collectInfo 0 --installdir /opt/mplabx && \
  rm mplabx && \
  cd /opt/mplabx/packs/Microchip/ && ls |grep -v PIC24F |xargs rm -fr

COPY build.sh /build.sh

ENTRYPOINT [ "/build.sh" ]
