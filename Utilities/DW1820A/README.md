Note from i3p9:

I've updated the kexts needed to run DW1820A properly. Put all the kexts from this folder, add their entries in config.plist -> Kernel -> Add.

Then add an entry in DeviceProperties -> Add as follows:
`PciRoot(0x0)/Pci(0x1C,0x1)/Pci(0x0,0x0)`:
* `AAPL,slot-name` (Type String): `WLAN`
* `compatible` (Type String): `pci14e4,4331`
* `device_type` (Type String): `Airport Extreme`
* `layout-id` (Type Data 4 Bytes): `20000000` (This essentially sets `brcmfx-driver` to `2` (`AirPortBrcmNIC`) 
* `model` (Type String): `DW1820A (BCM4350) 802.11ac Wireless`
* `name` (Type String): `Airport`
* `pci-aspm-default` (Type Number): `0`

Like this screenshot here:
![](https://i.imgur.com/fiLoF74.png)

Note: PciRoot location depends on your Laptop. This is specific for T450s. And the `compatible` depends on the card itself. I'm using `DW1820A 00JT494` myself. 
