Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ACA3B42D1
	for <phone-devel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324070; cv=none; b=ulblV1evbvlpGhWJ6zK0UJYZ5CQkroN/5RZSRAKsGp+HhY0q0KGcYkGGEg07NCh0MdWbz3WRtpI6F3RbtPsBGk491qDgHNQDINpY0isRxGoPkN4hpD1h7lHHcnW0cOneRgknCVkDQNPPnAXaCBQZx6fEGVlW5FAQpFJMA+Gw6VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324070; c=relaxed/simple;
	bh=RfM1E3VYKX9wiL+0X5EDW/fIg41SnkKGkIi9naOno2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DT2Nx6uuf2ai01YdnehEB//lCGGXdG+IzvUzxZhoo3DRTJJa2xtg2a0lQ6cVqr3HW16q2wvPkAoSNaW8ho0QhHdLItWuXnPwvnHffqJI1FKAoP70mif04YHR3URLpBa7QOk9ymeS6dzip7d/GfEEA2SohdQwciwkaFtym53+7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnAc4f4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzm3MeaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnAc4f4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzm3MeaE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5Ivk7600642
	for <phone-devel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=; b=mnAc4f4VUJsj19FL
	Q1P9Ok/vWPgoWXUfsOUT/oG0C/dZQep5KFBAZzGPmCAfZzLGzPf9VFRvEvSOXJbW
	BHhNXwWhljr+f07X7OAsiv/C1bcUVJ+tTJy6+SW9oE+rsswoiDSoFbvyGAeuxz2u
	56jKtKlCLQZQasSfIaEAS+kwtIXLvIeTm7XTZp8tATijSTPo23W5v2iwa5NlxItN
	J31k0IyNdRxCASy6lezOI+nIcyylkcpTv+5nOXDhqwsQTADQMP76BBhOolQAK1i4
	p4Xm1mexo2uMNW5YsNnYycyLuaOtFxpVyz5mk/zjnlqA59JwpxJ/HWbO/S/LnExQ
	PSPFew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrfv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c444b438aso114932685a.2
        for <phone-devel@vger.kernel.org>; Fri, 25 Sep 2026 01:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324066; x=1790928866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=;
        b=gzm3MeaEKmbisBMrND0QNFPBfDxtiNvumTPR8yFC23rXRewkvq4fPnEKuJ/dvTQkFb
         v7RwRjZ7JYsJRGLHHgUqBmWBQAMVgT7RDAICeUuHTRhNK7JkyAJnWL1zx49TrBm49M/l
         A3UBrOTxpWtUKRufGWjvvXQD3uh9rRGOvoZ5HtAYdbUtzKsdFD3vRf3juEZaG0KMAPSA
         p6So3t64CgxxBQA/jSDi8cQyS0yAX/HOzcQ4KDz4w4bCEqPfCfYwnUDIoQoWOPOW/rWS
         81P2rbfj7cqSG4VGABpe/B4Uk0BFd16Bi6XKbhUb71+mFln5eakjaQu8MHNTwan55lpf
         sLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324066; x=1790928866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=;
        b=slGIpyqEf6zKvtDJyCchXYqj3jn0MKqBVOOi0fBME4vGg6cbMFxhweq5HlxKz6Hd1v
         yrsjjlLJIldL9JgrENdYW+z4LCZ54425mW5Hkyq3pbwkLBOY8ZdlcqYpCIFwBnP9zR8m
         Ch/xZC1UmDU4IOggqcDQxjObHrx528wGL9KCQ5sbwkkKBUuNJ/mLgYLzQGwwvnlRo64Z
         F8auabygqxCyX/dYSfYWvunwNK6ABgqEOFJniLTk/VuNVUpA8UM4lJJKNmrgnjK6nbN8
         LQk5or7YNp6TtULLS8yseWZJ2UzFXt+TL2Y1zsfTxtHNQ7YjUVfFbmm7dnkFujDyuCuX
         6Mmw==
X-Forwarded-Encrypted: i=1; AKwUvBwHA+Z0P/XPLd24vT1XgnK9RzAlr/6nmZzoJz2JeRBACP/ivwlbVmu0tt3ArYp2T6lyzTgZPDT2LF1x1g==@vger.kernel.org
X-Gm-Message-State: AFuF++ns/LtxwSzjNOnIdIU7egzPs6z9uJ0aKWI7UHeS/aa0COO1Wu7A
	/5Vs1nedEoG2e+zByo15il7Gg+pa6Ijv4IoK1MtEW79NI6bBOOWr4LPgamHwtrU5p2vrvqnhhsA
	jT6b7SUnhFvczl8wJvK7OXYGvX5uklrSZoMUqDDkMF4/NrfP+P1TGBls2VdoYL6pZQw==
X-Gm-Gg: AYBFou02ozpM++xizOqmMWhjMVV3Shh2Noe8hBTeFgcQaw6keS7oDrs7KZLAFR8Gj3j
	maxCblq7viWC+8KMavKaPs6HWWn+/NpW+4hj2qmJ1H/GDh3HwIS2aDCDpN06ieuQfLdNH9Uz/NN
	eaB/7NMfflPr0Wp8DkN21kcbn8AGcYoLtr232wEdJEGr+ZXyIRbV7DKv6ewux12xKkmXnadv7we
	rV0/v6mF+pJnoHtCG0oHWVTNO9292RamHF64x1FT6DGzyAnx/TzZBOc56JYt9/1MMcCwoIoSMb9
	bOlA38EEfp5WPJrGdrDe7Z3aroJcmiqn9eOysAoCRHQAbfenfkMVmcpIgxW1V5zAmmwOd5ZUzgs
	bq+9iFn68DrFy8yUSDhO+kvGTXg==
X-Received: by 2002:a05:620a:688c:b0:93a:12eb:b626 with SMTP id af79cd13be357-93c43b80ed4mr291567285a.4.1790324066048;
        Fri, 25 Sep 2026 01:14:26 -0700 (PDT)
X-Received: by 2002:a05:620a:688c:b0:93a:12eb:b626 with SMTP id af79cd13be357-93c43b80ed4mr291564285a.4.1790324065567;
        Fri, 25 Sep 2026 01:14:25 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2ae735725dsm77113266b.14.2026.09.25.01.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:14:24 -0700 (PDT)
Message-ID: <d29c3741-0c47-46b6-9d27-1e8a54c51b83@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:14:23 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: qcom: sdm845: Demystify TDM masks a bit
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6r2QCc3oRUIzQ3NcLvBbWQCiQky7HwMe
X-Proofpoint-ORIG-GUID: 6r2QCc3oRUIzQ3NcLvBbWQCiQky7HwMe
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab62d62 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eN4gI1Pk1yANhL5TOoYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX7qt/f6uWvgZl
 ndq5ZiINp4ZiUuM8QTWpnbkuv5d+pIZDoJ65ze7S9+gVm5Vt5HrTej/hkqKlVkmI52qYNuTT+/w
 PHdoDUDq31PjrFaLMYO6kbgNIm+POmY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfXzFQH/TMaMP1j
 jMLzRRLZ0giTdGk6yB4M5vwX1iNKhmcB+bV1nxEXKVgcf1szEYwh5cVadUVwIbL3RqR/auhGatd
 UMMUyjbcsHJ8ujGiDKimYOcSFxsQzQSeYrme/tRG94pydpIJlrX7PBGXjA21VFWeJFX8uhyprnx
 NB4P0Hwa72iPeSx3trTRxZzWObqqTqmcx8Eeiy9MBT9I9Ulg7ecc2ZrAS3lsyFpgQh9sjky42wb
 0MXIvGPbbKAr6cYDcJFCnh5QdVHu5JEB3HU/nJsnbkjedBcAVW+wzpvOsHfmhc/DI4oMUxID3Ku
 Le9hD3qi2W58+UT8J3EiLqDdd+/wlRyv4lNQV+ihjcVJJmpPLtC0l8peCyUODqXghlEwswbb48W
 RKXrqYZk74Es31ZMXRwxuw2C2lhujmZP0xCVK1R0Gjke637pjgOj+Tp7Cuj10KJWmPI8H/emRf3
 u2qG6g4mmLNnDGxfAAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250032

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Describe the mask with the bits used for each RX/TX.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sdm845.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 6843ab8ba017e..0ce8265ab1c1f 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -18,19 +18,24 @@
>  #include "sdw.h"
>  #include "../codecs/rt5663.h"
>  
>  #define DRIVER_NAME	"sdm845"
>  #define DEFAULT_SAMPLE_RATE_48K		48000
>  #define DEFAULT_MCLK_RATE		24576000
>  #define TDM_BCLK_RATE		6144000
>  #define MI2S_BCLK_RATE		1536000
> -#define LEFT_SPK_TDM_TX_MASK    0x30
> -#define RIGHT_SPK_TDM_TX_MASK   0xC0
> -#define SPK_TDM_RX_MASK         0x03
> +#define LEFT_SPK_TDM_RX_MASK	BIT(0)
> +#define RIGHT_SPK_TDM_RX_MASK	BIT(1)
> +#define SPK_TDM_RX_MASK		(LEFT_SPK_TDM_RX_MASK | RIGHT_SPK_TDM_RX_MASK)
> +#define MIC1_TDM_RX_MASK	BIT(2)
> +#define MIC2_TDM_RX_MASK	BIT(3)
> +#define MIC_TDM_RX_MASK		(MIC1_TDM_RX_MASK | MIC2_TDM_RX_MASK)
> +#define LEFT_SPK_TDM_TX_MASK	(BIT(4) | BIT(5))
> +#define RIGHT_SPK_TDM_TX_MASK	(BIT(6) | BIT(7))
>  #define NUM_TDM_SLOTS           8
>  #define SLIM_MAX_TX_PORTS 16
>  #define SLIM_MAX_RX_PORTS 13
>  #define WCD934X_DEFAULT_MCLK_RATE	9600000
>  
>  struct sdm845_snd_data {
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
> @@ -107,34 +112,36 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
>  	default:
>  		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
>  				__func__, params_format(params));
>  		return -EINVAL;
>  	}
>  
>  	channels = params_channels(params);
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
> -				8, slot_width);
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, SPK_TDM_RX_MASK,
> +					       NUM_TDM_SLOTS, slot_width);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  
>  		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
>  				channels, tdm_slot_offset);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  	} else {
> -		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> -				8, slot_width);
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai,
> +					       SPK_TDM_RX_MASK |
> +					       MIC_TDM_RX_MASK, 0,
> +					       NUM_TDM_SLOTS, slot_width);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  
>  		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
>  				tdm_slot_offset, 0, NULL);
> 

