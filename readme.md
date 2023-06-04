<!-- Document: readme.md

	SMT Curtain Call のマニュアル

	Metadata:

		id - a2113fca-63dd-475b-8c65-a7d02aaaa477
		author - <qq542vev at https://purl.org/meta/me/>
		version - 1.0.0
		date - 2023-05-23
		since - 2023-05-23
		copyright - Copyright (C) 2023-2023 qq542vev. Some rights reserved.
		license - <CC-BY at https://creativecommons.org/licenses/by/4.0/>
		package - smt-curtain-call

	See Also:

		* <Project homepage at https://github.com/qq542vev/smt-curtain-call>
		* <Bag report at https://github.com/qq542vev/smt-curtain-call/issues>
-->

# SMT Curtain Call

SMT Curtain Call は[美少女戦士セーラームーン -SHINING MOON TOKYO-]()の来場様が撮影したカーテンコールの動画を、一覧表示した動画を作成する試みです。アドリブの微妙な変化やキャストの方の成長を楽しむ動画でもあります。

現状では以下の25個の動画内のカーテンコール部分を抜き出し、分割して一覧表示します。

 1. [15.08.2019 ⭐ SHINING MOON TOKYO ⭐ Inauguration of the first Sailor Moon restaurant in the world ❤ | By Maria Laura](https://www.facebook.com/marialaura.muciaccia/videos/10220661221266990/)
 2. [世界初！セーラームーンショーレストランSHINING MOON TOKYOの様子](https://www.youtube.com/watch?v=xut2OiXSM1Y)
 3. [美少女戦士セーラームーン SHINING MOON TOKYO ショー (S席から)](https://www.youtube.com/watch?v=Sqsq8K2MP6w)
 4. [「美少女戦士セーラームーン -SHINING MOON TOKYO-」 主題餐廳絕對值得到訪！❤️ 本段影 片為現場開放錄影時段，前面還有一場精彩主秀(不開放錄影)，無論舞蹈動作聲光特效都完 美融合，讓身為粉絲的我超級無敵感動🤩... | By 士豪](https://www.facebook.com/630981723/videos/10156601920971724/)
 5. [Sailor Moon Shining Moon Tokyo! | By Christine](https://www.facebook.com/christine.king.16/videos/2506677842688685/)
 6. [Shining Moon Tokyo - シャイニングムーン東京](https://www.youtube.com/watch?v=tlR-nfVXpk0)
 7. [Shining Moon Tokyo. We can only take pictures or videos on this part of the show Recorded on September 22, 2019 | By Melanie](https://www.facebook.com/animelly/videos/2606064456082876/)
 8. [Shining Moon Tokyo](https://www.facebook.com/TrashHere1/videos/485627745358132/)
 9. [2019 Shining Moon Tokyo - Sailor Moon Dinner Show in Japan](https://www.youtube.com/watch?v=1ngDoWUh83M)
 10. [SailorMoon Shining Moon fancam BEST VIEW](https://www.youtube.com/watch?v=GpqF5Ja7-Zs)
 11. [Shining Moon Tokyo 2019](https://www.youtube.com/watch?v=NH-WA0oYYE8)
 12. [Sailor Moon Show Restaurant SHINING MOON Tokyo | JAPAN | JVlog](https://www.youtube.com/watch?v=x93sT47C-lk)
 13. [Panchi In Tokyo: Day 04](https://www.youtube.com/watch?v=jh8zryzsZzs)
 14. [Sailor Moon Restaurant Tokyo, Japan](https://www.youtube.com/watch?v=-cfDnIaTQEY)
 15. [Sailor Moon. Shinning Moon Tokyo Finale](https://www.youtube.com/watch?v=-OQMhuKCTCI)
 16. [2020.02.06 美少女戦士セーラームーン -SHINING MOON TOKYO- 還蠻喜歡看日本的舞台劇之類的表演 | By Miha](https://www.facebook.com/miha.wang/videos/2883711924983195/)
 17. [Sailor Moon Show Tokyo💖🌙Shining Moon✨](https://www.youtube.com/watch?v=O8dRFeU6N-s)
 18. [セーラームーン・ショーレストラン「SHINING MOON TOKYO」潜入レポ☆ぽっちゃり系巨乳グラドル・桃奈りさこ・sailormoon・Show restaurant・Japanesegirl](https://www.youtube.com/watch?v=Dx9nOrP9T34)
 19. [美少女戦士セーラームーンPretty Guardian Sailor Moon Part.1](https://www.youtube.com/watch?v=j-SI6uDZSxk)
 20. [SHINING MOON TOKYO ショータイム (SHOW TIME)](https://www.youtube.com/watch?v=1R2DV4xDpGc)
 21. [SAILOR MOON SHINING MOON TOKYO](https://www.youtube.com/watch?v=hak8PJYMIAE)
 22. [Sailor moon café Tokyo noviembre 2019](https://www.youtube.com/watch?v=xkfu_L250sw)
 23. [Shining Moon Tokyo](https://www.facebook.com/NEProject/videos/323030685384918/)
 24. [Pretty Guardian Sailor Moon  SHINING MOON TOKYO dance](https://www.youtube.com/watch?v=KQYQPlzMW4U)
 25. [JAPAN TRAVEL VLOG 🇯🇵 | Tokyo Tower & Sailor Moon LIVE!](https://www.youtube.com/watch?v=CYJl_v4yBus)

# 動画を作成する

動画を作成するにはご使用のコンピューターに [yt-dlp](https://github.com/yt-dlp/yt-dlp) と [FFmpeg](https://ffmpeg.org/) がインストールされている必要があります。可能な限り最新版を使用してください。2023年05月23日現在、yt-dlp は [2023.03.04](https://github.com/yt-dlp/yt-dlp/releases/tag/2023.03.04)、FFmpeg は [5.1.1-static](https://ffmpeg.org/download.html) での組み合わせで動作することを確認しています。

[`make.sh`](make.sh) をダウンロードして、実行してください。動画共有サイトから動画と音声をダウンロードします。ダウンロードされた動画と音声はカレントディレクトリの `./vidoes`, `./audios` 内に保存されます。その後、動画の作成を開始します。動画の作成(主にエンコード)には非常に時間がかかります。

作成された動画はカレントディレクトリ内に `curtain-call.mkv` として保存されます。作成された動画の構成は、Matroska Video + H.264 + FLAC(25トラック)です。詳細は MediaInfo の[出力結果](smt-curtain-call.mkv.mediainfo.txt)を参照してください。
