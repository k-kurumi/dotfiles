# multipass

## 設定ファイルの生成

multipass で読み込ませる cloud_init.yml を表示する

```shell
vm_name=test123

./print_cloud_config.sh "${vm_name}"
```

ssh_config を表示する

```shell
vm_name=test123

./print_ssh_config.sh  "${vm_name}"
```

## VM の作成

ubuntu 22.04 で VM を作成する

```shell
vm_name=test123

multipass launch 22.04 --name "${vm_name}" --cloud-init cloud_init.yml
```

## VM の削除

指定した VM を削除する (purge で完全削除)

```shell
vm_name=test123

multipass delete "${vm_name}"
multipass purge
```

## VM に接続

login multipass vm

```shell
vm_name=test123

multipass shell "${vm_name}"

## or
./print_ssh_config.sh > ssh_config
ssh -F ssh_config "${vm_name}"
```
