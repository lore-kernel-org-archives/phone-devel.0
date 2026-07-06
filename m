Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA2038C42E
	for <phone-devel@vger.kernel.org>; Mon,  6 Jul 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329089; cv=none; b=Gt3IlpY1Xq+9Ec5R/0DUwezhlFQuwhsN9kR2FNuWmSaBSuQzF73COzJthzv2i0mWiqEDis6M3k4LMOk7qiOy9UOuG9HQH+gPJgA+YtzcpwQ2QB/SChF8PCFmdG0JcsaPUeTFOwG+FLvs9qPvMi0eQghsmfNmkxVh2a2M8+i5s1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329089; c=relaxed/simple;
	bh=INACSRF0fMlMov5Ke5zow+WhwK613mlG+72Er7VCwbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4bIDEV9NrUHBGN6oPciJVKLT8UFJlWt+VZiteZvehu19JgsWlgHGR8K7dWhU7/oLej3bz2CiX7H1xz8izkj2nC2lpkq30zr55UV8MT6+t/RkElyOr8Tl3T6YFylIS2u6s5CE4MezFynGmTJL2MoCw6zOKJWK2f+tl94dOFbq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJvdy0FY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ye5oM7O6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJvdy0FY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ye5oM7O6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694Ekx128052
	for <phone-devel@vger.kernel.org>; Mon, 6 Jul 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=; b=mJvdy0FYGEC1xWeo
	ZMxMm5fDDkulgM6//y4jhJj3sLS/p7Yc6FqUZmpSnewA9/prOmY3SczBtkkXM5wC
	eWe8I6BmOQn9zNyHQcs1ex0s7nZOJ1SLdvJ77HgPG/retLeWj7c2VXDD6Kupawab
	A7W4vIE/W7ymcSDZuYLOuDsPA+rgp3K88WpRpa+jqxtoD82Pcegi6B9ylq0/L16Q
	GiY6ue9vG94e/WatlEgbZvB01oY60TrTMMj2MSYHFRZoqOJpo+6hJd4G0XpdIUJL
	WikppTlj7PTHh6Gq2ni3yr8HBxe+IcFSBxQI3U671/UcluNwydqQzEX/eXOtz4RN
	yv2cZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnhj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 09:11:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c298a1b20so5871571cf.0
        for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329079; x=1783933879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=;
        b=Ye5oM7O6+ktjLZCD2JZ0nAuF/nVQMrxnfRAvyX+felSrjojUxSiv3cH1nhgr2xMJ7C
         WR+BduM56g9SA5RMgNl0LF9NyreNLGhgqi587SBKhpNCIePeb2svIQQg2jl8sOSwMvq7
         3BFnFSNDZDHum5wT8MQ6ZsmgAyDWYfzfhuPo1vSusaq9xv2NODVueVbIICoWjmWmsZz/
         KFNQAYU5jR0jV/NEW1yO79xU6Ns5HZqMbd0LQR/l4YKIpVrgWVf+XFlcbt5lwF0K76AN
         5WWFAhBQkOv4HGPT0eB/hBv5K6r4TXLj5T8D/gKspEQShkE5OsPNUEE0aZbFZLgs1/Or
         Od1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329079; x=1783933879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=;
        b=lt9qdJLvkaRGcx6YSCBNX3x4i2dj1nrVsCuaQslO5DGLepk9Lakyt0TlWCjlzfr26T
         /FpQ9IcmYyJr9oBPBVUZNoHF+l5gn+oF+LBbMY6/8/CGJAA07V3ARG2yQgJsaD+NC66f
         iYnr2kmPA58WoVv677dAxffbsyc6Pq85Cix5qxQ22V6DrPRF74iRhjY5z21Ut4vGQbCo
         imosXjaAfk1GUd2OobyHHiDZm0Ld2cKLF4cfZVjn/rdh7zIEyPcoNo7kQN1HdR/fYxpn
         0RK/Z19nhSuvaAi4PdPq50cl6HqdfCMsY2MTY+V40SKsAopPQeYhNRAiLiGqZ9KPpcrc
         yI/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqOzuEq+di0pgwUUrhs66Xog9kzlh9VxDivBYtdTOXn2ZK26lD0rPh64Y3/BCpJTotxpvhHQVqn5y/bkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygrUo/kJww9+X/t84GZwURgo3CJ/URakcyv3D/EwRNPwvBo2rm
	yhGrQ8F7RQvepq+2niip8ZotHTH+Wqcy7zo1Ng9PsnYCZ3+dx1sg0bqZQZA9F1+fb/TY/+TScCZ
	P5FrGLt5wBXhe1IYgEh4jeClFjf0wxCLVK7IAyWt+MuGLwS0MCTxlR3UJ68EOMESJ1g==
X-Gm-Gg: AfdE7cklmPdn2oGFATPd22EwFoccADcsHZk9JSvNY/n4hucUKNbSBsoT8QyY2qGDXec
	E2qtzHyqTW6PrJ6YgX2p7sxXTHRRu4jv8vxUU4AS4SnF6xlu42TKS/Hb76LK7GsU0MAU2zsTFKQ
	87nOYgLiBhZJ7q7Fgf6BFBzOBK9vMqpEgGKrnwrAW3apd2V8spgz2HMtaY8meCBiPW4QpOMtxfe
	my59HUilNW+gs7qu4V77kv3T7eVhRLAY71d1nz4jk8zTOWa/ep1TtKCvrCNwc3L5rmQJHKLuk7i
	o+TDxDwmswrWF3KO5qu9KPw94ua6PRdWS7Zfw/CzBRgvW/uY/SAxpJ3ReULd+jkBixW99CiGGcC
	iS7h3kbff4/w/0dU2sdD5VTZVpKIJJ760nZc=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84781241cf.10.1783329078911;
        Mon, 06 Jul 2026 02:11:18 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84780971cf.10.1783329078449;
        Mon, 06 Jul 2026 02:11:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm722188166b.37.2026.07.06.02.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:11:17 -0700 (PDT)
Message-ID: <a0c117c0-26c0-4aa6-a81a-aff9567e29e8@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:11:14 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] ASoC: cs35l36: Implement set_tdm_slot to program
 RX slot register
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
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b7137 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PWbkM1JAYS1s-zoVCkcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: a5oiJBa0lmgUEC4f6USVEn96u58u80Ju
X-Proofpoint-GUID: a5oiJBa0lmgUEC4f6USVEn96u58u80Ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfX1BHyOrQO+pWM
 /IRAMQxS1TOR/Dgg4t9RQ2m3BI2TL/O8MmGBVgfiC296NlEzXalabOwPy25PYsxvh1wvtPnwkaK
 me9TeIG1LF8s11MEl97sEUfMsYlDsR1qlF4Li0ri+NFUMIG/0rEDj0wFE9mfsVHU59HiClhn4Lq
 fN9ElKLwtwWCons4sAxc1hw1FmPgV+yyx0gKYckvH8eMrfGb18SCqryTuWYaV03vmj70bdfhrFL
 d3cV82bkU4YZGqZYdDHt+KZjDDNrMhhLt6EMY/oufojpixSLf/nqo6U4w8sqVQeWGg7Qp2ge4DY
 SgjLv0zz5Jol11lmDpUuLlukbK/oqGPW2eTN+pqy+pPhOnhPRak3eLTpEmjz2UzI9lSxfMNlEzE
 SX42As13dqjd1aAyQByB55L1IjwivkNe65rAqjije4MeO3ROYSi6x4PSf3KpKSzljNDPfI1ClYZ
 oeJDlI84NeJb2HFwqWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfXx0cecK5u1seO
 o3aXlEnsatMPqiH50xhXjWNE2FuzOpnc4GWHi+DWQcNODh93OBmqTmr7vd73at6d8Ell02CqL5U
 ys8zBcxLeJAHVT7W3wqzNNCS6AGc4hs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060092

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Program ASP_RX1_SLOT with the first set bit of rx_mask so the
> amplifier listens on the correct TDM slot when configured by
> machine drivers.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  sound/soc/codecs/cs35l36.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index 89645327945f1..944f4cb5763e4 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -942,20 +942,36 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
>  	for (i = 0; i < ARRAY_SIZE(cs35l36_pll_sysclk); i++) {
>  		if (cs35l36_pll_sysclk[i].freq == freq)
>  			return &cs35l36_pll_sysclk[i];
>  	}
>  
>  	return NULL;
>  }
>  
> +static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
> +				    unsigned int tx_mask, unsigned int rx_mask,
> +				    int slots, int slot_width)
> +{
> +	struct cs35l36_private *cs35l36 =
> +			snd_soc_component_get_drvdata(dai->component);
> +
> +	if (rx_mask)
> +		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RX1_SLOT,
> +				   CS35L36_ASP_RX1_SLOT_MASK,
> +				   ffs(rx_mask) - 1);

if (!rx_mask)
	return 0;

(or does the field need to be cleared?)

return regmap_update_bits

Konrad
