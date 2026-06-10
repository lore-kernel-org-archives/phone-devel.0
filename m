Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786ED3E44E0
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088773; cv=none; b=gSBIAzPwBeqt8gL+2g0f1sbWXPBciwcPSrlVCH5vJrHOlWk9ugFu+f7rSJ6Nk24R9wHDM3qLFh2Yq/3vwqaseRlsuvHzaFuAcVpYA7hiSubtqpgDYQoWxcxMRhtbIa6Ry1G7wRsdNyV6gEhHovcGEA2x1UCiHLZgh1boUxtm5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088773; c=relaxed/simple;
	bh=+fVsd1Z1+tIzaGhW+BpuLIuaSGTLG0J27IW8uVttLPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fs3mq+PGi8WHPYGC/8MujvZTdW/BIlC0M0fpIWfgsEo8B+qt1ebvYDt6c6QLMa4WX3z3DTzF6URHX7k37Q6Cbv3BgX26aJTcbNku2b2n1Kp8a5CoNO6P3z2XLbAjWJia1UTTneMwGiUL4ddDjmN9LSQ7ZWHlYuWgDV2KiBeolRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz3tNq2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXPAEes6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz3tNq2I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXPAEes6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A8wm3W735519
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 10:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=; b=bz3tNq2IMi6oxKBJ
	/0CcPf1Q6ZILQx56EV7sbjNaWSukT/dHmMCeu62boRm2mbwH2LhwNwhfgbasC1mE
	iEML19TM0kotrxGdKuylFxjFb2eKb+tfTkvdHLTB4ko07aoUprWS0YgRHFrzNWnm
	6YPMN+agwvhG/8tXWCNKwzAydJQaCERCjyP6KwN4r5rkayRhqBF5Yus3zS9YmrHH
	mUwQ9zu9W+1Qq8J43aziQ5mEET0RuGxY/LQd7SCN8jIt+zeiI+ARHvoJYPsJ+GiT
	cS9yYJQyyhhobAhLiKfebjqpok1qY7BUgTdMY4yC43CJH+oIu9U81bsdVvWpCQTm
	tpbJLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1reh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 10:52:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c1997732so839087085a.3
        for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781088770; x=1781693570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=;
        b=PXPAEes6FuM9eUswKJLn1lqirl3DoTY5t0o7AdR+XG7T8OjFFe3OK3/ttCiZ3Bl7R9
         rME7U3Q4EDzJGkCpZk7B5MhvDGxqNG/tjmluUe3YJ3tKrG7sj6FKgLY1rATbBsO6AsuM
         nZltocGoymir18wuHZuMwy2wCb/DJGLvVJiHB359tSm3Wop+mPrQmyWhGYZYCQ+8NoCm
         wl+2sWqj4mrL0uLb0ByX07MDqfYdX6ql4QrSDxhvYaM2YrI/IVK7EWo2K9RBNk5CpfYO
         IcfNyYykYBWG35a6RcOMcbGs5TB3hgby28XaflC+wkAfqL43kjhQ1v21IuZH4foKO6iM
         WmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088770; x=1781693570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=;
        b=JZPt9ZjTrHgMxT14zyc+vHYnmyHC00REagI16KRHxlJ5CXJxe36PCt/Utst4gMWfis
         nJb5E9RU9FLVTWqvq/ZkzV9S78M2OdAPpm+bXF+2gkLV/FrlP1goyihHiY7gaA8myJ/Q
         UKKPHXuC+/MLGP5pdhE/8CzEmIgmAhW0tTKL2hsZp2DymIoz5qq9a+GfVS+6sa7VxZL5
         ltUHmwTLljjMGuRhHoDa7UU9T99s9Lh0Mw/GyNgq67lKNF6k64ZPMpYgEWxNQ2maB6FD
         Blg2e09AYJS5Ff85u0xctBhtIpY5LzZpFykjf1ERKBiLkDJeWKRn9p29prFOWHOqGSbn
         TAJA==
X-Forwarded-Encrypted: i=1; AFNElJ/QFo69Qxquw+o94RAHQqTNVMMtHRxBvibRRwuVP3wgwMARUd/DVT99Ao51ik3+zMtK43hTC+TwjU+mqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwToTKR2yvFDiT0dyQpp6nAsWLOWM2v3nXVSu0WVJTG670UThq2
	3SKLKoga+nn2h3qzuBVFDptO13NA4yaB4p+lfbjgsVMGjuPPMb+na3LNb9UZ7tII80CHf+/rYps
	AKW/6/+TaAspQBzlMn2sTzGi2F/Qg0Kp4n7DS5vnoem8aoIzg1yCS1u6y8INQf0Q7kA==
X-Gm-Gg: Acq92OH2RoM61tAT1TJqhmoxoRbNXkGedNZHqyYMA3U8hLFmkyDeFi3J36epKZqofIv
	MuO7dBFXUgiO5WshqeBiY8O+fhVkTQY/yCt3kpsA8OrXrTiSrD1QOsvT4n32F0V6DUoJ4o6F6KP
	43qLm4Wri3g45e6PR3d0pIVT/7WyV4Kx93AYFbts/I2HFmjWk+WIJArfWySjWlhmZ66ln+n0BFf
	K8voOKfBBlocb9u1q0Wh9MAibObPJcTNyeYEzO3ylA2gfJq+DQebsL1w5tL7ZlO3q8i1Zyj0JSF
	l9vIFNA9iVqk5aDoeM8e/A7K5RlchRtI18ukuVRg3rqZvZAe2PiIIjuajHckTrv+gCSkMj0ELzi
	rg0A4IhShPIbbGTTfaJtPbrrwe43UN24yaejpb1xxxK39beqS2drPGAISiD0=
X-Received: by 2002:a05:622a:53c7:b0:510:1325:58b9 with SMTP id d75a77b69052e-51795c56255mr369073571cf.41.1781088769689;
        Wed, 10 Jun 2026 03:52:49 -0700 (PDT)
X-Received: by 2002:a05:622a:53c7:b0:510:1325:58b9 with SMTP id d75a77b69052e-51795c56255mr369073261cf.41.1781088769303;
        Wed, 10 Jun 2026 03:52:49 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf055309368sm1154147866b.49.2026.06.10.03.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 03:52:48 -0700 (PDT)
Message-ID: <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:52:47 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for
 SC7280
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u7y_9JD1ahO2SmlxN3Q82O6I_zeGcUpX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwMyBTYWx0ZWRfX7uuShooNW+Fd
 +5hg5AQCoTKs+EcO1R7TeWHyKJUlAWtR+52PxGsnST1mE76Q35nacc/mQDa7JbP9RzF7v8BvUWC
 qJs99rkvkj2uYuWFhXbiMWP8Wbv5WhuAAav/d7vRdxuj87FFBrMWAc218LFNrtLqYJ9xChvp92c
 ZrQE6sXn0Mda59j5CH6fZ66ULyZ6yLxGYEBRoeZnri04Lp4RWrQWzRiWfjYAzUoF/EDppO7AgFd
 Qg6cEnWZ+SwzqMcncEdjJISmX8gzzcrEx0H2JegPThzNjus1fWlzY+IqIKreDXr3jaexahDyVmS
 Vmq39CwONeosKSl7aGhK9knKZZ684mF52OgDBDe6PpQ9las6L3vqH5pPL4aweNgw4t2XKV+RJXO
 b6ThgyNifEBcQnMMSvDSj6xPqOkhhMNKGJoPWAXrtkXABLhd8a3W4bLsjclOGhDwmkHSN3VVk8B
 9PWshFSk9/69BpEMxzA==
X-Proofpoint-GUID: u7y_9JD1ahO2SmlxN3Q82O6I_zeGcUpX
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a294202 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Vj5VumI9SRvEE-TA0EoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100103


Thanks Luca for the patch,

On 5/26/26 4:03 PM, Luca Weiss wrote:
> According to both the static definition in downstream...
> 
>   yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
>   #define BOLERO_VERSION_2_0 0x0004)
> 
> and the runtime detection:
> 
>   CDC_VA_TOP_CSR_CORE_ID_0=0x1
>   CDC_VA_TOP_CSR_CORE_ID_1=0xf
> 
> SC7280 has LPASS Codec Version 2.0 and not, as declared with
> sm8250_va_data LPASS_CODEC_VERSION_1_0.
> 
> Create new va_macro_data with .version not set to use the runtime
> detection and correctly get .version = LPASS_CODEC_VERSION_2_0.
> 
> Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default codec version for sm8250")

Can you help me understand if this change was fixing any issue, if so
can you pl add CC stable

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> I'm fairly confident this is correct, but please someone double check
> this if they can.

Yes, you are correct, this is actually Bolero 1.1.0 Version where things
have changed in codec. if you read major number it will be 1
This has been artificially tagged as 2.0 in the driver.
So the change that you are doing is correct.



Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/codecs/lpass-va-macro.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 528d5b167ecf..58a5798823d7 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -244,6 +244,11 @@ static const struct va_macro_data sm8250_va_data = {
>  	.version = LPASS_CODEC_VERSION_1_0,
>  };
>  
> +static const struct va_macro_data sc7280_va_data = {
> +	.has_swr_master = false,
> +	.has_npl_clk = false,
> +};
> +
>  static const struct va_macro_data sm8450_va_data = {
>  	.has_swr_master = true,
>  	.has_npl_clk = true,
> @@ -1755,7 +1760,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
>  };
>  
>  static const struct of_device_id va_macro_dt_match[] = {
> -	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
> +	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sc7280_va_data },
>  	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
>  	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
>  	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260526-sc7280-va-macro-2-0-f0d4591a611b
> 
> Best regards,
> --  
> Luca Weiss <luca.weiss@fairphone.com>
> 

