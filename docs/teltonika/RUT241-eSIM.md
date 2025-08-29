
# Teltonika **RUT241 eSIM™** — Concise Technical Overview (for Copilot in VS Code)

> **Purpose:** Drop-in reference for solution design, quoting, and deployment checklists.

_Last updated: 2025‑08‑29_

---

## 1) Product Snapshot
- **Industrial 4G LTE Cat 4** router with **consumer eSIM™ (SGP.22)** and **1× 2FF SIM slot** (up to **7 eSIM profiles**).
- **Auto WAN failover**, **2× 10/100 RJ45** (WAN/LAN), and **Wi‑Fi 4 (802.11b/g/n)** AP/STA.
- **CPU/RAM/Flash:** Mediatek 580 MHz (MIPS 24KEc) / **128 MB DDR2** / **16 MB SPI flash**.
- **RMS‑ready** (Remote Management System), TR‑069, SNMP, MQTT, JSON‑RPC.
- **Rugged build:** −40 °C…+75 °C, IP30 aluminum housing; **83×25×74 mm**, **~125 g**.
- **Power:** 9–30 VDC via 4‑pin; **passive PoE (Mode B) on LAN1**, power < **6.5 W** (max).

---

## 2) Interfaces & I/O
- **Cellular:** 2× SMA (LTE) connectors
- **Wi‑Fi:** 1× RP‑SMA connector (AP/STA)
- **Ethernet:** 2× RJ45 10/100 (1× WAN, 1× LAN; auto MDI/MDIX)
- **SIM:** 1× Mini SIM (2FF) + eSIM™ (up to 7 profiles)
- **Buttons/LEDs:** Reset; 3× connection‑type, 5× signal‑strength, 2× LAN, 1× power LEDs
- **Digital I/O:** 1× DI (0–6 V low, 8–30 V high), 1× DO (open collector, 30 V/300 mA max)

---

## 3) Wireless & Mobile
- **LTE Cat 4:** up to **150 Mbps DL / 50 Mbps UL**; 3G up to 21/5.76; 2G up to 236.8 kbps
- **Wi‑Fi 4 (2.4 GHz)** AP/STA; up to **50 clients**; QR join; TravelMate
- **Wi‑Fi security:** WPA2‑Enterprise (PEAP/EAP‑TLS), WPA2‑PSK, **WPA3‑SAE/EAP**, **OWE**, PMF
- **Advanced Wi‑Fi:** 802.11s mesh, 802.11r fast roaming, 802.11k/v RRM/BSS‑TM
- **SIM switch cases:** weak signal, data/SMS limit, roaming, no network/denied, data‑conn fail
- **Band tools:** Band lock & status; operator allow/deny lists; multi‑PDN; APN auto; bridge/passthrough

---

## 4) Networking & Security
- **Routing:** Static; Dynamic (**BGP, OSPFv2, RIP v1/v2, EIGRP, NHRP**); policy‑based
- **Protocols:** IPv4/IPv6, TCP/UDP, ICMP, NTP, DNS, HTTP(S), SFTP/FTP, SMTP, SSL/TLS, ARP, VRRP, PPP/PPPoE, UPnP, SSH, DHCP, Telnet, SMPP, SNMP, MQTT, WOL, **VXLAN**
- **Firewall:** Port‑forwarding, custom rules, TTL tweak, DMZ, NAT/NAT‑T/NAT64; status page & counters
- **DDoS/scan protection:** SYN‑flood, SSH/HTTP(S) attack prevention, SYN‑FIN/RST/X‑mas/NULL/FIN scan
- **Auth/Access:** PSK/X.509/TACACS+/RADIUS (int/ext), IP/login attempt blocks, time‑based lockouts
- **802.1X** (port‑based), **VLAN** (port/tag), **mobile quota** (limits & alerts), web filter (black/white)
- **TPM 2.0** identification/authentication module (per flyer)

---

## 5) VPN & Tunneling
- **OpenVPN** (multi‑client/server, 27 ciphers)
- **IPsec** (XFRM; IKEv1/v2; AES‑GCM suites)
- **GRE** (incl. over IPsec), **PPTP/L2TP** (incl. L2TPv3 & L2TP over IPsec), **Stunnel**
- **DMVPN** (Phase 2/3; dual‑hub), **SSTP**, **ZeroTier**, **WireGuard**, **Tinc**

---

## 6) Industrial/IoT Protocols & Data
- **OPC UA** (Client/Server, TCP)
- **Modbus TCP** (Client/Server; custom registers; 8/16/32‑bit formats incl. float/hex/ascii; endianness control)
- **DNP3** (Station/Outstation), **DLMS/COSEM** (Client)
- **Data to Server:** HTTP(S), MQTT (incl. Azure MQTT); Lua scripting for data pipelines
- **MQTT Gateway:** Modbus‑to‑MQTT command/data bridge

---

## 7) Cloud, Management & Dev
- **Management:** WebUI (HTTP/HTTPS), **RMS**, TR‑069, SNMP v1/v2/v3 + Traps, SSH, SMS/Call control, JSON‑RPC, FOTA
- **Platforms:** **Azure IoT Hub** (direct methods + DPS PnP), **AWS IoT Core** (Jobs), **ThingWorx**, **Cumulocity**
- **Firmware/Dev:** Keep‑settings upgrade, profiles/backups, Package Manager; SDK; BusyBox shell, Lua, C/C++; OEM re‑branding

---

## 8) Power & Environmental
- **Input:** 9–30 VDC 4‑pin (rev‑polarity; surge >31 V for 10 µs max)
- **Passive PoE:** Spare‑pair Mode‑B via **LAN1** (not IEEE 802.3af/at/bt)
- **Consumption:** < **6.5 W** max
- **Operating range:** **−40 °C to +75 °C**, **10–90% RH** (non‑condensing)
- **Ingress:** **IP30**
- **Mounting:** DIN rail / wall / flat (kits)

---

## 9) Physical
- **Enclosure:** Aluminum housing w/ plastic panels
- **Dimensions (W×H×D):** **83 × 25 × 74 mm**
- **Weight:** **≈125 g**

---

## 10) Certifications & Operators (high‑level)
- **Regulatory/Type:** CE, UKCA, FCC/IC, PTCRB, RCM, KC, Giteki, IMDA, NOM, E‑mark, CB, UL/CSA Safety, RoHS, REACH, R118
- **EMC/RF/Safety refs:** EN 55032/55035/61000‑x, EN 300 328, EN 301 511, EN 301 908‑x, EN/IEC 62368‑1, 62311, etc.
- **Operator listings (NA/EU examples):** AT&T, Verizon, T‑Mobile, U.S. Cellular (see certificates wiki for details).

---

## 11) Regional Variants & Bands (selected)
> **Note:** Order‑code prefixes distinguish **eSIM** (e.g., **23****, 29****) vs **physical‑SIM** variants (**\*3****, \*9****, etc.). Always confirm local approvals & operators.

| Region / Code | LTE‑FDD | LTE‑TDD | 3G | 2G |
|---|---|---|---|---|
| **Global eSIM (23****)** | B1/2/3/4/5/7/8/12/13/18/19/20/25/26/28 | B38/39/40/41 | B1/2/4/5/6/8/19 | B2/3/5/8 |
| **North America eSIM (29****)** | B2/4/12/13/14/66/71 | — | B2/4/5 | — |
| **Europe eSIM (21****)** | B1/3/5/7/8/20 | B40 | B1/5/8 | B3/8 |
| **EU/MEA/TH eSIM (20****)** | B1/3/7/8/20/28A | — | B1/8 | B3/8 |
| **ANZ/Taiwan eSIM (26****)** | B1/3/5/7/8/28 | B40 | B1/5/8 | B3/5/8 |
| **LatAm eSIM (27****)** | B1/2/3/4/5/7/8/28 | B40 | B1/2/4/5/8 | B2/3/5/8 |
| **Japan eSIM (28****)** | B1/3/8/18/19/26 | B41 | B1/6/8/19 | — |
| **Global phys‑SIM (\*3****)** | B1/2/3/4/5/7/8/12/13/18/19/20/25/26/28 | B38/39/40/41 | B1/2/4/5/6/8/19 | B2/3/5/8 |
| **North America phys‑SIM (\*9****)** | B2/4/5/12/13/14/66/71 | — | B2/4/5 | — |
| **Europe phys‑SIM examples (\*0****, \*1****)** | see 20/21 FDD/TDD sets | see 21 (B40) | see 21 | see 21 |

> **Tip:** For AT&T/Verizon/T‑Mobile projects in the U.S., prefer **29**** (eSIM)** or **\*9**** (phys‑SIM)** order codes.

---

## 12) In‑Box (typical)
- Router RUT241
- 9 W PSU
- 2× LTE swivel SMA antennas
- 1× Wi‑Fi RP‑SMA antenna
- 1.5 m Ethernet cable
- SIM adapter kit
- Quick Start Guide (QSG)

---

## 13) Notes & Links
- **Manual:** https://wiki.teltonika-networks.com/view/RUT241_Manual  
- **Dev API:** https://developers.teltonika-networks.com  
- **Certificates & operators:** see the Teltonika Certificates wiki page for current carrier approvals.
- Specs may vary by **order code** and **firmware**; confirm for your target region/carrier before deployment.

