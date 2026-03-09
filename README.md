# OpenVPN 3 CLI Toolkit

Custom toolkit for managing OpenVPN 3 sessions on `linux`.

##  Structure
```text
.
├── account/            # Store user credentials here
│   └── bs0000xx.txt
├── vpn/                # Store .ovpn files here
│   └── ovpn_wjv_1.ovpn
├── list-configs.sh
├── register-config.sh
├── start-session.sh
├── status-session.sh
└── stop-session.sh

### Setup Credentials
```
vim account/bs0000xx.txt
```

account/bs0000xx.txt
```
USERNAME="BS0000xx@NEOMETALVPN"
PASSWORD='xxxx'
```

### Register Profile
```
./register-config.sh vpn/ovpn_wjv_1.ovpn ovpn-wjv-bs0000xx
```

### Connect
```
./start-session.sh ovpn-wjv-bs0000xx account/bs0000xx.txt
```

### Check & Stop
```
Check: ./status-session.sh
Stop: ./stop-session.sh ovpn-wjv-bs0000xx
```
