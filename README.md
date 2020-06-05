## LambdaLayer作成
ZenpyのLambdalayerを作成します  
作成されるLayerの名前は `Zenpy-python37-layer` です  

### 事前準備
* Dockerが必要です
* AWS SAMが必要です
    * `pip install aws-sam-cli`
* S3バケットを事前に作成する  
    - `s3-bucket ${APP_NAME}-${ENV}`

### Layer.zipの作成とデプロイ

```sh
pip install --upgrade pip
(cd ./; ./build.sh)
(cd ./; ENV=stg ./cli deploy)
```

### 動確するLambdaサンプルコード

```python
import json
from zenpy import Zenpy

creds = {
"token": "zendesknotoken",
"email": "hoge@moge.jp",
"subdomain": "zendesktest"
}

def lambda_handler(event, context):
    try:
        zenpy_client = Zenpy(**creds)
        ticket = zenpy_client.tickets(id=947)
        print(ticket)
    except Exception as e:
        print(e)

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
```
