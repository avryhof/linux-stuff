#!/usr/bin/env python3
"""
Check what version of CipherTrust Manager is compatible with the currently running Linux version.
"""
import platform
import re
import subprocess

import requests


class LSBRelease:
    distributor = None
    description = None
    release = None
    codename = None

    system = None
    kernel = None
    cpu = None
    arch = None

    def __init__(self):
        lsb_release = subprocess.run(
            ["lsb_release", "-a"], capture_output=True
        ).stdout.decode()
        self.distributor, self.description, self.release, self.codename = re.search(
            r"Distributor ID:\t(.*?)\nDescription:\t(.*?)\nRelease:\t(.*?)\nCodename:\t(.*?)$",
            lsb_release,
        ).groups()

        self.system = platform.system()
        self.kernel = platform.release()
        self.cpu = platform.processor()
        self.arch = platform.machine()


ctm = requests.get("https://packages.vormetric.com/pub/cte_compatibility_matrix.json")
cm = ctm.json()

lsb = LSBRelease()

cte_linux_version = lsb.description.replace("LTS", "").replace(" ", "").upper().strip()
cte_linux_kernel = lsb.kernel

# cte_linux_version = "UBUNTU22.04.5"
# cte_linux_kernel = "5.15.0-122-generic"

cte_os_support = (
        cm.get("MAPPING") + cm.get("EXTENDED_SUPPORT") + cm.get("ONEOFF_SUPPORT")
)
cte_linux_data_list = [x for x in cte_os_support if x.get("OS") == cte_linux_version]
if len(cte_linux_data_list) > 0:
    cte_linux_data = cte_linux_data_list[0]
    supported_cte_versions = [
        k.get("START")
        for k in cte_linux_data.get("KERNEL")
        if k.get("NUM") == cte_linux_kernel
    ]

    latest_supported_kernel = sorted([k.get("NUM") for k in cte_linux_data.get("KERNEL")])[-1]
    latest_supported_cte_version = sorted([k.get("START") for k in cte_linux_data.get("KERNEL")])[-1]

    if len(supported_cte_versions) > 0:
        supported_cte_version = supported_cte_versions[0]
        print(
            f"Your {lsb.description} ({cte_linux_version}) running Kernel {cte_linux_kernel} "
            f"supports CTE version {supported_cte_version}.\n"
        )

    else:
        supported_kernel = sorted([k.get("NUM") for k in cte_linux_data.get("KERNEL")])[
            -1
        ]
        supported_cte_version = [
            k.get("START")
            for k in cte_linux_data.get("KERNEL")
            if k.get("NUM") == supported_kernel
        ][0]

        print(
            f"Your {lsb.description} ({cte_linux_version}) is currently running kernel {cte_linux_kernel}. "
            f"CTE version {supported_cte_version} supports up to kernel {supported_kernel}.\n"
        )

else:
    print(
        f"Your {lsb.description} ({cte_linux_version}) running Kernel {cte_linux_kernel} does not support CTE.\n"
    )
