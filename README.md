## このリポジトリについて
[spleeter](https://github.com/deezer/spleeter)を使いたいけどGitわからんとか、コマンドわからんとか、22kHzで音源分離するやり方わからんとか、そんな人向けに簡単に環境を構築し、実行できるようにバッチファイルを追加したリポジトリです。  
バッチは[Miniconda3](https://docs.conda.io/en/latest/miniconda.html)を使用する想定で作成しました。

## セットアップ
1. [Miniconda3のダウンロードページ](https://docs.conda.io/en/latest/miniconda.html)からMiniconda3 Windows 64-bitをダウンロードしてインストールしてください。  
インストール先のフォルダは変更せずインストールしてください。
  
2. [このリポジトリのspleeter](https://github.com/OkamotoYuta/spleeter/archive/master.zip)をダウンロードして適当なところに解凍してください。
  
3. 解凍した中身の **spleeter-master/batches/setup**フォルダの中の **1_install ffmpeg.bat** を実行  
（コマンドプロンプトのウィンドウが自動で閉じるまで待ってください）
  
4. 同様に **2_build and install.bat** を実行  
（コマンドプロンプトのウィンドウが自動で閉じるまで待ってください）
  
<br>
お疲れ様です。以上でセットアップは完了です。

## 音源分離をしてみる
1. **spleeter-master/batches**フォルダの中の下記バッチファイルに分離したい音源をD&Dしてください。  
（複数同時にD&D可能）  
   - **spleeterを11kHzで実行.bat**   → 11kHz以上の音がカットされる  
   - **spleeterを16kHzで実行.bat**   → 16kHz以上の音がカットされる  
   - **spleeterを22kHzで実行.bat**   → 音がカットされない  
  
2. **stems? [2, 4, 5]** と表示されたら 2 か 4 か 5 を入力してエンターを押してください。
   - 2   → 2stems (ボーカル、その他）  
   - 4   → 4stems (ボーカル、ドラム、ベース、その他）  
   - 5   → 5stems (ボーカル、ピアノ、ドラム、ベース、その他）  
   
3. 初回は事前学習済みモデルのダウンロードが始まるので気長に待ってください。
  
4. 分離したデータは ミュージックフォルダの中に出力されます。  
  
## その他 補足
- wikiによると11kHzで事前学習済みモデルを作成しているため、16kHz, 22kHzでは変になるかもしれないらしい。  
なので問題があれば低いやつで試してみるといいかも。 
  
- 出力先を変えたい場合はバッチファイルを編集で開いて **OUT_PUT_PATH** を変更してください。  
  
- バッチファイルの場所を変更する場合はバッチファイルを編集で開いて **SPLEETER_PATH** を変更してspleeterの絶対パスを入れてください。  
（そうしないと事前学習済みモデルが変なところに再ダウンロードされちゃうと思います）
<br>
<br>
<br>
<br>
-------------------------以下 オリジナルのReadme-------------------------  
<br>
<br>
<img src="https://github.com/deezer/spleeter/raw/master/images/spleeter_logo.png" height="80" />

[![CircleCI](https://circleci.com/gh/deezer/spleeter/tree/master.svg?style=shield)](https://circleci.com/gh/deezer/spleeter/tree/master) ![PyPI - Python Version](https://img.shields.io/pypi/pyversions/spleeter) [![PyPI version](https://badge.fury.io/py/spleeter.svg)](https://badge.fury.io/py/spleeter) [![Conda](https://img.shields.io/conda/vn/conda-forge/spleeter)](https://anaconda.org/conda-forge/spleeter) [![Docker Pulls](https://img.shields.io/docker/pulls/researchdeezer/spleeter)](https://hub.docker.com/r/researchdeezer/spleeter) [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/deezer/spleeter/blob/master/spleeter.ipynb) [![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/spleeter/community)



## About

**Spleeter** is the [Deezer](https://www.deezer.com/) source separation library with pretrained models
written in [Python](https://www.python.org/) and uses [Tensorflow](https://tensorflow.org/). It makes it easy
to train source separation model (assuming you have a dataset of isolated sources), and provides
already trained state of the art model for performing various flavour of separation :

* Vocals (singing voice) / accompaniment separation ([2 stems](https://github.com/deezer/spleeter/wiki/2.-Getting-started#using-2stems-model))
* Vocals / drums / bass / other separation ([4 stems](https://github.com/deezer/spleeter/wiki/2.-Getting-started#using-4stems-model))
* Vocals / drums / bass / piano / other separation ([5 stems](https://github.com/deezer/spleeter/wiki/2.-Getting-started#using-5stems-model))

2 stems and 4 stems models have state of the art performances on the [musdb](https://sigsep.github.io/datasets/musdb.html) dataset. **Spleeter** is also very fast as it can perform separation of audio files to 4 stems 100x faster than real-time when run on a GPU. 

We designed **Spleeter** so you can use it straight from [command line](https://github.com/deezer/spleeter/wiki/2.-Getting-started#usage)
as well as directly in your own development pipeline as a [Python library](https://github.com/deezer/spleeter/wiki/4.-API-Reference#separator). It can be installed with [Conda](https://github.com/deezer/spleeter/wiki/1.-Installation#using-conda),
with [pip](https://github.com/deezer/spleeter/wiki/1.-Installation#using-pip) or be used with
[Docker](https://github.com/deezer/spleeter/wiki/2.-Getting-started#using-docker-image).

## Quick start 

Want to try it out ? Just clone the repository and install a
[Conda](https://github.com/deezer/spleeter/wiki/1.-Installation#using-conda)
environment to start separating audio file as follows:

```bash
git clone https://github.com/Deezer/spleeter
conda install -c conda-forge spleeter
spleeter separate -i spleeter/audio_example.mp3 -p spleeter:2stems -o output
```
You should get two separated audio files (`vocals.wav` and `accompaniment.wav`)
in the `output/audio_example` folder.

### Windows users 

   It appears that sometimes the shortcut command `spleeter` does not work properly on windows. This is a known issue that we will hopefully fix soon. In the meantime replace `spleeter separate` by `python -m spleeter separate` in the above line and it should work.

For a more detailed documentation, please check the [repository wiki](https://github.com/deezer/spleeter/wiki)

Want to try it out but don't want to install anything ? we've setup a [Google Colab](https://colab.research.google.com/github/deezer/spleeter/blob/master/spleeter.ipynb)

## Reference


- Deezer Research - Source Separation Engine Story - deezer.io blog post:
    * [English version](https://deezer.io/releasing-spleeter-deezer-r-d-source-separation-engine-2b88985e797e)
    * [Japanese version](http://dzr.fm/splitterjp)
- [Music Source Separation tool with pre-trained models / ISMIR2019 extended abstract](http://archives.ismir.net/ismir2019/latebreaking/000036.pdf)

If you use **Spleeter** in your work, please cite:

```BibTeX
@misc{spleeter2019,
  title={Spleeter: A Fast And State-of-the Art Music Source Separation Tool With Pre-trained Models},
  author={Romain Hennequin and Anis Khlif and Felix Voituret and Manuel Moussallam},
  howpublished={Late-Breaking/Demo ISMIR 2019},
  month={November},
  note={Deezer Research},
  year={2019}
}
```

## License
The code of **Spleeter** is MIT-licensed.

## Disclaimer
If you plan to use Spleeter on copyrighted material, make sure you get proper authorization from right owners beforehand.

## Note
This repository include a demo audio file `audio_example.mp3` which is an excerpt
from Slow Motion Dream by Steven M Bryant (c) copyright 2011 Licensed under a Creative
Commons Attribution (3.0) license. http://dig.ccmixter.org/files/stevieb357/34740
Ft: CSoul,Alex Beroza & Robert Siekawitch
