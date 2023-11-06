# Copyright (c) 2023 Arista Networks, Inc.
# Use of this source code is governed by the Apache License 2.0
# that can be found in the LICENSE file.
from __future__ import annotations

from functools import cached_property

from ansible_collections.arista.avd.plugins.plugin_utils.eos_validate_state_utils.avdtestbase import AvdTestBase
from ansible_collections.arista.avd.plugins.plugin_utils.utils import get


class AvdTestHardware(AvdTestBase):
    """
    AvdTestHardware class for hardware tests.
    """

    anta_module = "anta.tests.hardware"
    categories = ["Hardware"]

    @cached_property
    def test_definition(self) -> dict:
        """
        Generates the proper ANTA test definition for all hardware tests.

        Returns:
            test_definition (dict): ANTA test definition.
        """
        xcvr_manufacturers = get(self.hostvars[self.device_name], "validation_role.xcvr_own_manufacturers", ["Arista Networks", "Arastra, Inc."])
        xcvr_manufacturers.append("Not Present")

        anta_tests = [
            {"VerifyEnvironmentPower": {"states": get(self.hostvars[self.device_name], "validation_role.pwr_supply_states", ["ok"])}},
            {"VerifyEnvironmentCooling": {"states": get(self.hostvars[self.device_name], "validation_role.fan_states", ["ok"])}},
            {"VerifyTemperature": {}},
            {"VerifyTransceiversManufacturers": {"manufacturers": xcvr_manufacturers}},
        ]

        return {self.anta_module: anta_tests}
