Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BA53ABD99
	for <phone-devel@vger.kernel.org>; Fri, 25 Sep 2026 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324581; cv=none; b=oI7isGHg5Y8TWBE3vHrfrzWbL7aeiWMCI3CJfEC9EH0O569Ta9kldzQ1RmZlEQanhH+cLJflyhaRdg2INHEvm2ZeWfyipHSYKZFtgSwKXXhViD42nJNtOQRiYfUqO19dUD+Qj4WOD4saIknqL2kPlNscF4EIlhd9rfUn47x9qiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324581; c=relaxed/simple;
	bh=I/fv3RGnze7s+N5FxFvRXiB+6C/5+ZaAufwlU5W7NRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ylq3uqsccAfF6j6HGJKmVVGkrBtmiIlbC1wrZ0lcwqIwpyVQwBH1k4hKdMwfg1Yq3d6MX9sITUEwKpYXUVgFjg9C7+vkRc6xALmOOBvLGJkut1BValNCReFKVwn+w4N+ma7mCutlvB54LQqNzSIdFzQX8ic9ocmRBomt5D1Niqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRAPVPHT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDZidfdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRAPVPHT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDZidfdt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YqKg1056150
	for <phone-devel@vger.kernel.org>; Fri, 25 Sep 2026 08:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=; b=nRAPVPHTcorj6cMq
	U2oLcplr9EuNFl8IICoQr+bhsIFWpbeG1gGLNj0KvzUOZ1M6VutX4MTp6RVEfgYY
	u/BEmpItk0yqDxab/KvpdIkSwaw7pSaWCSPXThuSGlNmuS1IHHrI1D1nlOlR8wxc
	cVwDDJeGrNG697LAxJLGvoxZkwbO2IRveT/TX0GAwN54aR5hUSXMWVmZrYJm0tY/
	P9tiYsvBo6zksLWWvNA8/VvjPtqwLSC2MAF+4gEPQL3ivDFe/sLvx6t+9SwzBfrM
	H2TyVAVdK+6dsOQFbdbQguEBhbJY8rSsn87r1XSA22JZncBCRQVFf8Fzg7W+8Vto
	jq/UVA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce79m20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Sep 2026 08:22:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91256a7b7b3so10620596d6.2
        for <phone-devel@vger.kernel.org>; Fri, 25 Sep 2026 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324578; x=1790929378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=;
        b=dDZidfdtD5IFI4CqSLAQ6xTv1NYbx+Wa6mm8u0KVI5lfRzx6jyM9ddMTn1GuMvxhhm
         lFKeq/5rKcTO6DVpg3hPuvNtvR+afjBHJRcWDegYS6u+298JzonTow+rIee1qxUCsc+9
         xRWm3zGFrqUB7/RCAcwPuS/4Eq56hxenZRUjeWfxRdGR31AUuuLJ+c/3XtApuiNwhWYj
         35h+73epziJbVFuIN0BuSgxFxzyfTpUh6fzWqfx8NvHJOTaouNSkxxbaKxQZHoIDP7QH
         iRCR3mPPKQO5nfOmsPZVN9ujpD68d9/V/EbICi3HivqPXfIgorVcC5Ea3EowCTQnVkCS
         J8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324578; x=1790929378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=;
        b=p9Oh6YDsfbu/5QEtvAtIHpnxSEOYG9s/kSKnBnf5W5vmqGSOJkseg8nN05zk6WlD/B
         Rg6u5TsOawLBXnoxMSDKdBiSytpovLtwX3EozRSFRnCnAdnXWaEQ26p6QP/uIbzIy4BO
         LDOjjqGMpuIXLkJnRzw5K+ts2a+xQjBamwKMNbwAtjdVETD+qrqCtG1iv7nTenn4uirQ
         u2I8XukdjabaU5PNMLbwPiojYjsKB86mA9mYO9ubC3Krh5h4MoutFXyCs3joe6L7o+1L
         PbtSuOqc+alRNytaQov9J/CMda+Ug+S9kA3PMMAhriTYcYA2/AoZEStq5B5tXBr7yjd6
         lS0A==
X-Forwarded-Encrypted: i=1; AKwUvBwZcl8a48hu9R70MfunvWMu5LwwKvkw35G14lIQYW7x9dPKFN8nWw1n0vHCre1UrDMaXDNI1DRsvTHLvg==@vger.kernel.org
X-Gm-Message-State: AFuF++k4LzLTzemb08LfPclyW9MPQhONf7M6c9XMgbWwpWhNuGjOj9R5
	2pO1Pp5QKnLr31+zs5EoIzpDmlhAwjbI3/gZCMNgfWHJZikA9qBEprt2EOLQ2JgpENO9xckgUWH
	h7p7nlKI5T7vs8r+oVOqDheK6joReGdUfRsGyR0IYLWaXiK8zhH0qHwczwGsGT/k4hQ==
X-Gm-Gg: AYBFou0lRkv8fMN3F7ISJ9qnVVZEMtvztIgSEIKrh53BvTSW82Jo9ZqSoo5IpHqVd+u
	f1sbcRdY1uGH5nsElyVUNugkrgInJ0j652CWMbWnMsR/Sv+1RxZ0wdeTNz8KMShutprg8fbIjgb
	rHUf3uFenHR80J2xCNuV18H2KrlC9zHny2BOraI0iGbZl7++T0ID5hszlPkY51dT2UBl9m3o//C
	A+clqovgWdI2vcRSTywoYNEMnxZzT1bQsZEcqIaHN2+ESU6GE8wn105sNO4bRYY8fxAI0mIFh9g
	ueBXUSItT6VHUteGzz8gX6gC+brOhK06VY9GJn74pmZc/GdF/qG6hly0achnXBjZGRM/T2ifuUk
	xDfs8JzAtjxx4fbQLj8rxGgMing==
X-Received: by 2002:a05:620a:2b8f:b0:914:afc1:c66d with SMTP id af79cd13be357-93c43b836dcmr301325585a.11.1790324578516;
        Fri, 25 Sep 2026 01:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8f:b0:914:afc1:c66d with SMTP id af79cd13be357-93c43b836dcmr301322885a.11.1790324577924;
        Fri, 25 Sep 2026 01:22:57 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm77289566b.32.2026.09.25.01.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:22:57 -0700 (PDT)
Message-ID: <348b88f8-4708-4d6d-ac01-3af0f40c23f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:22:56 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: qcom: sdm845: use DSP_A format for TDM codec
 DAIs
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
 <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ewNn1jBDlzpDZUWubP76gUUZAPd9TW5-
X-Proofpoint-ORIG-GUID: ewNn1jBDlzpDZUWubP76gUUZAPd9TW5-
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab62f63 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sm5W5dfhhG054gMKQQIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX2Ly9HU25c5x3
 VgGULt6BUEG/kbFHOIBH36RoJp+eMqf8INek3ezSckVyJdGw3z0OjxaokOermvHlNWau2RGiG/q
 RKoriVd7EIfXhOoV8L3tixR8q53NdCJXI+mwmrkNPRYhEk6lCb3GpNINXm0QAQoX51rH20zipVX
 kp9To6OhI0zAjAkuNrYKSzHaXREm2pylzALX8nfMMDfJHXT4kgT4KUqiMI6ntwAqu+U+tjGeLpT
 xCzhETeqyWFbJ5Okzgtcj41s3I7W/vc7WLbb5xbpzFBVB3/f0wCwgZKSQGfJ524ClKyOW8vf2vQ
 aNMpwNpJ0wbrKYZobHHjyTwOAEBpchPOzBeWv6InK/JUgoSEe4qyH1qI2EgCkdsXkWQd8RYo0vK
 2qhwFYDfkC8uv/vMqHDGcLNM6azM/HxsFa6QJN3F62ddbdTT83MT0RIHhXu9JH8AlxYDsYCaVu3
 hthYrE6aZlVWVP6n3UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX9utlQVSEeJtc
 S7qg6H9tuVYooBtVW2ZnAyT5ZxKZd4qsWOKQ56emIx+AoR1DEYFOJghl5WKMiZiU9Sw5Oy3ojg5
 20AITXvanYDPWZ9JLmWVrQEZSTyMalM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Before the DSP_B only worked because the only close-to-mainline consumer
> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
> Use the right codec (DSP_A) which works as expected.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sdm845.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 0ce8265ab1c1f..d1cc825fc5cdc 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -382,17 +382,17 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
>  	case QUATERNARY_TDM_RX_0:
>  	case QUATERNARY_TDM_TX_0:
>  		if (++(data->quat_tdm_clk_count) == 1) {
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		}
>  
> -		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_A;
>  
>  		for_each_rtd_codec_dais(rtd, j, codec_dai) {
>  
>  			if (!strcmp(codec_dai->component->name_prefix,
>  				    "Left")) {
>  				ret = snd_soc_dai_set_fmt(
>  						codec_dai, codec_dai_fmt);
>  				if (ret < 0) {
> 

