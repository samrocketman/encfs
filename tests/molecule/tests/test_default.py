import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_encfs_installed(File):
    encfs = File('/usr/local/bin/encfs')

    assert encfs.exists
    assert encfs.mode == 0o755
