Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E834A76E
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142904; cv=none; b=s5cc7VO360+lDBGNKQHqS7u5uVIMk7XJ0tJxVW91Ze3tij9I8qn2K+1fht8cdSjGpngxndKt4jQZ7H6f7WPrzyAG69fdC406IYmiO4bR+uHpu2fG2qvMdNBNlcs19kV1jcmyFn8LCy7IjFBO7y9kyzCFSpZ8mIA6S7YuVtAk9NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142904; c=relaxed/simple;
	bh=LMqROSuajz+PWuBt0xHHNxUH2N+B0UWtP08N5eUq/EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6h8unr2XZtHxm+12HxfI21/fyRfs9mR/7vnkA6Eg5qUWvOI5bBagEt9Sg1DkcMKMYhSPUkM6EAkt5KUEZsVeD2V4rtOqWtzP8j1DQlDpuKRKJurKUDnDHL8dn/DZR5A0Mcmx2JUJLg5mTkdc1WbGMQngiEWZVZRpMyfhBH0GUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXU4aRlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXDyJtBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXU4aRlS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXDyJtBv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pVLP1424474
	for <phone-devel@vger.kernel.org>; Thu, 7 May 2026 08:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=; b=NXU4aRlS/JmpC5eR
	cUlBEq8qGqxgW6cfAxwVVUvXABKgoKQwHwXKDJ0M/MwZtL1tvqB9l2IygQYo4HWk
	WvXIcZT3o5AFiTheHs+9HXFceIjGDaSZ4l3YnLmFyEWM11hdpZpGLmf8QtJWmsqj
	hkIYutdAfDWRS82ZpuOVfyrkAonzScCr07zYbI9b+nlvPoQvbcOVGBMXuu+kZuzB
	AVUJ2Mcg0bMV3db/K9wuiYuJ15uD/GqRH7VxqbiW/SuzlieemXdDE7j1brNP3t28
	YVcXFtDNeb9VyzeS6aR+finbuN9HNi/G8Wi1JKcMron3uUy+E7SnmVuWR/BlB4yM
	QEidkw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfr5bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 08:35:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8ed08aa4so18332891cf.3
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778142900; x=1778747700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=;
        b=LXDyJtBvCCih3KkgO7485R8w3l8M6Vh7HBYBbXB2eOt4XI3rGWE50WkbnPjrEOjMwH
         gXzeVwWqhmW0AY1PHUlRL0Gvh1xPRcG5s1rL1cSf8n19SLVDxhHZR1TSeRk7v2ZDBcdT
         3DpVwih9i0Jk/E5uCwP5WvjhOzINyy/081N3b73/spPsDhBK4fp1z/6b9J+Jy4QfTRA+
         DM3d3nO47vpNBQitWB7sq8hwB4bLzUhhbumlcEl/sT0GHLxg7V4/uQS0Dk9kTx4qtzt+
         d+M40+MxECerO5KNztOr6Ai+yMpab1XU4zH2kMZXOBrLm1VIGVWhtf2k2K/E3FTSmyCM
         1/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142900; x=1778747700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=;
        b=D4oFbKuz0sYrbFw+zYjxZcY/vQ2mn8AX5Qxck7Lc65P2bhoT4uLAK1S9gz90mhkUVv
         x9Inc6ow4+egiC7s+X2iY7q0CdYkW9Uzp8NUmCc2k2+L30viONQ0ZM5/a1MdY35rOC9t
         wXBeMpJIDhIfVAlFdjGWD5Wa8JmiRQa2Pv7yET13z/fozlQ7YkjnusvA0vHNvwQczewe
         NVR3Nl9F2zBxzhfxz/siyd0q1VZ/TWTePXRLZSTQgKLaq26r3Vtyxn0bSXwtkjge2uAJ
         jm4xp4UqR86VLZFiDtPQO/cFd9zZ84gd/QmUxj7v0KkNbma406M4hnyOwovtGbw+491s
         QmMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9TGLwvwxKahq9qxsIluD4WhcAk5MDZVDhVjUOcUXodRv9uOd1YPzdmTSmuOlK7k31LfmiD4LCVFpcnmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFe26PCH7+rXi0W6fzOgySppHWiFbM5CUmflbWH5PF+IqXdotM
	jb7KULvlwdexKzWcywNx73XxuhBdbk+nmLRqvmEO40JRprYIfobvEZsGuGN61c+mGwqhADVyXao
	hkO68WEHRZ37N7AD6FMz/CtmieXP8S0ns0UVvTl7rK1wYhT4jKKMGtlTyzuoSkzCJdA==
X-Gm-Gg: AeBDievt+p4qqv5gsZuqjLGLkScp7JH2Y5/g+lTL/dGK4YkbHC8ji8mkQMX1of0CT4T
	awNTFwazYfuAIn5iMWa/ymgcyZbzzubzDBqOO41OLbUa4gTuHNA4FP+KF+vPTAziQrW7Uu0Vkpl
	GyOj+1jeYd4dSo3cGH4UblGyeziNL8rvVUtKgZ8es021FPY02qXGj6TDCnOwbpsXkmhBWGxpUHm
	4+KBMlLzCDypAD5pweOtHftMycIxdcBk7tvnr5QIGW1Es/vFN4nCf/jSXtxibkYdJsB35SpZmqK
	SIelxE/uxPe9UHjnantqLjsDBjbSixgwdvy2BRNxlVC29U78KNHRrRxpohtV4+v2VvDjvjjCi2v
	5o9nHMZr0V1CvFkWCbwt1H784HKnhm0xBJJzWVPlaz4vQIcTYPRRyjxIa7vY=
X-Received: by 2002:a05:622a:620a:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51461e671d4mr94196401cf.24.1778142899900;
        Thu, 07 May 2026 01:34:59 -0700 (PDT)
X-Received: by 2002:a05:622a:620a:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51461e671d4mr94195901cf.24.1778142899098;
        Thu, 07 May 2026 01:34:59 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm1872140a12.0.2026.05.07.01.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:34:58 -0700 (PDT)
Message-ID: <f586f504-ab76-4641-a80c-1ba7cc2d58a8@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:34:55 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] ASoC: qcom: sm8250: add Senary MI2S RX support
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-4-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc4eb4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-T4oWIldSm4hssfr7QUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4MiBTYWx0ZWRfX0NGvoogtSo6z
 MUFbFyiXKSavJUb3HY3lbKVVv2Zyxghl5tPi5/igIvTRClEYM2mLD+y4bB8/rd4adkDQq76ckj2
 dEL5kUHcT6tmFwcQ4k5JGGebw0YLfIsrRLq7l2tsFXpWSQ0HUyiPKEXV/2ZMLRXDOaW7K+brSvq
 szEH4mk6TG3wqK/MRn+yUGCLtACexdouM1tr0HBDiDVgOkC+R+4Lk0Xh9ct9qpT7k9kBPbch6Br
 8Ui9IIQ0TSgCsB8uFa7UMvDY6Hy04QWxP6Exq00BSpjC6xjUAdiUdhNeixAqNpHeJKzMsVIdTkv
 OlxXRlLjPmd33c1m7d4nG1sYjkC18hHN1cUm/0vrLajQpPtKXNlnzhr/45sRvvnCIkdbv2qOBI+
 NE4sibFNdTjuPz4bl6v9kiJ07sNnTfVv0l98wW1AeyPrkLKbKmyvHV/4nGjwo/2+PELtFt2rYDx
 lUROQVR+L75nGx13XhQ==
X-Proofpoint-GUID: JG4e9NHzksu-GJMrddjtMIC-257yuOJz
X-Proofpoint-ORIG-GUID: JG4e9NHzksu-GJMrddjtMIC-257yuOJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070082

On 5/6/26 8:33 PM, Val Packett wrote:
> Add support for the SENARY_MI2S_RX DAI which is used on some devices to
> send audio data to speaker amplifiers.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f193d0ba63d0..a675913da943 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -112,6 +112,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case SENARY_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>  	default:
>  		break;
>  	}

