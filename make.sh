#!/usr/bin/env bash

### Script: make.sh
##
## SMT Curtain Call の動画を作成する。
##
## Metadata:
##
##   id - 46501295-96ea-4ee2-83e7-a09af100e113
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 1.0.0
##   date - 2023-06-03
##   since - 2023-05-20
##   copyright - Copyright (C) 2023-2023 qq542vev. Some rights reserved.
##   license - <CC-BY at https://creativecommons.org/licenses/by/4.0/>
##   package - smt-curtain-call
##
## See Also:
##
##   * <Project homepage at https://github.com/qq542vev/smt-curtain-call>
##   * <Bag report at https://github.com/qq542vev/smt-curtain-call/issues>

set -efu
umask '0022'
readonly "LC_ALL_ORG=${LC_ALL-}"
LC_ALL='C'
IFS=$(printf ' \t\n_'); IFS="${IFS%_}"
PATH="${PATH-}${PATH:+:}$(command -p getconf 'PATH')"
UNIX_STD='2003' # HP-UX POSIX mode
XPG_SUS_ENV='ON' # AIX POSIX mode
XPG_UNIX98='OFF' # AIX UNIX 03 mode
POSIXLY_CORRECT='1' # GNU Coreutils POSIX mode
COMMAND_MODE='unix2003' # macOS UNIX 03 mode
export 'LC_ALL' 'IFS' 'PATH' 'UNIX_STD' 'XPG_SUS_ENV' 'XPG_UNIX98' 'POSIXLY_CORRECT' 'COMMAND_MODE'

readonly "urls=$(
	cat <<-'__EOF__'
	https://www.facebook.com/marialaura.muciaccia/videos/10220661221266990/	facebook:10220661221266990	setpts=PTS-STARTPTS+19.76666666/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+19.76666666/TB	15.08.2019 ⭐ SHINING MOON TOKYO ⭐ Inauguration of the first Sailor Moon restaurant in the world ❤ | By Maria Laura
	https://www.youtube.com/watch?v=xut2OiXSM1Y	youtube:xut2OiXSM1Y	trim=start=01\\:05.53333333:end=05\\:18.7,setpts=PTS-STARTPTS+13.46666666/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=01\\:05.53333333:end=05\\:18.7,asetpts=PTS-STARTPTS+13.46666666/TB	世界初！セーラームーンショーレストランSHINING MOON TOKYOの様子
	https://www.youtube.com/watch?v=Sqsq8K2MP6w	youtube:Sqsq8K2MP6w	setpts=PTS-STARTPTS+17.3/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+17.3/TB	美少女戦士セーラームーン SHINING MOON TOKYO ショー (S席から)
	https://www.facebook.com/630981723/videos/10156601920971724/	facebook:10156601920971724	setpts=PTS-STARTPTS+9.63333333/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+9.63333333/TB	「美少女戦士セーラームーン -SHINING MOON TOKYO-」 主題餐廳絕對值得到訪！❤️ 本段影 片為現場開放錄影時段，前面還有一場精彩主秀(不開放錄影)，無論舞蹈動作聲光特效都完 美融合，讓身為粉絲的我超級無敵感動🤩... | By 士豪
	https://www.facebook.com/christine.king.16/videos/2506677842688685/	facebook:2506677842688685	setpts=PTS-STARTPTS+25.83333333/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+25.83333333/TB	Sailor Moon Shining Moon Tokyo! | By Christine
	https://www.youtube.com/watch?v=tlR-nfVXpk0	youtube:tlR-nfVXpk0	trim=start=05\\:24.63333333:end=09\\:15.33333333,setpts=PTS-STARTPTS+0.86666663/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=05\\:24.63333333:end=09\\:15.33333333,asetpts=PTS-STARTPTS+0.86666663/TB	Shining Moon Tokyo - シャイニングムーン東京
	https://www.facebook.com/animelly/videos/2606064456082876/	facebook:2606064456082876	setpts=PTS-STARTPTS+16.5/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+16.5/TB	Shining Moon Tokyo. We can only take pictures or videos on this part of the show Recorded on September 22, 2019 | By Melanie
	https://www.facebook.com/TrashHere1/videos/485627745358132/	facebook:485627745358132	setpts=PTS-STARTPTS+15.76666666/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+15.76666666/TB	Shining Moon Tokyo
	https://www.youtube.com/watch?v=1ngDoWUh83M	youtube:1ngDoWUh83M	setpts=PTS-STARTPTS+7.23333333/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+7.23333333/TB	2019 Shining Moon Tokyo - Sailor Moon Dinner Show in Japan
	https://www.youtube.com/watch?v=GpqF5Ja7-Zs	youtube:GpqF5Ja7-Zs	setpts=PTS-STARTPTS+0.4/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+0.4/TB	SailorMoon Shining Moon fancam BEST VIEW
	https://www.youtube.com/watch?v=NH-WA0oYYE8	youtube:NH-WA0oYYE8	trim=start=02.46666666:end=04\\:15.86666666,setpts=PTS-STARTPTS+2.96666666/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=02.46666666:end=04\\:15.86666666,asetpts=PTS-STARTPTS+2.96666666/TB	Shining Moon Tokyo 2019
	https://www.youtube.com/watch?v=x93sT47C-lk	youtube:x93sT47C-lk	trim=start=05\\:53.76666666:end=09\\:37.63333333,setpts=PTS-STARTPTS+10.33333333/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=05\\:53.76666666:end=09\\:37.63333333,asetpts=PTS-STARTPTS+10.33333333/TB	Sailor Moon Show Restaurant SHINING MOON Tokyo | JAPAN | JVlog
	https://www.youtube.com/watch?v=jh8zryzsZzs	youtube:jh8zryzsZzs	trim=start=05\\:03.86666666:end=08\\:59.3,setpts=PTS-STARTPTS+24.8/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=05\\:03.86666666:end=08\\:59.3,asetpts=PTS-STARTPTS+24.8/TB	Panchi In Tokyo: Day 04
	https://www.youtube.com/watch?v=-cfDnIaTQEY	youtube:-cfDnIaTQEY	setpts=PTS-STARTPTS+2.93333333/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+2.93333333/TB	Sailor Moon Restaurant Tokyo, Japan
	https://www.youtube.com/watch?v=-OQMhuKCTCI	youtube:-OQMhuKCTCI	setpts=PTS-STARTPTS+42.2/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+42.2/TB	Sailor Moon. Shinning Moon Tokyo Finale
	https://www.facebook.com/miha.wang/videos/2883711924983195/	facebook:2883711924983195	setpts=PTS-STARTPTS+7.13333333/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+7.13333333/TB	2020.02.06 美少女戦士セーラームーン -SHINING MOON TOKYO- 還蠻喜歡看日本的舞台劇之類的表演 | By Miha
	https://www.youtube.com/watch?v=O8dRFeU6N-s	youtube:O8dRFeU6N-s	trim=start=06\\:22.16666666:end=10\\:47.26666666,setpts=PTS-STARTPTS+0.03333333/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=06\\:22.53333333:end=10\\:47.26666666,asetpts=PTS-STARTPTS+0.03333333/TB	Sailor Moon Show Tokyo💖🌙Shining Moon✨
	https://www.youtube.com/watch?v=Dx9nOrP9T34	youtube:Dx9nOrP9T34	trim=start=09\\:29.3:end=13\\:44.5,setpts=PTS-STARTPTS+5.56666666/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=09\\:29.3:end=13\\:44.5,asetpts=PTS-STARTPTS+5.56666666/TB	セーラームーン・ショーレストラン「SHINING MOON TOKYO」潜入レポ☆ぽっちゃり系巨乳グラドル・桃奈りさこ・sailormoon・Show restaurant・Japanesegirl
	https://www.youtube.com/watch?v=j-SI6uDZSxk	youtube:j-SI6uDZSxk	setpts=PTS-STARTPTS+13.46666666/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+13.46666666/TB	美少女戦士セーラームーンPretty Guardian Sailor Moon Part.1
	https://www.youtube.com/watch?v=1R2DV4xDpGc	youtube:1R2DV4xDpGc	trim=start=00.46666666,setpts=PTS-STARTPTS,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=00.46666666,asetpts=PTS-STARTPTS	SHINING MOON TOKYO ショータイム (SHOW TIME)
	https://www.youtube.com/watch?v=hak8PJYMIAE	youtube:hak8PJYMIAE	setpts=PTS-STARTPTS+2.5/TB,transpose=dir=cclock,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+2.5/TB	SAILOR MOON SHINING MOON TOKYO
	https://www.youtube.com/watch?v=xkfu_L250sw	youtube:xkfu_L250sw	setpts=PTS-STARTPTS+8.36666666/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+8.36666666/TB	Sailor moon café Tokyo noviembre 2019
	https://www.facebook.com/NEProject/videos/323030685384918/	facebook:323030685384918	setpts=PTS-STARTPTS+12.03333333/TB,scale=width=400:height=-1,minterpolate=fps=60	asetpts=PTS-STARTPTS+12.03333333/TB	Shining Moon Tokyo
	https://www.youtube.com/watch?v=KQYQPlzMW4U	youtube:KQYQPlzMW4U	trim=end=03\\:49.56666666,setpts=PTS-STARTPTS+4.76666666/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=end=03\\:49.56666666,asetpts=PTS-STARTPTS+4.76666666/TB	Pretty Guardian Sailor Moon  SHINING MOON TOKYO dance
	https://www.youtube.com/watch?v=CYJl_v4yBus	youtube:CYJl_v4yBus	trim=start=09\\:03.16666666:end=13\\:18.1,setpts=PTS-STARTPTS+2.53333333/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=09\\:03.16666666:end=13\\:18.1,asetpts=PTS-STARTPTS+2.53333333/TB	JAPAN TRAVEL VLOG 🇯🇵 | Tokyo Tower & Sailor Moon LIVE!
	__EOF__
	#https://www.youtube.com/watch?v=wD9aspeiBU4	youtube:wD9aspeiBU4	trim=start=16\\:43.43333333:end=21\\:01.96666666,setpts=PTS-STARTPTS+4.66666666/TB,scale=width=400:height=-1,minterpolate=fps=60	atrim=start=16\\:43.43333333:end=21\\:01.96666666,asetpts=PTS-STARTPTS+4.66666666/TB
)"
readonly options=(
	'--abort-on-error' '--continue'
	'--ignore-config' '--no-cache-dir'
	'--retries' '100'
)
readonly 'format=%(extractor)s:%(id)s.%(format_id)s.%(ext)s'
readonly 'width=400'
readonly 'height=224'
readonly "xy=$(awk -v "n=$(printf '%s' "${urls}" | grep -c '^')" -- 'BEGIN { s = sqrt(n); r = int(s); printf("%d", (r == s ? r : r + 1)); }')"

mkdir -p -- 'videos' 'audios'

input=()
map=('-map' "[overlay$(printf '%s' "${urls}" | grep -c '^')]")
metadata=('-metadata' 'title=SHINING MOON TOKYO - Curtain call')
filter="color=size=$((width * xy))x$((height * xy)):color=black:rate=60[overlay0]"

while IFS='	' read -r i url filename vfilter afilter title; do
	if [ '!' -f "videos/${filename}" ]; then
		yt-dlp "${options[@]}" --format 'bestvideo[width>=400][height>=224]/best[width>=400][height>=224]/best*[vcodec!=?none]' --output "videos/${format}" -- "${url}"

		rm -fr -- "videos/${filename}"
		ln -s -- "$(yt-dlp "${options[@]}" --format 'bestvideo[width>=400][height>=224]/best[width>=400][height>=224]/best*[vcodec!=?none]' --print "${format}" -- "${url}")" "videos/${filename}"
	fi

	if [ '!' -f "audios/${filename}" ]; then
		audioname=$(yt-dlp "${options[@]}" --format 'bestaudio/best*[acodec!=?none]' --print "${format}" -- "${url}")

		if [ -f "videos/${audioname}" ]; then
			ln -s -- "../videos/${audioname}" "audios/${audioname}"
		else
			yt-dlp "${options[@]}" --format 'bestaudio/best*[acodec!=?none]' --output "audios/${format}" -- "${url}"
		fi

		rm -fr -- "audios/${filename}"
		ln -s -- "${audioname}" "audios/${filename}"
	fi

	input+=('-i' "videos/${filename}" '-i' "audios/${filename}")
	map+=('-map' "[audio${i}]")
	metadata+=(
		"-metadata:s:a:${i}" 'language=jpn'
		"-metadata:s:a:${i}" "title=${i}: ${title}"
		"-metadata:s:a:${i}" "description=Source: ${url}"
	)
	filter="${filter};[$((i * 2)):v]${vfilter}[video${i}];[overlay${i}][video${i}]overlay=x=$((i % xy * width)):y=$((i / xy * height))[overlay$((i + 1))];[$(((i * 2) + 1)):a]${afilter}[audio${i}]"
done <<<"$(printf '%s\n' "${urls}" | nl -v '0' | sed -e 's/^ *//')"

ffmpeg \
	"${input[@]}" -filter_complex "${filter}" "${map[@]}" "${metadata[@]}" \
	-c:v libx264 -fps_mode cfr -crf 0 -qp 0 -preset placebo -tune film \
	-c:a flac -ar 48000 -ac 2 -compression_level 12 \
	-to '04:29.66666666' -- 'smt-curtain-call.mkv'
