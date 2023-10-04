## 構成

- main.tf
  terraform の設定を行います。
  以下の設定が含まれます。

  - app_name: 作成するリソースの命名
  - allowed_ips: 許可したい IP アドレス

- network.tf
  ネットワークの設定を行います。
  以下の設定が含まれます。

  - VPC
  - Subnet
  - Internet Gate Way
  - Rote Table

- env.tfvars
  terraform 用の AWS IAM 認証情報を設定します。
  このファイルは git の管理対象ではありません。
  以下の設定が含まれます。
  - Accesskey
  - Secretkey

## 実行方法

### env.tfvars の作成

```
access_key = "your_access_key"
secret_key = "your_secret_key"
```

### 検証

`$ terraform plan --var-file=env.tfvars`

### 実行

`$ terraform apply --var-file=env.tfvars`

### フォーマットする

`$ terraform fmt`
