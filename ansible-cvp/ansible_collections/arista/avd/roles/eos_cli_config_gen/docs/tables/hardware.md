<!--
  ~ Copyright (c) 2023 Arista Networks, Inc.
  ~ Use of this source code is governed by the Apache License 2.0
  ~ that can be found in the LICENSE file.
  -->
=== "Table"

    | Variable | Type | Required | Default | Value Restrictions | Description |
    | -------- | ---- | -------- | ------- | ------------------ | ----------- |
    | [<samp>hardware</samp>](## "hardware") | Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;access_list</samp>](## "hardware.access_list") | Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;mechanism</samp>](## "hardware.access_list.mechanism") | String |  |  | Valid Values:<br>- algomatch<br>- none<br>- tcam |  |
    | [<samp>&nbsp;&nbsp;speed_groups</samp>](## "hardware.speed_groups") | List, items: Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;- speed_group</samp>](## "hardware.speed_groups.[].speed_group") | String | Required, Unique |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;serdes</samp>](## "hardware.speed_groups.[].serdes") | String |  |  |  | Serdes speed like "10g" or "25g" |

=== "YAML"

    ```yaml
    hardware:
      access_list:
        mechanism: <str>
      speed_groups:
        - speed_group: <str>
          serdes: <str>
    ```
