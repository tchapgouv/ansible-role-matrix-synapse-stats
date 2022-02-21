# Ansible Role: Matrix Synapse Stats

An Ansible Role that creates a statistics PostgreSQL database from various Matrix Synapse using *foreign-data-wrappers*.

Raw data are to be stored in an internal, secured schema containing materialized views for performance purpose. Views built from these data (those that are to be exported) will be accessible through an external schema.

## Requirements

- Destination, debian-based machine (hosted or virtual)
- Matrix infrastructure, containing one or many homeservers
- S3 bucket for data export (*optional*)

## Role Variables

    # A liste of Matrix homeservers, defining names, ips and synapse db passwords
    - homeservers:
      - name: ''
      - ip: ''
      - synapse_pass: ''
    
    # A HTTP proxy address, with exception domains (optional)
    - general_http_proxy: ''
    - general_http_noproxy: ''

    # S3 credentials (optional)
    - stats_s3_access: ''
    - stats_s3_secret: ''

    # database information
    - db_name: ''
    - internal_stats_schema: ''

    # external secured schema for export data
    - external_stats_schema: ''

## Dependencies

None.

## Example Playbook

Install from the system package manager:

    - hosts: homeservers
      roles:
        - role: matrix-synapse-statse

## License

MIT / BSD

## Author Information

This role was created in 2022 by the **Tchap** team.