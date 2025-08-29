### リソース名
リソースモジュールがこのタイプのリソースを１つだけ作成する場合（例えば internet gateway）はリソース名を `this` とします。aws_route_table のような複数作成する場合は `public` や `private` などとリソースモジュールを修飾する名前としますが、iam のように多くのリソースを作成する場合はより具体的な名前を付けます。
### 変数
module 配下 role_name メインでは iam_role_name ({module名}_変数) という形にします。
