#!/usr/bin/env bash

curl -LO 'https://vault.centos.org/7.0.1406/updates/x86_64/Packages/linux-firmware-20140804-0.1.git6bce2b0.el7_0.noarch.rpm'
rpm -ivh --oldpackage linux-firmware-20140804-0.1.git6bce2b0.el7_0.noarch.rpm

curl -LO 'https://vault.centos.org/7.0.1406/updates/x86_64/Packages/kernel-3.10.0-123.1.2.el7.x86_64.rpm'
rpm -ivh --oldpackage kernel-3.10.0-123.1.2.el7.x86_64.rpm

reboot
