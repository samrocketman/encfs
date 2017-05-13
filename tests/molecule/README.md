# About Molecule + Ansible

These set of scripts are meant to build and install EncFS on different Linux
flavors.

# Prerequisites

* `docker` command.
* Python 2.7
* virtualenv

# Build all variants

To build EncFS across all Linux distributions simply run the following.

    ./test.sh

This will build, install, and verify EncFS.

# More about this

- `build.sh` - is used to build EncFS inside of a Molecule contained
  environment.
- `molecule.yml` - contains settings for Molecule on how to provision
  environments.  In this case, the environments are provisioned with Docker.
  Molecule will execute Ansible with `playbook.yml`.
- `pip-requirements.txt` - pins the exact version of Python dependencies used
  during development and testing.  This ensures repeatability.  This file was
  generated with the following command within a `virtualenv` environment:

  ```
  pip freeze > pip-requirements.txt
  ```

- `playbook.yml` - Ansible playbook which is used to install dependencies and
  execute `build.sh` inside of a Molecule contained environment.
- `tests` - a directory containing Testinfra unit tests.  It's only purpose is
  to test if the `encfs` binary was successfully installed inside of each of the
  Molecule contained environment.
- `test.sh` - a single script which is designed to completely set up Molecule,
  Ansible, and execute Molecule for each distribution of Linux defined in
  `molecule.yml`.

Learn more about:

- Ansible - https://www.ansible.com/ - configuration management tool.
- Docker - https://www.docker.com/ - platform for provisioning and shipping
  container infrastructure.
- Molecule - https://molecule.readthedocs.io/ - testing convention tool for
  ansible roles.
- Testinfra - https://testinfra.readthedocs.io/ - a test framework written in
  Python to run tests on provisioned infrastructure.
- Virtualenv - https://virtualenv.pypa.io/ - user-managed python environment
  which simplifies development.

See also:

- [What is a container](https://www.docker.com/what-container)?
