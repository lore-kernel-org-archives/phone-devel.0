Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12699381EA3
	for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 23:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366723; cv=none; b=qurmPUb95vCR1dIdo5gqegichjeyxIQY/v0veApYtP7KxYRyZM0fhRYln9CmA4hedNW665YVEQgXMSn5Oi4dSuaoyIN/0AyABIsiVDCmpBFGWaz4P0IOfPweqg6z+eGbbZhNOyJuvffv6yAUrVPUvdUtKOT48LbgT24+MS6V4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366723; c=relaxed/simple;
	bh=mX+uXiXqmR3+strMhFm04SU2uyDc7C91wtsmT25MVT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVpKd9ryBZGKP0ZEbboK7objpXc36LGdkVQnLvFI24psbzj5IcNkErzfkzwW01RMoBY/F+UNICKn7AXKLV6fmLDD1YyiDJKGvIYK38tGH8Rjo7j8UinxdT0F+0y5OMpKH+H+yat+RiQaGLf1V9gO1hTqLwQ6mfYxsbsAA1Xoglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9l+b2Ao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP7UGobX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9l+b2Ao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP7UGobX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TMoo5S3442978
	for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 23:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=; b=J9l+b2AoygGm2gwY
	OZncAuAapuZSzxSi03eA3UGAp0FQp01EeYiCgLoR0vSPXmqXmiJNxf5QL9692E8f
	xlJdKkLNl+T5FRYnz8yGC6lxR5pzsyEqSbThJXSl4bjVgDSTmuux1Z/4DFKrgoSC
	ytuGxGe5/Nqv+lvQOqsecDP52drH6ICIaTPLwpag79zmPo31O9pPhQIA0+c5NS8G
	ofjTRQ7rtskyflXtqC66ETzpSLSNnyjrNJKJbP+VchbhQbVyg299Q0gcbapLZW6x
	6qy5ArEyqjrziPZCwow3CUa1/fOnsvqEDLjbqO0ygC1Nv1tPTb6OciWKaNP7yp/A
	w4Ojww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqtp181tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 23:11:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so17599841cf.1
        for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785366711; x=1785971511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=;
        b=UP7UGobXB/4DorrSBjLa6qhnafahy7byKauY5ERlbSact19/ks47Jic5n0dCnmhyTz
         kKsqLQlSqtqgrBKx5YLR0LI5HOd68WehMBHDzO7JTMdX8NmIq45xT2UIGcPhuAHWg3e7
         fphB23lpef8xSX7hv2gPYJq8kMmIt15zkxeORXLsaY9Dns23Oo+M7oxG0/wAZwLm0CeL
         YcSzKrKhm+KAUXtQ0dgRY19X8US8na8Rf5+xoJEuk5nFZaF+/VnhKrC69F43yU3Q7UGM
         pAEDzhDVUiNCgXhNooD4HvvaMzZ+o5+StcPTkztR04wj9AzBzYyyY7yTe0QOUWuNCUbu
         RybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785366711; x=1785971511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=;
        b=Qdixm5GL9N7oEyeapw8qeuNBXmEQ/Lilp4PX3TqqH9adHI+N77QLJqoBnMo4CQmXQg
         Zk7yrKC8ww9OzGGEK1kODewmuWGIEavBhp9EX6SCqnt2ByhcI4s2u324ljHblXmKsgbi
         iqtyFDyyojaLg6/xWpegmA0tZ3UQqGOzkYqtsfazaI8LM5J8kTRyD4SAZfGBs6GsTU1C
         +8IsmeuwCi6EUWWrtCt6eAfoXEvs2nOAWGeLVvXzUx+U3EatClbIeFpovD6n/Fjjx0Ke
         sji3I5vj/DYA4OJR2d09OG0/0u2x4bwRsdGiJfEej86fUeyy01i69X4tCaLACbgR6zIc
         fsYA==
X-Forwarded-Encrypted: i=1; AHgh+Rots1gwbHPscCsuupWJoC96tC+VXEIX+53iuR5wqGvSSGFBucfdv3jc0Dx0Bii1miiPPVe5fgEq+Or7yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CFHKuaCKfsytS178QV0aTwOVQSnh53vYWSV5yvTjNXnEYdK1
	0h6VphWPah3JUMoBxqQ3pBECtQogi2mtp0tVVYpGJVvCLoHTuIOpAjoSRjZzEzWS6NkJ1sDVrDo
	rnbaTALDQN20gha7BKgUblXuL8mjGfrYINEHG1gWq4vEiP8l3Xb2xOietg03NXaF59Q==
X-Gm-Gg: AR+sD12FPr1SKvmvv1WSYEj8AQFzMtHNeiL1cACqzA6NwxargZvw0liiIX1oNsEYs59
	JfATbDLcqrO1CUukGc54e8Ut0raFQKPq0ezwpPlXqcZ06udE2w6qS3UGVzLxyir6LOq1PR+PvD0
	yqxYay5pgRnYsa9je8Bspj4BZ+240AcaeJ6dZNobDBAAKek8X5RGTOtedN90me5f2HiUNtjk1KD
	A3VdVQaSdljB8tln9dRkInQToT960GhDSWrT9JYeBEAf5jPKhpg6HznUbDDb2q7YYst7bmaoBVL
	JdbGW+YuuJIuBjV6zOI6YBSuDHpXkweJcVh0Y2wOhY20C7IPEBIxV7O24R2Li8ybhUjpekBSxxD
	kIuMaDUz7hOUoNwqt+rfFfBjXHrA=
X-Received: by 2002:ac8:594d:0:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b38497620mr5750691cf.33.1785366710559;
        Wed, 29 Jul 2026 16:11:50 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b38497620mr5750301cf.33.1785366709984;
        Wed, 29 Jul 2026 16:11:49 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm184393f8f.22.2026.07.29.16.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 16:11:49 -0700 (PDT)
Message-ID: <667133b5-10c9-4007-b5db-27e553dd5034@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 00:11:48 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: sc8280xp: Add support for SM8475
To: esteuwu@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
 <20260729-sm8475-asoc-v1-2-3edad8aa7628@proton.me>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260729-sm8475-asoc-v1-2-3edad8aa7628@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX37hdyPnGHlJE
 yIBmOXxs6EvGWSF2vMAh7J4s4B36OB3wxh0FZvMoiPh4Qt0LejuPO/gojlYUXKvNg7y5dboWlqm
 3EhnXepRa6aV4kFKnbxKY3YO+wkjYXWj4zCSLZ2xJE6JSmv5iX+m/RGR53fv1tBz2yrMjpfUasZ
 SBywWFoKwm08sXj3OxWnLRLcTx3hFoaq828A9scF8kRWF38y3gS1jicS/XEeaQReuZGST9tNkuU
 QM1UW4lj4lT8TNJSZagF3GwfBOe1zFORaCQ5YEKqjCBcv9fvYkyXAX1vQJ1xF8YfRnk+pThQSGx
 vJJA/tX4FAQPv+5JYPEXT4CDnj0F71zhbm8lf9UVTcwT7dQGhMkU1qn0ASqw3qFMNVGq/fhrPuY
 izlnZTjQUB5M6d63w/NupdKztZd0Zc9isgC8plsD3or+Wv9/svqQNxJCj8bg2u3+dVvxcRnB8NQ
 tAdckO38CJMBVjgtXKw==
X-Authority-Analysis: v=2.4 cv=cJzQdFeN c=1 sm=1 tr=0 ts=6a6a88b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KGg2J5DcaUvRLS7BGUYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: rUjx9n5aukqFRBf0jL4EUf40Mv4KY8HP
X-Proofpoint-GUID: rUjx9n5aukqFRBf0jL4EUf40Mv4KY8HP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfXxrq7N6ypAxoW
 wl6tiWJxuPl0V+RbpI3CV6JOX+zOPVY1tXOYU2nkhN6ATgEbvP294ZzmBGQibI2L5kXMitR14Pn
 +s4C9eLLReAIi3LQ4n283Q85Zzh5cDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290173

On 7/29/26 8:31 PM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> With this, SM8475 topologies can have their own firmware folder.

Patch itself looks sane to me, but the commit log needs bit more love.
Its too short and does not explain what this is platform is supporting.


Once fixed.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  sound/soc/qcom/sc8280xp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index a9304784d41e..f0f3cd8fca38 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -362,6 +362,13 @@ static const struct snd_soc_common sm8450_priv_data = {
>  	.wcd_jack = true,
>  };
>  
> +static const struct snd_soc_common sm8475_priv_data = {
> +	.driver_name = "sm8475",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.wcd_jack = true,
> +};
> +
>  static const struct snd_soc_common sm8550_priv_data = {
>  	.driver_name = "sm8550",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -395,6 +402,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>  	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>  	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
> +	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>  	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
>  	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
>  	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
> 

