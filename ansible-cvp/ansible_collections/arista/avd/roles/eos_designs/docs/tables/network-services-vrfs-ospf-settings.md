<!--
  ~ Copyright (c) 2023 Arista Networks, Inc.
  ~ Use of this source code is governed by the Apache License 2.0
  ~ that can be found in the LICENSE file.
  -->
=== "Table"

    | Variable | Type | Required | Default | Value Restrictions | Description |
    | -------- | ---- | -------- | ------- | ------------------ | ----------- |
    | [<samp>&lt;network_services_keys.name&gt;</samp>](## "&lt;network_services_keys.name&gt;") | List, items: Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;- name</samp>](## "&lt;network_services_keys.name&gt;.[].name") | String | Required, Unique |  |  | Specify a tenant name.<br>Tenant provide a construct to group L3 VRFs and L2 VLANs.<br>Networks services can be filtered by tenant name.<br> |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;vrfs</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs") | List, items: Dictionary |  |  |  | VRFs will only be configured on a node if any of the underlying objects like `svis` or `l3_interfaces` apply to the node.<br><br>It is recommended to only define a VRF in one Tenant. If the same VRF name is used across multiple tenants and those tenants<br>are accepted by `filter.tenants` on the node, any object set under the duplicate VRFs must either be unique or be an exact match.<br><br>VRF "default" is partially supported under network-services. Currently the supported options for "default" vrf are route-target,<br>route-distinguisher settings, structured_config, raw_eos_cli in bgp and SVIs are the only supported interface type.<br>Vlan-aware-bundles are supported as well inside default vrf. OSPF is not supported currently.<br> |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- name</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].name") | String | Required, Unique |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ospf</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf") | Dictionary |  |  |  | Router OSPF configuration.<br>This will create an OSPF routing instance in the tenant VRF. If there is no nodes definition, the OSPF instance will be<br>created on all leafs where the VRF is deployed. This will also cause automatic OSPF redistribution into BGP unless<br>explicitly turned off with "redistribute_ospf: false".<br> |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enabled</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.enabled") | Boolean |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;process_id</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.process_id") | Integer |  |  |  | If not set, "vrf_id" will be used. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;router_id</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.router_id") | String |  |  |  | If not set, switch router_id will be used. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;max_lsa</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.max_lsa") | Integer |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bfd</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.bfd") | Boolean |  | `False` |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redistribute_bgp</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.redistribute_bgp") | Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enabled</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.redistribute_bgp.enabled") | Boolean |  | `True` |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;route_map</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.redistribute_bgp.route_map") | String |  |  |  | Route-map name. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redistribute_connected</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.redistribute_connected") | Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enabled</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.redistribute_connected.enabled") | Boolean |  | `False` |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;route_map</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.redistribute_connected.route_map") | String |  |  |  | Route-map name. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nodes</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.nodes") | List, items: String |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- &lt;str&gt;</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].ospf.nodes.[].&lt;str&gt;") | String |  |  |  | Hostname. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redistribute_ospf</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].redistribute_ospf") | Boolean |  | `True` |  | Non-selectively enabling or disabling redistribute ospf inside the VRF. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;svis</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis") | List, items: Dictionary |  |  |  | List of SVIs.<br>This will create both the L3 SVI and L2 VLAN based on filters applied to the node.<br> |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- id</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].id") | Integer | Required, Unique |  | Min: 1<br>Max: 4096 | SVI interface id and VLAN id. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nodes</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes") | List, items: Dictionary |  |  |  | Define node specific configuration, such as unique IP addresses.<br>Any keys set here will be merged onto the SVI config, except `structured_config` keys which will replace the `structured_config` set on SVI level.<br> |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- node</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].node") | String | Required, Unique |  |  | l3_leaf inventory hostname |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ospf</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf") | Dictionary |  |  |  | OSPF interface configuration. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enabled</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.enabled") | Boolean |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;point_to_point</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.point_to_point") | Boolean |  | `True` |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;area</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.area") | String |  | `0` |  | OSPF area ID. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cost</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.cost") | Integer |  |  |  | OSPF link cost. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;authentication</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.authentication") | String |  |  | Valid Values:<br>- simple<br>- message-digest |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;simple_auth_key</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.simple_auth_key") | String |  |  |  | Password used with simple authentication. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;message_digest_keys</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.message_digest_keys") | List, items: Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- id</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.message_digest_keys.[].id") | Integer |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hash_algorithm</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.message_digest_keys.[].hash_algorithm") | String |  | `sha512` | Valid Values:<br>- md5<br>- sha1<br>- sha256<br>- sha384<br>- sha512 |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;key</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].nodes.[].ospf.message_digest_keys.[].key") | String |  |  |  | Type 7 encrypted key. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ospf</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf") | Dictionary |  |  |  | OSPF interface configuration. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enabled</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.enabled") | Boolean |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;point_to_point</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.point_to_point") | Boolean |  | `True` |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;area</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.area") | String |  | `0` |  | OSPF area ID. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cost</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.cost") | Integer |  |  |  | OSPF link cost. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;authentication</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.authentication") | String |  |  | Valid Values:<br>- simple<br>- message-digest |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;simple_auth_key</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.simple_auth_key") | String |  |  |  | Password used with simple authentication. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;message_digest_keys</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.message_digest_keys") | List, items: Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- id</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.message_digest_keys.[].id") | Integer |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hash_algorithm</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.message_digest_keys.[].hash_algorithm") | String |  | `sha512` | Valid Values:<br>- md5<br>- sha1<br>- sha256<br>- sha384<br>- sha512 |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;key</samp>](## "&lt;network_services_keys.name&gt;.[].vrfs.[].svis.[].ospf.message_digest_keys.[].key") | String |  |  |  | Type 7 encrypted key. |
    | [<samp>svi_profiles</samp>](## "svi_profiles") | List, items: Dictionary |  |  |  | Profiles to share common settings for SVIs under `<network_services_key>.[].vrfs.svis`.<br>Keys are the same used under SVIs. Keys defined under SVIs take precedence.<br>Note: structured configuration is not merged recursively and will be taken directly from the most specific level in the following order:<br>1. svi.nodes[inventory_hostname].structured_config<br>2. svi_profile.nodes[inventory_hostname].structured_config<br>3. svi_parent_profile.nodes[inventory_hostname].structured_config<br>4. svi.structured_config<br>5. svi_profile.structured_config<br>6. svi_parent_profile.structured_config<br> |
    | [<samp>&nbsp;&nbsp;- profile</samp>](## "svi_profiles.[].profile") | String | Required, Unique |  |  | Profile name |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;nodes</samp>](## "svi_profiles.[].nodes") | List, items: Dictionary |  |  |  | Define node specific configuration, such as unique IP addresses.<br>Any keys set here will be merged onto the SVI config, except `structured_config` keys which will replace the `structured_config` set on SVI level.<br> |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- node</samp>](## "svi_profiles.[].nodes.[].node") | String | Required, Unique |  |  | l3_leaf inventory hostname |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ospf</samp>](## "svi_profiles.[].nodes.[].ospf") | Dictionary |  |  |  | OSPF interface configuration. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enabled</samp>](## "svi_profiles.[].nodes.[].ospf.enabled") | Boolean |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;point_to_point</samp>](## "svi_profiles.[].nodes.[].ospf.point_to_point") | Boolean |  | `True` |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;area</samp>](## "svi_profiles.[].nodes.[].ospf.area") | String |  | `0` |  | OSPF area ID. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cost</samp>](## "svi_profiles.[].nodes.[].ospf.cost") | Integer |  |  |  | OSPF link cost. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;authentication</samp>](## "svi_profiles.[].nodes.[].ospf.authentication") | String |  |  | Valid Values:<br>- simple<br>- message-digest |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;simple_auth_key</samp>](## "svi_profiles.[].nodes.[].ospf.simple_auth_key") | String |  |  |  | Password used with simple authentication. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;message_digest_keys</samp>](## "svi_profiles.[].nodes.[].ospf.message_digest_keys") | List, items: Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- id</samp>](## "svi_profiles.[].nodes.[].ospf.message_digest_keys.[].id") | Integer |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hash_algorithm</samp>](## "svi_profiles.[].nodes.[].ospf.message_digest_keys.[].hash_algorithm") | String |  | `sha512` | Valid Values:<br>- md5<br>- sha1<br>- sha256<br>- sha384<br>- sha512 |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;key</samp>](## "svi_profiles.[].nodes.[].ospf.message_digest_keys.[].key") | String |  |  |  | Type 7 encrypted key. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;ospf</samp>](## "svi_profiles.[].ospf") | Dictionary |  |  |  | OSPF interface configuration. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enabled</samp>](## "svi_profiles.[].ospf.enabled") | Boolean |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;point_to_point</samp>](## "svi_profiles.[].ospf.point_to_point") | Boolean |  | `True` |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;area</samp>](## "svi_profiles.[].ospf.area") | String |  | `0` |  | OSPF area ID. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cost</samp>](## "svi_profiles.[].ospf.cost") | Integer |  |  |  | OSPF link cost. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;authentication</samp>](## "svi_profiles.[].ospf.authentication") | String |  |  | Valid Values:<br>- simple<br>- message-digest |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;simple_auth_key</samp>](## "svi_profiles.[].ospf.simple_auth_key") | String |  |  |  | Password used with simple authentication. |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;message_digest_keys</samp>](## "svi_profiles.[].ospf.message_digest_keys") | List, items: Dictionary |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- id</samp>](## "svi_profiles.[].ospf.message_digest_keys.[].id") | Integer |  |  |  |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hash_algorithm</samp>](## "svi_profiles.[].ospf.message_digest_keys.[].hash_algorithm") | String |  | `sha512` | Valid Values:<br>- md5<br>- sha1<br>- sha256<br>- sha384<br>- sha512 |  |
    | [<samp>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;key</samp>](## "svi_profiles.[].ospf.message_digest_keys.[].key") | String |  |  |  | Type 7 encrypted key. |

=== "YAML"

    ```yaml
    <network_services_keys.name>:
      - name: <str>
        vrfs:
          - name: <str>
            ospf:
              enabled: <bool>
              process_id: <int>
              router_id: <str>
              max_lsa: <int>
              bfd: <bool>
              redistribute_bgp:
                enabled: <bool>
                route_map: <str>
              redistribute_connected:
                enabled: <bool>
                route_map: <str>
              nodes:
                - <str>
            redistribute_ospf: <bool>
            svis:
              - id: <int>
                nodes:
                  - node: <str>
                    ospf:
                      enabled: <bool>
                      point_to_point: <bool>
                      area: <str>
                      cost: <int>
                      authentication: <str>
                      simple_auth_key: <str>
                      message_digest_keys:
                        - id: <int>
                          hash_algorithm: <str>
                          key: <str>
                ospf:
                  enabled: <bool>
                  point_to_point: <bool>
                  area: <str>
                  cost: <int>
                  authentication: <str>
                  simple_auth_key: <str>
                  message_digest_keys:
                    - id: <int>
                      hash_algorithm: <str>
                      key: <str>
    svi_profiles:
      - profile: <str>
        nodes:
          - node: <str>
            ospf:
              enabled: <bool>
              point_to_point: <bool>
              area: <str>
              cost: <int>
              authentication: <str>
              simple_auth_key: <str>
              message_digest_keys:
                - id: <int>
                  hash_algorithm: <str>
                  key: <str>
        ospf:
          enabled: <bool>
          point_to_point: <bool>
          area: <str>
          cost: <int>
          authentication: <str>
          simple_auth_key: <str>
          message_digest_keys:
            - id: <int>
              hash_algorithm: <str>
              key: <str>
    ```
