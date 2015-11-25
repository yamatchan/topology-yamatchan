#topologyレポート課題
> topologyを改造し，スイッチに加えてホストの接続関係を表示するコントローラを作る  
> パケットを出したホストのIPアドレスを楕円で表示

## コードの解説
簡単なので無し

## 動作確認
以下に示すconfファイルを用いて動作確認を行った．

```
vswitch { dpid '0x1' }
vswitch { dpid '0x2' }
vswitch { dpid '0x3' }
vswitch { dpid '0x4' }
vswitch { dpid '0x5' }
vswitch { dpid '0x6' }
vswitch { dpid '0x7' }
vswitch { dpid '0x8' }
vswitch { dpid '0x9' }
vswitch { dpid '0x10' }

vhost ('host1-1') { ip '192.168.1.1' }
vhost ('host1-2') { ip '192.168.1.2' }
vhost ('host2-1') { ip '192.168.2.1' }
vhost ('host2-2') { ip '192.168.2.2' }
vhost ('host3-1') { ip '192.168.3.1' }
vhost ('host4-1') { ip '192.168.4.1' }
vhost ('host7-1') { ip '192.168.7.1' }
vhost ('host7-2') { ip '192.168.7.2' }
vhost ('host7-3') { ip '192.168.7.3' }
vhost ('host8-1') { ip '192.168.8.1' }
vhost ('host9-1') { ip '192.168.9.1' }
vhost ('host10-1') { ip '192.168.10.1' }

link '0x1', '0x5'
link '0x2', '0x5'
link '0x3', '0x5'
link '0x4', '0x5'
link '0x5', '0x6'
link '0x7', '0x6'
link '0x8', '0x6'
link '0x9', '0x6'
link '0x10', '0x6'
link '0x1', 'host1-1'
link '0x1', 'host1-2'
link '0x2', 'host2-1'
link '0x2', 'host2-2'
link '0x3', 'host3-1'
link '0x4', 'host4-1'
link '0x7', 'host7-1'
link '0x7', 'host7-2'
link '0x7', 'host7-3'
link '0x8', 'host8-1'
link '0x9', 'host9-1'
link '0x10', 'host10-1'
```

### 起動時のトポロジ画像
コントローラ起動時のトポロジ画像を以下に示す．  
![起動時のトポロジ画像](https://raw.githubusercontent.com/handai-trema/topology-yamatchan/master/img/1.png)


### ホストのパケット送信後のトポロジ画像
host1-1からhost1-2へパケット送信後のトポロジ画像を以下に示す．  
また，以下に入力コマンドも示しておく．

```
$ bin/trema send_packet -s host1-1 -d host1-2
```

![host1-1 -> host1-2](https://raw.githubusercontent.com/handai-trema/topology-yamatchan/master/img/2.png)

続けて，host10-1からhost1-2へパケット送信後のトポロジ画像を以下に示す．  
同様に，以下に入力コマンドも示しておく．

```
$ bin/trema send_packet -s host10-1 -d host1-2
```

![host10-1 -> host1-2](https://raw.githubusercontent.com/handai-trema/topology-yamatchan/master/img/3.png)


### 全ホストのパケット送信後のトポロジ画像
上記に続けて，全てのホストが適当なホストにパケットを送信した後のトポロジ画像(トポロジの最終形)を以下に示す．  
同様に，以下に入力コマンドも示しておく．

```
$ bin/trema send_packet -s host1-2 -d host1-1
$ bin/trema send_packet -s host2-1 -d host1-1
$ bin/trema send_packet -s host2-2 -d host1-1
$ bin/trema send_packet -s host3-1 -d host1-1
$ bin/trema send_packet -s host4-1 -d host1-1
$ bin/trema send_packet -s host7-1 -d host1-1
$ bin/trema send_packet -s host7-2 -d host1-1
$ bin/trema send_packet -s host7-3 -d host1-1
$ bin/trema send_packet -s host8-1 -d host1-1
$ bin/trema send_packet -s host9-1 -d host1-1
```

![host10-1 -> host1-2](https://raw.githubusercontent.com/handai-trema/topology-yamatchan/master/img/4.png)


おわりなんだ(*^◯^*)

