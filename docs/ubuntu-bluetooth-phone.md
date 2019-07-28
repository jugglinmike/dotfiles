# Connect to a bluetooth-enabled feature phone using Bitpim in Ubuntu

1. Install Bitpim

       $ sudo add-apt-repository universe
       $ sudo apt-get update
       $ sudo apt-get install bitpim

2. Use the "Bluetooth" system menu to pair with the phone. Highlight the device
   in the menu to find its MAC address (hereafter referred to as
   `##:##:##:##:##:##`). In some cases, I have been unable to enable Bluetooth
   from the GUI. The follow command seems to resolve that:

       $ sudo rfkill unblock bluetooth.

3. Find the channel number (`16` in the example below):

       $ sdptool browse ##:##:##:##:##:##
       Service Name: BT DIAG
       Service RecHandle: 0x10005
       Service Class ID List:
         "Serial Port" (0x1101)
       Protocol Descriptor List:
         "L2CAP" (0x0100)
         "RFCOMM" (0x0003)
           Channel: 16
       Language Base Attr List:
         code_ISO639: 0x656e
         encoding:    0x6a
         base_offset: 0x100
       Profile Descriptor List:
         "Serial Port" (0x1101)

4. Replace `<channel number>` with the actual channel number

       $ rfcomm connect 0 ##:##:##:##:##:## <channel number>

5. Make the device readable/writable:

       $ sudo chown mike /dev/rfcomm0

6. Run Bitpim and open the "Edit Settings" dialog.
   - Select the correct "Phone Type"
   - Enter `/dev/rfcomm01` as the value for the "Com Port" option
7. Click "Get Phone Data"

Sources:

- [ubuntu Bluetooth is
  disabled](http://linuxhacks.in/2014/05/ubuntu-bluetooth-is-disabled.html)
- [Bluetooth & Bitpim with LG
  Phones](http://ubuntuforums.org/showthread.php?t=885765)
