
# Teltonika **RUT956** — One‑Pager (Datasheet v1.23 + Flyer v1.0, 2025)

> **Purpose:** Drop this into a VS Code README / Copilot note as a compact spec + field checklist.

_Last updated: 2025‑08‑29_

---

## 1) Product Snapshot
- **Industrial LTE Cat 4** router with **dual SIM (2× 2FF)** and optional **consumer eSIM™** (up to **7 profiles** on supported HW).
- **WAN options:** Mobile, Ethernet, Wi‑Fi WAN with **automatic failover** and **load balancing**.
- **Ports:** **4× RJ45 10/100** (**1× WAN + 3× LAN**), **USB 2.0**, **RS‑232 (DB9)**, **RS‑485 (6‑pin)**, **microSD**.
- **Wireless:** Wi‑Fi 4 (2.4 GHz) AP/STA; up to **100 clients**; WPA2/WPA3/OWE/PMF; 802.11r/k/v; 802.11s mesh.
- **GNSS:** GPS/GLONASS/BeiDou/Galileo/QZSS with **NMEA** and **NTRIP**; geofencing; time sync.
- **I/O:** Rich DI/DO/AI set incl. **relay**; event engine (“I/O juggler”) with SMS/Email/RMS actions.
- **Management:** WebUI, **RMS**, TR‑069, SNMP v1/v2/v3 + Traps, SSH, JSON‑RPC, SMS/Call control, FOTA.
- **Cloud/IoT:** Azure IoT Hub (Jobs/DPS PnP), AWS IoT Core (Jobs), Cumulocity, ThingWorx; **MQTT broker & publisher**.
- **Security/VPN:** Stateful firewall, DDoS/scan protection, **WireGuard, OpenVPN, IPsec (IKEv1/v2), GRE, DMVPN, SSTP, L2TP/PPTP, Tinc, Stunnel**.
- **Rugged:** −40…+75 °C, IP30; **110 × 50 × 100 mm**, **287 g**; **9–30 VDC** input; **passive PoE Mode‑B on LAN1**.

---

## 2) Cellular & Bands
- **LTE Cat 4:** up to **150 Mbps DL / 50 Mbps UL**; 3G up to 21/5.76; 2G up to 236.8 kbps (regional).
- **SIM/eSIM:** Dual physical SIM (2FF) with advanced **SIM‑switch** rules (weak signal, data/SMS limit, roaming, no network/denied, connection fail); **consumer eSIM™** available on specific order codes.
- **Band tools:** Band lock, used‑band status; operator block/allow; multiple PDN; APN auto; bridge/passthrough.
- **North America variant (code prefix “A*****”):** LTE **B2/4/5/12/13/14/66/71** (AT&T/Verizon/T‑Mobile); **3G sunset in U.S.**

---

## 3) Interfaces & I/O
- **Ethernet:** 4× RJ45 10/100 (1× WAN, 3× LAN; auto MDI/MDIX); port mirroring; VRRP; VLAN (port/tag).
- **Serial:** RS‑232 (DB9) and RS‑485 (full/half duplex); console, Serial‑over‑IP, Modbus gateway, **NTRIP client**.
- **USB 2.0:** storage/printer/USB‑serial; Samba share; USB‑to‑serial.
- **microSD:** up to **2 TB** (FAT32/NTFS/ext2/3/4); storage/DLNA/Samba.
- **Antenna connectors:** 2× **SMA** (LTE), 2× **RP‑SMA** (Wi‑Fi), 1× **SMA** (GNSS).
- **Digital/Analog I/O (summary):**
  - **Inputs:** 1× dry (0–3 V), 1× galvanically isolated (0–30 V), 1× analog (0–24 V, **4–20 mA**), 1× digital on power connector (0–5 V low, 8–30 V high).
  - **Outputs:** 1× open‑collector (30 V, 250 mA), 1× **relay SPST** (40 V, 4 A), 1× open‑collector on power connector (30 V, 300 mA).
  - **Events:** trigger actions via Email/SMS/RMS; rules via **I/O juggler**.

---

## 4) Wi‑Fi
- **Mode:** 802.11b/g/n (2.4 GHz) AP/STA; **TravelMate** (captive pass‑through); **Relayd**.
- **Security:** WPA2‑Enterprise (PEAP/EAP‑TLS with PKCS#12), WPA2‑PSK, WPA‑EAP/PSK, **WPA3‑SAE/EAP**, **OWE**, **PMF**.
- **Advanced:** 802.11s mesh, **802.11r** fast roaming, **802.11k/v** RRM/BSS‑TM; MAC allow/block lists; QR join.

---

## 5) Networking & Security
- **Routing:** Static + Dynamic (**BGP, OSPFv2, RIP v1/v2, EIGRP, NHRP**); policy‑based routing; **VXLAN**; **VRF support**.
- **Services:** DHCP(S)/relay/reservations, DDNS (>77 providers), **DNS‑over‑HTTPS proxy**, UPnP, NTP, SMPP.
- **Hotspot:** Captive portal with **internal/external RADIUS**, MAC auth, SSO, walled garden, themes, quotas.
- **QoS/SQM:** prioritization (WMM/802.11e) by src/dst/service/protocol/port.
- **Firewall:** Port‑forward/DMZ/NAT/NAT‑T/NAT64; custom rules; TTL tweak; status/counters.
- **Threat controls:** SYN‑flood, SSH/HTTP(S) brute/scan protections (SYN‑FIN/RST/X‑mas/NULL/FIN).

---

## 6) VPN & Tunneling
- **WireGuard**, **OpenVPN** (multi client/server; 27 ciphers), **IPsec** (XFRM; IKEv1/v2; AES‑GCM suites), **GRE** (incl. over IPsec),
  **DMVPN** (Phase 2/3; dual‑hub), **SSTP**, **L2TP/PPTP** (incl. L2TPv3 & L2TP over IPsec), **Tinc**, **Stunnel**.
- **CGNAT note:** Use outbound VPNs/RMS for inbound reach when using carrier‑grade NAT.

---

## 7) Industrial/IoT Protocols
- **Modbus** (TCP client/server; RTU over RS‑232/RS‑485; custom register blocks; 8/16/32‑bit incl. float/HEX/ASCII with endian control).
- **BACnet Router** (RS‑485/TCP; multiple BACnet/IP interfaces; BBMD/BDT).
- **OPC UA** (Client/Server); **DNP3** (Station/Outstation); **DLMS/COSEM** (Client).
- **Data to Server:** HTTP(S), **MQTT** (incl. Azure MQTT); **MQTT Gateway** bridging Modbus⇄MQTT.

---

## 8) Management & Dev
- **WebUI** (HTTPS), **RMS**, **TR‑069**, **SNMP v1/v2/v3 + Traps**, **SSH**, **SMS/Call control**, **JSON‑RPC**, **FOTA**.
- **System:** Mediatek ~**580 MHz** (MIPS 24KEc), **128 MB DDR2**, **16 MB SPI flash**.
- **Firmware:** Keep‑settings upgrades, profiles/backups; Package Manager; **SDK** (BusyBox/Lua/C/C++); OEM branding.

---

## 9) Power, Physical & Environment
- **Input:** **9–30 VDC** (4‑pin, reverse‑polarity; surge >31 V for 10 µs max); **passive PoE Mode‑B on LAN1** (non‑802.3af/at/bt).
- **Consumption:** **<2 W idle**, **<7 W max**.
- **Enclosure:** Aluminum with plastic panels; **IP30**.
- **Size/Weight:** **110 × 50 × 100 mm**, **287 g**.
- **Operating range:** **−40 °C to +75 °C**, **10–90% RH** (non‑condensing).
- **Mounting:** DIN rail / wall / flat (kits).

---

## 10) Certifications & Operators
- **Regulatory/Type:** CE, UKCA, FCC/IC, PTCRB, Anatel, RCM, Giteki, IMDA, E‑mark, CB, UL/CSA Safety, RoHS, REACH, NCC.
- **Hazardous locations:** **Class I, Division 2** (Groups A–D); **Class I, Zone 2** (IIC); **T4**, **IP30**.
- **Carriers (examples):** **AT&T, Verizon, T‑Mobile** (see current certificates list for exact order codes).

---

## 11) Ordering (regional examples)
> **Choose the correct order‑code prefix for your region/carrier; eSIM availability varies by hardware.**

| Code prefix | Region | SIM | LTE‑FDD (examples) | LTE‑TDD | Notes |
|---|---|---|---|---|---|
| **A***** | **North America** | phys‑SIM; (eSIM optional HW) | **B2/4/5/12/13/14/66/71** | — | AT&T/Verizon/T‑Mobile |
| **4***** | Global | phys‑SIM | B1/2/3/4/5/7/8/12/13/18/19/20/25/26/28 | B38/39/40/41 | Broad approvals |
| **23****/73**** | EU/MEA/TH or SA/ANZ/TW (eSIM) | **eSIM** | Regional sets | B40/41 (var.) | Up to **7** profiles |
| **1****/2****/7****/9**** | Regional phys‑SIM | phys‑SIM | Regional sets | Regional | See datasheet table |

**Standard box contents (typical):** RUT956 router, 9 W PSU, **2× LTE** magnetic SMA antennas, **2× Wi‑Fi** magnetic RP‑SMA antennas, **1× GNSS** adhesive antenna, RS‑485 and I/O connector blocks, 1.5 m Ethernet cable, SIM adapter kit, QSG.  

**HS/HTS:** 8517.62 / 8517.62.00.

---

## 12) Quick Setup (field checklist)
1) **Slot SIM(s) or load eSIM profile** (on supported HW); attach LTE/Wi‑Fi/GNSS antennas.  
2) **Power 9–30 VDC** or **passive PoE (LAN1)**; connect to **LAN**; open WebUI `http://192.168.1.1` → set strong admin pwd.  
3) **Mobile → APN** (per plan; user/pass only if required) → **LTE‑only** preferred in NA → **Allowlist carrier** if needed.  
4) **Failover**: set Mobile⇄Ethernet/Wi‑Fi‑WAN with **health checks** (Ping/DNS/HTTP‑204).  
5) **Security**: disable unused services (Telnet/HTTP), keep **HTTPS/SSH** only; set firewall rules; schedule FOTA.  
6) **VPN**: bring up **WireGuard/OpenVPN/IPsec** to your hub (CGNAT safe).  
7) **Logs/Support**: System → **Administration → Troubleshoot → Download Support File** for escalations.

**Useful CLI (SSH/console)**
```bash
gsmctl -m                       # Modem model/firmware
gsmctl -s                       # Summary (operator, tech, bands, signal)
gsmctl -A 'AT+QNWINFO'          # RAT & band
gsmctl -A 'AT+CSQ'              # Raw signal (CSQ)
gsmctl -A 'AT+QENG="servingcell"'        # Serving cell
gsmctl -A 'AT+QENG="neighbourcell LTE"'  # Neighbors
ping -c 5 1.1.1.1 && traceroute 8.8.8.8  # Basic reachability
```

---

## 13) Links
- **Manual:** https://wiki.teltonika-networks.com/view/RUT956
- **Developers:** https://developers.teltonika-networks.com
- **Certificates (Americas):** https://wiki.teltonika-networks.com/view/Certificates

> Specs/features vary by **order code & firmware**. Confirm your region, operator certifications, and eSIM hardware availability before deployment.
