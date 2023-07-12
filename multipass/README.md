# multipass

## Tasks

### generate-cloud-config

create cloud_init.yml

```shell
./generate_cloud_config.sh
```

### generate-ssh_config

generate ssh_config

```shell
./generate_ssh_config.sh
```

### create-vm

ubuntu 22.04 で VM を作成する

inputs: vm_name

```shell
echo ${vm_name}
multipass launch 22.04 --name "${vm_name}" --cloud-init cloud_init.yml
```

### destroy-vm

指定した VM を削除する

inputs: vm_name

```shell
multipass delete "${vm_name}"
multipass purge
```

### login

login multipass vm

inputs: vm_name

```shell
multipass shell "${vm_name}"
```

### ssh

ssh multipass vm

inputs: vm_name

```shell
ssh -F ssh_config "${vm_name}"
```
