# stun

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
- [STUN](#stun)
  - [STUN Client](#stun-client)
  - [STUN Server](#stun-server)
  - [STUN Device Configuration](#stun-device-configuration)

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

## STUN

### STUN Client

#### Server Profiles

| Server Profile | IP address |
| -------------- | ---------- |
| server1 | 1.2.3.4 |
| server2 | 2.3.4.5 |

### STUN Server

| Server local interface |
| ---------------------- |
| ethernet1 |

### STUN Device Configuration

```eos
!
stun
   client
      server-profile server1
         ip address 1.2.3.4
      server-profile server2
         ip address 2.3.4.5
   server
      local-interface ethernet1
```
