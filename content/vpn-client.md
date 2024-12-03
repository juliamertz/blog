+++
title = "Writing my own VPN client"
date = 2024-08-25
[taxonomies]
tags = ["VPN", "Rust", "Nix"]
kind = ["Open source"]
+++

To keep my homelab connected through a VPN at all times, I decided to write my own client for my VPN provider of choice, [ProtonVPN](https://protonvpn.com).  

ProtonVPN already offers a GUI client for Linux, but it doesn’t work on headless systems.  
There’s also a community-created CLI client, but it’s deprecated and lacks daemon capabilities.  

Building my own client also gave me the chance to tightly integrate it with NixOS, which my homelab runs on.  

Here were the requirements I set for the project:  
- Automatically set up firewall rules (to act as a kill switch)  
- Snappy user experience  
- Cross-platform support (Linux & macOS)  
- Reliable for long-running processes  

There are still a few to-dos left, but I’ve been using it for over 3 months now, and it’s been very reliable so far.  

The source code is avaiable on [my github](https://github.com/juliamertz/protonvpn-rs)
