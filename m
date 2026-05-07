Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01D366052
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144587; cv=none; b=EPVVIQ6VAwbIm6/8brLa6hyURYkp8ebZHw0VL7ubO/JGNJBcFc+3jOLzEjkAzfQawlAoJ8xiM+wmr2CsI+S4rcrtqpoa55tgviNGv1guj2Qb9TmqIOfGxpeQTXlznhTNiVmOFI5Vjy8Kot7X6Zbyi+uNJDSz1qjsMLnd23jfB+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144587; c=relaxed/simple;
	bh=5aI9ufeEspbP6oC6uFRabDZP0aBxIPK41cWs+AYJpXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnlqQcRnOM+/xA4hnqi2rmgx8L17TAII7iDAEPkatfoICauGctvxWVdIyK4hVsx4ZqD1J0wQ8VyeHJfzQJW/UyU2yRM14QToInnuZWRG3H7DA0pPAp+UuV/IJUe/cRcpYxXxKu2cTOnwcfxhuPZ07QiPEBRaXXjWyx2hK1bHbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyjiVLNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7UcJz8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyjiVLNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7UcJz8F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6478mEjk259747
	for <phone-devel@vger.kernel.org>; Thu, 7 May 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=; b=JyjiVLNXyQm0DlBZ
	10sXw+5GiBcd6zTMT8pKGu72TAosSsyWzXI+0ZB0kT68Qt+BeBaxlCHuXK4M9o9M
	YnrYveghdPyhg1CUgNFhcvIz2qYDNVTOfZkhzfNGlfCtk69QUdJ7LdROqwcS+1Vp
	TiegUKKesEAX0WH/TOicWso8mNCrGZyxb/jNcim7igzvKLDUBmIRDPCkmGXgfqIf
	SKjSJOLfyQ+y8wXbuHTcL3PNrk6ZYUTE+YssNqloTur7RlCQcEsnNIWjNYTPnjB2
	Tv6VzJnUleekidXr1Jq4n3n9sKeVZtQ4vVX9B6d5HZMtv+29LlbgEk324aM07QTm
	E/K7EA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8sc5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 09:02:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575507a346fso855537e0c.3
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144576; x=1778749376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=;
        b=M7UcJz8FE+k6K8lhmh1P5+OrCSR/8pOPK6aRBKiMPhDv1yhr9oqa7X6YnfD7Z1Vch4
         8UNEqWMmq6sYihM4MyKOS1IAndJYUMW9v9B9H57qsBGRY9FXAlS8YG+5E2TyZRQ9d7Rr
         m3doxze8k1s+F/p7LzkhSEv5+QTbggFgD2OQs0h4UIKiWT2N0oIFb62+3WvNwglPgKta
         g3n8sx9+4lG9AggxfOHzAJ249c7LecK2oNxV8gFPFUb2qgd/j8ljxxiapf7O53Ii3p1r
         qNrtKR6s+0w1JOSWsUEjm15FogbTEL0iaqlIrXlG4gApv0M253Z5W529Ub7JrBeD14OP
         IJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144576; x=1778749376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=;
        b=ezR7dQzPvWydXLXzoXJZOv6JBaXHs8iTPyj7uDiXUFkVzk2iLswl4tM6/WCit9Jfkl
         x5bMNWb9SuLhqo1HbZ7fJT1XuWiOOX5fsPwirFANKquuprBHO34k/ccHdIiNEsRZrF03
         qP5td2sTy3vbA9b4MAqUdAM0U1rvrlJ8G9MB2MtCGWOwn4So2P88RXSkZP089yNNm/XA
         Tksa4oQca3PhUhk/1nnYGu1Cj0jbQHGTxSehHRUUZD90C91oqMkZkDszAND9VHetUkhS
         bIum0IvHOU1DZISlcXEcno5GYmgXJfeRiq5xBpwlfGQRzWMNvf47zbmoQBQphBiCcXcu
         WDUg==
X-Forwarded-Encrypted: i=1; AFNElJ+02XcpFaITwTqQ8dAZX2KQL0PA9RyE+RHSqieLNDOc6SVRJ01a86r12Z3bZsSwKql/Ue6621fiprnYcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO6Z5u0Ib5ivlYJWJx01fbaHoF8P3ZnJAf1ECo8FjyP6vTZc8y
	BJlmsWxLqsocbqJMHpEA87Vciq3luOjICbmhEwNPlm0dCCDn/GnNeyC+YlrpQ9loai1tzwpLyAq
	9GIBmwknU/sulN4sN7vmv4VpR+pfjCgLb1WrKimlIvQSOJMCKEp4v4M2c5pAEC2sYgg==
X-Gm-Gg: AeBDievv2BQwb6T1ZXkVnfppJpHTZj+ERR6fZ9HNhWE6NMo8U1tDGdzccmHxPmd8zUg
	OOtEKJRww8XKFfPNtNgXZS/jSOXDOqSqDC86EnsZ9KBUQH+kufftMe+h4DuQjJfZiVq5fq3sQT4
	B9bKYfo+N2mMjjKS4CG/y7I5U0zunI9pMIEj/Htpeegmt4+fBQwMIvZGgWhXFjghHyNUcDyYDXs
	vv/qzFG4AjQqKkzauQ3xtRV8kgv2fqKqRdHt+zDneUmgkpkh47K5B5/u+gVpWckkJKQPexqp+0R
	qnnj3qaIdTqDz14iD/31t23LHPvaUHWRc1dmMQkeEgtiUdo5bFjges5FGCRyf/8AY9TY4fXPCxh
	n+dTXeIzNyXZKdEBq1EQb/XObzsMv0uoNAIUsvJtS4ng/7jflAHJ0fDyNcSc=
X-Received: by 2002:a05:6123:a8:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-575595d0087mr3834630e0c.3.1778144575606;
        Thu, 07 May 2026 02:02:55 -0700 (PDT)
X-Received: by 2002:a05:6123:a8:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-575595d0087mr3834615e0c.3.1778144575212;
        Thu, 07 May 2026 02:02:55 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bc8351448a8sm58349766b.50.2026.05.07.02.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:02:54 -0700 (PDT)
Message-ID: <2f516258-d71d-4b52-a310-1b6ea11455ed@oss.qualcomm.com>
Date: Thu, 7 May 2026 09:02:53 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] ASoC: qcom: sm8250: apply codec_fmt to all codec
 DAIs
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
 <20260506204142.659778-7-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-7-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _IBzCbaQrofMEviK2fzRWrBFvVVRuLnR
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc5540 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=uMHxBK8JrORPa0cVsrYA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: _IBzCbaQrofMEviK2fzRWrBFvVVRuLnR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OSBTYWx0ZWRfX5APzkYJLfl/D
 3PHpRk4JPNEnxDvLWDSJ9DHKL2qoTD577GExfSEd8Jm/jPyHI6MbWt4l5RrMN7/vEqDrPgO52PW
 wgL43QdZQF6uqvlaxuyVhzyiIiEqgFgYvPruOsR0VEI8lCyUXiY7r0U5E5bzCTBnLXTUGlwm41W
 2TwkU0VQdXuCKgMSW0yC3jXAIAp4DQlEQTdFL/VEUT7AKo9zv3FNoSS42lZsK1ZppkqtSCCaAtC
 3coxvbMuuAhG6bEN3PY7orSV1rxUyJ+/soNrfgs66cA4ivl6BNv6CMUYqhw1t+1ZaRUACRoVG+P
 S3OUEs1RYuZZnNzRwoZ71HfA1aIObi4OmCmvs6YG9XLxmraqtFa+FBoeHOq0Li+sE8R4WwKU9XY
 PZHkascx/+2vjAIk4wX3ZfTPHoxuk5sJhA/Bi96lUIGQ6Mj3C3L6p8PucxaTz3a26OTbUH/0M8n
 P8r6SwUI32/jjsfEr9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070089

On 5/6/26 8:33 PM, Val Packett wrote:
> With MI2S and TDM interfaces, multiple codecs typically share one bus.
> All codecs on the bus should receive the same format configuration, so
> apply the codec_fmt to all of them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  sound/soc/qcom/sm8250.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 9f0f846a14bb..7bfe6d282231 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -167,7 +167,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  	struct snd_soc_card *card = rtd->card;
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> -	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_dai *codec_dai;
> +	int j;
>  
>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX:
> @@ -177,7 +178,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);

failures ignored,

Can we add a helper function would be nice here.

--srini

>  		break;
>  	case SECONDARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -186,7 +188,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -195,7 +198,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -204,7 +208,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SENARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -213,7 +218,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case PRIMARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -221,7 +227,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SECONDARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -229,7 +236,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -237,7 +245,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUATERNARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -245,7 +254,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -253,7 +263,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	default:
>  		break;

