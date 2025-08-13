# X-LINUX-OTBR_POSIX OpenSTLinux Package

![latest tag](https://img.shields.io/github/v/tag/stm32-hotspot/stm32mp1-otbr-posix.svg?color=brightgreen)

The X-LINUX-OTBR_POSIX is a linux package running on STM32MPU and tested on STM32MP157F-DK2 and STM32MP135F-DK (also available but not tested on STM32MP257F-DK). OpenThread Border Router (OTBR) works with Radio Co Processor(RCP) STM32WB55 through a USB connection between STM32MPU and STM32WB. This meta-layer provides all recipes needed to compile ot-br-posix "https://github.com/openthread/ot-br-posix" on stm32mpu.

Two cases for RCP are available  :

  Matter/Openthread : Follow this github       [RCP-MATTER](https://github.com/stm32-hotspot/stm32wb-matter-device-over-thread/tree/main/Projects/P-NUCLEO-WB55.Nucleo/Binary_Thread_RCP)

  Openthread standalone : Follow this github   [RCP-OPENTHREAD](https://github.com/STMicroelectronics/STM32CubeWB/tree/v1.23.0/Projects/P-NUCLEO-WB55.Nucleo/Applications/Thread/Thread_RCP)


We offer two flavors of the X-LINUX-OTBR_POSIX OpenSTLinux packages:

- The X-LINUX-OTBR_POSIX Starter Package. You can directly use the packages available from the OpenSTLinux OTBR_POSIX package repository. We strongly recommend the Starter Package for demonstration purpose.

- The X-LINUX-OTBR_POSIX Distribution Package. You can generate the complete OpenSTLinux distribution enabling the X-LINUX-OTBR_POSIX packages. We recommend the Distribution Package if you wish to tune the OpenThread Border Router parameters.

> **Note**
> In this article, any command executed on the board (through the remote Terminal or the Wayland Terminal) starts with **BOARD$>**, while any command executed on the host PC starts with **PC$>**.


## Keywords 
OpenThread, OTBR, WI-FI, Internet of Things, Network, Connectivity, commissioning, CSA, Connectivity Standard Alliance, STM32MP1, P-NUCLEO-WB55 ,MATTER, CHIP, IoT.


## Release note
Details about the content of this release are available in the release note [here](https://htmlpreview.github.io/?https://github.com/stm32-hotspot/stm32mp1-otbr-posix/blob/main/Release_Notes.html).


## Boards Needed
 * Openthread Boarder Router 
    * [STM32MP157F-DK2](https://www.st.com/en/evaluation-tools/stm32mp157f-dk2.html)

  * as Thread RCP firmware P-NUCLEO-WB55 ST Radio Co-Processor (RCP) if used
    * [NUCLEO-WB55RG](https://www.st.com/en/evaluation-tools/nucleo-wb55rg.html) 


## X-LINUX_OTBR_POSIX Starter Package

For demonstration purpose, we strongly recommend to use this Starter Package.

### Install from the OpenSTLinux OTBR_POSIX repository

> **Information**
> The STMicroelectronics packages repository service is provided for evaluation purposes only, its content may be updated at any time without notice and is therefore not approved for use in production.

All the generated X-LINUX-OTBR_POSIX packages are available from the OpenSTLinux OTBR_POSIX package repository service hosted at the non-browsable URL http://extra.packages.openstlinux.st.com/OTBR_POSIX.

This repository contains X-LINUX-OTBR_POSIX packages that can be simply installed using apt-* utilities, which the same as those used on a Debian system:

- the **main** group contains the selection of OTBR_POSIX packages whose installation is automatically tested by STMicroelectronics

- the **updates** group is reserved for future uses such as package revision update.

You can install them individually or by package group.

### Prerequisites

Flash the OpenSTLinux Starter Package on the SDCard of your STM32MPU board. For OpenSTLinux ecosystem release v6.1.0:

[Select and follow the correct Starter Package procedure based on the board used](https://wiki.st.com/stm32mpu/wiki/Category:Starter_Package)

As example:
[For STM32MP157x-DK2, follow this Starter Package procedure](https://wiki.st.com/stm32mpu/wiki/STM32MP15_Discovery_kits_-_Starter_Package#Downloading_the_image_and_flashing_it_on_the_board)

Your board has an internet connection either through the network cable or through a WiFi connection (see the paragraph *Wlan Network attachment* in the last chapter of this document **STM32MP Board Setup and OpenThread Border Router Configuration** to define the WiFi connection).

> **Information**
> If your internet access depends on a proxy server, you should define the http_proxy environment variable with the following command before any apt-* commands:
>
> ```bash
> Board $> export http_proxy='http://<proxy url>:<proxy port>/'
> ```

### Configure the X-LINUX-OTBR_POSIX OpenSTLinux package repository

Once the STM32MPU board is booted, execute the following commands in the console to configure the X-LINUX-OTBR_POSIX OpenSTLinux package repository:

For ecosystem release v6.1.0:

Move to the apt archives directory
```bash
Board $> cd /var/cache/apt/archives
```

Retrieve the specific package apt-openstlinux-x-linux-otbr-posix_1.0_all.deb:
```bash
Board $> wget http://extra.packages.openstlinux.st.com/OTBR_POSIX/6.1/pool/config/a/apt-openstlinux-x-linux-otbr-posix/apt-openstlinux-x-linux-otbr-posix_1.0_all.deb
```

Install this package:
```bash
Board $> apt-get install ./apt-openstlinux-x-linux-otbr-posix_1.0_all.deb
```

> **Note**
> This command may issue the following warning message (or similar):
> ```
> N: Can't drop privileges for downloading as file '/home/root/apt-openstlinux-x-linux-otbr-posix_1.0_all.deb'
> couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
> ```
> You can safely ignore it.

Update the apt database to access the X-LINUX-OTBR_POSIX package repository:
```bash
Board $> apt-get update
```

### Install X-LINUX-OTBR_POSIX packages

Run the following command:

```bash
Board $> apt-get install packagegroup-x-linux-otbr-posix --assume-yes
```

Reboot the board:

```bash
Board $> reboot
```

You can now follow the last chapter of this document **STM32MP Board Setup and OpenThread Border Router Configuration**.


## X-Linux-OTBR_POSIX Distribution Package

With the following procedure, you can generate the complete distribution enabling the X-LINUX-OTBR_POSIX Distribution package.

> **System Requirements**
> A Linux® PC running under Ubuntu® 18.04 or 20.04 is to be used. The developer can follow the below link. https://wiki.st.com/stm32mpu/wiki/PC_prerequisites


### Generate X-LINUX-OTBR_POSIX OpenSTLinux distribution

#### Download the Distribution Package

Install the OpenSTLinux Distribution Package by following the dedicated article [STM32MPU Distribution Package](https://wiki.st.com/stm32mpu/wiki/STM32MPU_Distribution_Package) **but do not initialize the OpenEmbedded environment (do not source the envsetup.sh)**.

#### Install X-LINUX-OTBR_POSIX environment

> **Warning**
> The software package is provided AS IS, and by downloading it, you agree to be bound to the terms of the [software license agreement (SLA0048)](https://wiki.st.com/stm32mpu/wiki/OpenSTLinux_licenses#Sofware_license_agreement). The detailed content licenses can be found [here](https://htmlpreview.github.io/?https://github.com/stm32-hotspot/stm32mp1-otbr-posix/blob/main/LICENSE.md).

##### Clone the stm32mp1-otbr-posix git repository

```bash
PC $> cd <Distribution Package installation directory>/layers/meta-st
PC $> git clone "https://github.com/stm32-hotspot/stm32mp1-otbr-posix.git" meta-st-x-linux-otbr-posix
```

##### Configure Yocto project for a new environment

Source the build environment with the correct board and layer

- For STM32MP1 boards

```bash
PC $> cd <Distribution Package installation directory>
PC $> MACHINE=stm32mp1 DISTRO=openstlinux-weston BSP_DEPENDENCY='layers/meta-st/meta-st-x-linux-otbr-posix' source layers/meta-st/scripts/envsetup.sh
```

- For STM32MP2 boards

```bash
PC $> cd <Distribution Package installation directory>
PC $> MACHINE=stm32mp2 DISTRO=openstlinux-weston BSP_DEPENDENCY='layers/meta-st/meta-st-x-linux-otbr-posix' source layers/meta-st/scripts/envsetup.sh
```


##### Configure Yocto project for an already installed environment

Add the layers to the Yocto environment

```bash
PC $> cd <Distribution Package installation directory>
PC $> source layers/meta-st/scripts/envsetup.sh
PC $> bitbake-layers add-layer ../layers/meta-st/meta-st-x-linux-otbr-posix
```


##### Build the image

```bash
PC $> bitbake st-image-otbr-posix
```

The *build-openstlinuxweston-stm32mp1/tmp-glibc/deploy/images/stm32mp1* directory receives complete file system images for all supported STM32MP1 or STM32MP2 boards depending on your *MACHINE* environment setting.

Note that the build of the Distribution Package generates the images and the Flash layout files 


> **Information**
> Note that building the image might take a long time depending on the host computer performance.


#### Flashing the built image (STM32MP157F-DK2)

https://wiki.stmicroelectronics.cn/stm32mpu/wiki/STM32MP157x-DKx_-_hardware_description#Boot_related_switches



1. MB1272 motherboard: STM32MP157x 12x12, PMIC, DDR3
2. MicroSD card slot
3. 2 x USB Type-A (host) → mouse, keyboard or USB driver
4. 2 x USB Type-A (host) → mouse, Keyboard or USB driverUSB
5. micro-B (ST-LINK/V2-1) → PC virtual COM port and debug
6. Reset button
7. Ethernet → Network
8. USB Type-C (power 5V-3A)

![UG_IMAGE_1](Image/STM32MP157x-DKx_connections.png) 


Let's flash the downloaded image on the microSD card:
* Set the boot switches (1) to the off position
* Connect the USB Type-C™ (OTG) port (2) to the host PC that contains the downloaded image
* Insert the delivered microSD card into the dedicated slot (3)
* Connect the delivered power supply to the USB Type-C™ port (4)
* Press the reset button (5) to reset the board


![UG_IMAGE_2](Image/STM32MP157x-DKx_flashing_configuration.png) 





1. Launch STM32CubeProgrammer to get the GUI
2. On the top right of the window, select USB (instead of STLINK, set by default) in the connection picklist and click the "Refresh" button. The serial number is displayed if the USB is detected. Then click "Connect".

![UG_IMAGE_3](Image/STM32CubePro_GUI_210-IMAGE1.png)

3. Refresh and press to Connect 

![UG_IMAGE_4](Image/STM32CubePro_GUI_210_IMAGE2.png)

4. Select the "Open File" tab and choose the "FlashLayout_sdcard_stm32mp157f-dk2-optee.tsv"  through this path  **build-openstlinuxweston-stm32mp1/tmp-glibc/deploy/images/stm32mp1/flashlayout_st-image-otbr/extensible**

5. Fill the "Binaries Path" by browsing to the **build-openstlinuxweston-stm32mp1/tmp-glibc/deploy/images/stm32mp1/**

![UG_IMAGE_5](Image/STM32CubePro_GUI_210_FileSelectedOptee_IMAGE3.png)


#### Flashing the built image (STM32MP135F-DK)

[https://wiki.stmicroelectronics.cn/stm32mpu/wiki/STM32MP157x-DKx_-_hardware_description#Boot_related_switches](https://wiki.stmicroelectronics.cn/stm32mpu/wiki/STM32MP135x-DK_-_hardware_description#Boot_related_switches)

* MB1635 motherboard: STM32MP135F 11x11, PMIC, DDR3 (1)
* USB micro-B (ST-LINK/V2-1) → PC virtual COM port and debug (11)
* Reset button (17)

![UG_IMAGE_1](Image/STM32MP13F-DK-IMAGE1.png)

* MicroSD card slot (31)
* 4x USB Type-A (host) → mouse, keyboard or USB driver (35)
* Ethernet → Network (30, 32)
* USB Type-C Programming port (33)
* USB Type-C Power (5V-3A) (34)

  ![UG_IMAGE_2](Image/STM32MP13F-DK-IMAGE2.png)

Let's flash the downloaded image on the microSD card

* Set the boot switches to the OPEN position as in the picture below

  ![UG_IMAGE_3](Image/STM32MP135x-DK_boot_switches_flash.png)

* Connect the USB Type-C™ (OTG) port (33) to the host PC that contains the downloaded image
* Insert the delivered microSD card into the dedicated slot (31)
* Connect the power supply to the USB Type-C™ port (34)
* Press the reset button (17) to reset the board
* Launch STM32CubeProgrammer to get the GUI
* On the top right of the window, select USB (instead of STLINK, set by default) in the connection picklist and click the "Refresh" button. The serial number is displayed if the USB is detected

![UG_IMAGE_3](Image/STM32CubePro_GUI_210-IMAGE1.png)

* Then click “Connect”

![UG_IMAGE_4](Image/STM32CubePro_GUI_210_IMAGE2.png)

* Select the "Open File" tab and choose the "FlashLayout_sdcard_stm32mp135f-dk-extensible.tsv" through this path **"build-openstlinuxweston-stm32mp1/tmp-glibc/deploy/images/stm32mp1/flashlayout_st-image-otbr/extensible"**
* Fill the Binaries Path" by browsing to the **"build-openstlinuxweston-stm32mp1/tmp-glibc/deploy/images/stm32mp1”**

![UG_IMAGE_5](Image/STM32CubePro_GUI_210_FileSelectedOptee_IMAGE3.png)

 
Note: in this article, any command executed on the board (through the remote Terminal or the Wayland Terminal) starts with BOARD$> , while any command executed on the host PC starts with PC$> 

#### Power up the board

Set the boot switches in SD Card boot mode as in the picture below

:computer: STM32MP157F-DK2

![UG_IMAGE_6](Image/STM32MP157x-DKx_boot_switches_microSD_card.png)

:computer: STM32MP135F-DK

![UG_IMAGE_7](Image/STM32MP135x-DK_boot_switches_boot.png)


Press the reset button (STM32MP157F-DK2 (6) and STM32MP135F-DK (17)).


## STM32MP Board Setup and OpenThread Border Router Configuration

> **Information**
> This section is generic to the X-LINUX-OTBR_POSIX Starter and Distribution Packages.

The following command lines can be run from a Terminal through USB with ST-LINK (STM32MP157F-DK2 port (5) and STM32MP135F-DK port (11))

### WLAN Network attachment

Switch on and check WLAN interface

```bash
BOARD$>  ifconfig wlan0 up
```

```bash
BOARD$>  ifconfig wlan0 
         wlan0     Link encap:Ethernet  HWaddr 00:9D:6B:95:EB:C1
                   UP BROADCAST MULTICAST  MTU:1500  Metric:1                   /* UP indicate that your interface is UP */
                   RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                   TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                   collisions:0 txqueuelen:1000
                   RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

Scan available SSID (Access Point):

```bash
BOARD$> iw dev wlan0 scan | grep SSID
        SSID: NETWORK1
        SSID: NETWORK2
```


Set the Wi-Fi network name and password (if not already done):

```bash
BOARD$> wpa_passphrase <your_ssid_name> <your_ssid_key> >> /etc/wpa_supplicant.conf
```

Check new configuration:

```bash
BOARD$> cat /etc/wpa_supplicant.conf
        ctrl_interface=/var/run/wpa_supplicant
        ctrl_interface_group=0
        update_config=1
        network={
         ssid="your_ssid_name"
         psk="your_ssid_key"
      }
```

Connect to SSID:

```bash
BOARD$> wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant.conf
```

Link to SSID:

```bash
BOARD$> iw wlan0 link
        SSID: NETWORK1
        freq: 2462
        RX: 501 bytes (3 packets)
        TX: 4056 bytes (22 packets)
        signal: -75 dBm
        tx bitrate: 12.0 MBit/s
        bss flags:      short-preamble short-slot-time
        dtim period:    1
        beacon int:     100
```

Obtain an IPv4 address:

```bash
udhcpc -i wlan0
```


For more information, in particular to create an automatic WiFi	configuration at start up, please refer to: https://wiki.st.com/stm32mpu/wiki/How_to_setup_a_WLAN_connection


### Getting board IP address with Ethernet

You may prefer to use an ethernet cable rather a WiFi connection.

Plug in ethernet cable (7)

```
 BOARD$> ip addr show end0
 end0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether xx:xx:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff
    inet xx.xx.xx.xx/xx brd xx.xx.xx.xx scope global dynamic eth0
       valid_lft 159045sec preferred_lft 159045sec
    inet6 xxxx::xx:xx:xx:xx/xx scope link
       valid_lft forever preferred_lft forever
```

### Connecting the STM32WB55 to the STM32MP board

The STM32WB55 board is connected to the STM32MP board through a USB cable linking the STLink plug of the STM32WB55 Nucleo board with a USB-A entry of the STM32MP board.


### Configure otbr-posix on STM32MP

> **Note**
> If you have an ethernet connection rather than a WiFi one, you need to run the following command
>
> ```bash
> Board $> sed -i.bak 's/wlan0/end0/g' /etc/default/otbr-agent
> ```

Run the command

```bash
BOARD$> otbr_setup.sh
```

### Example to setup Border Router

```bash
BOARD$>  ot-ctl thread stop 
```

```bash
BOARD$>  ot-ctl ifconfig down 
```

```bash
BOARD$>  ot-ctl networkkey 00112233445566778899aabbccddeeff
```

```bash
BOARD$>  ot-ctl extpanid 1111111122222222
```

```bash
BOARD$>  ot-ctl panid 1234
```

```bash
BOARD$>  ot-ctl channel 15 
```

```bash
BOARD$>  ot-ctl ifconfig up 
```

```bash
BOARD$>  ot-ctl thread start 
```


Following this link for more information https://openthread.io/guides/
