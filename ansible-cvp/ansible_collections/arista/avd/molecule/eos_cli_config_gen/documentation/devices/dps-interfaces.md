# dps-interfaces

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
- [Interfaces](#interfaces)
  - [DPS Interfaces](#dps-interfaces)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | MGMT | 10.73.255.122/24 | 10.73.255.2 |

##### IPv6

| Management Interface | description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management1 | oob_management | oob | MGMT | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management1
   description oob_management
   vrf MGMT
   ip address 10.73.255.122/24
```

## Interfaces

### DPS Interfaces

#### DPS Interfaces Summary

| Interface | IP address | Shutdown | Flow tracker(s) | TCP MSS Ceiling |
| --------- | ---------- | -------- | --------------- | --------------- |
| Dps1 | 192.168.42.42/24 | True | Hardware: FT-HW<br>Sampled: FT-S | IPv4: 666<br>IPv6: 666<br>Direction: ingress |

#### DPS Interfaces Device Configuration

```eos
!
interface Dps1
   description Test DPS Interface
   shutdown
   flow tracker hardware FT-HW
   flow tracker sampled FT-S
   ip address 192.168.42.42/24
   tcp mss ceiling ipv4 666 ipv6 666 ingress
   load-interval 42
```
