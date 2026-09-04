Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BDD3932E1
	for <phone-devel@vger.kernel.org>; Fri,  4 Sep 2026 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510145; cv=none; b=I+BAzA0N19We78Ui7+jGru7Xs/olRICmRj8PEfuIQlPGs/X5WphU5tlTntGmQTePVqVNKhKetxn/cSlngPxrBtUrUaki/plLl9D/EJA1APCrgeATJgFyOFpNCOVj8dMQI97EJEhVd8qhZC35N0F8wcIu7zBXXfFB3D8gS/bERjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510145; c=relaxed/simple;
	bh=uDyzs5s9ApfXMfGC9CNZWjKX2beUmDaLx9equHNxSfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9V99K3M+8TtobEdysR8aJWW7hRWZhADxhypqmTb3tIbJFbifQBiYAwZ9ZTOS5oLas3aWbZctTXqv5szT6AYWIAti4HFnBUcW9cIstNM5NTPJ+1mfmp7ZTmeo95tqI1UdjOTBssXiK0rnvok9fQt9fQD7Uu833FeumCwofUJ6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KS7s+FbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSxF8art; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KS7s+FbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSxF8art"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mk6p1770388
	for <phone-devel@vger.kernel.org>; Fri, 4 Sep 2026 08:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCDGNyEsTtuKiGE2l/6lbLYXN71BNNmA6uKcG+M7tSc=; b=KS7s+FbST0JSiKYN
	yR5X9lEY3ge2qKQ3jOXvGKtxyd7DqwxsLPhxlYiNxStwUZL9t1LMPwX3AUS7LdW0
	iceqDYqJMQSWZk3QIpMOLt3dhmuJ5arsObfvMdm0/3qCzjxjfSw+Lskd246rcUkK
	nlULXaYtZtLNKj3KOrmtKFFmqE1VnXlpQdroKwTsEkgyKjqvTzr+DpJhyPNjJG6O
	BJuzeI3X+aq21eGItNuIy2UcqhQUjf0kitTAUICCWJIiqsrbZkorsrKi7dq/wYak
	xIAKe/wdf0rNHgzVYrJyG8rUYzeZW8c0LjPJ+4G/yYdHo5vQcvCQF0mHM3Bn4UVI
	7ODd9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqrt3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 04 Sep 2026 08:22:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930bd2bfc45so13400285a.1
        for <phone-devel@vger.kernel.org>; Fri, 04 Sep 2026 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788510142; x=1789114942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCDGNyEsTtuKiGE2l/6lbLYXN71BNNmA6uKcG+M7tSc=;
        b=aSxF8arto4RlbuanxFORUXibj8465teFb3VDZWpnUVxeFn18hPYN/KBXRsNU+Wnp3f
         cmL2+fcgxzpk9ZcR6hDOnGJKlidnR0FUrDaFz7/mcIcx6yItwPpQWtfCdrpCesMfs3zf
         B5M0gOL+1wrwSxzSI4MoXDD6/5g9AJUALP7vCHQPLcneh3yUckahfrC8WiMIDXU0p8Cc
         HTFeBzduEsrYaQ0CSINHDuwoFUDutruJ74rrfETnwx862fKRYNUIh6nmgHELGjY1IWCc
         f3Xw6qFZBNL1EsA6xfKTY6J4wiT3W32a1MWRUa8BjsL45fKaiwE5OBEVcWVGYwbl2xZa
         3X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510142; x=1789114942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCDGNyEsTtuKiGE2l/6lbLYXN71BNNmA6uKcG+M7tSc=;
        b=oi6ZNo1pTvwsvBOxVpNiaeXr2RaDHHB1MJ6CD4EQ4KRyo6mNpoh53Lj8FwPi02uqM1
         +IyT5jPzmjCD/Fl12W1ahesNs8gIy4rSV2oLT7kKYH/AevI6KuRCQo6fpWMZFDTwCqN2
         Un5ui6TuV38oaS93OmzW7fAxiZ966REISZhtPHmTiZQPsKemB9HnsGCnk058KMty4JOD
         SCNk9mgivDBnu81aZgSpBJW4HHTQzzRaXB5xG3H4QbBPCKPgLqXFSko9Ym8nhgLfK+SF
         nWT5+VqcdSHP0JlsrPaHP0p2jhvxVNGSwUUJqfPDADGXBlX1r5kB5ujeJK2kikOoE7pE
         vtVg==
X-Forwarded-Encrypted: i=1; AKwUvBxvYxsjbzcTJDLJbzYmkzsbC5ELLeT4Chyv7Mo/RceSc2DnEz2IPB4gV4EPZlp4mcaWxvSWQSkC+ko/AA==@vger.kernel.org
X-Gm-Message-State: AFuF++mDeoW6f0r7LNnY/4BFjxVbnDSRN+/1tpOByBuMzCG7qxFpcQRL
	l3jw9MXP1xTQWfKjxHvPRFBh/rsVOqLN0N2q7bwlZJEs7RT9PlnZaDGyKstvp4YNTeUd2h5urbA
	+kq2VjUYH9OIK+Vbsk2PxurS5R2b6+HmTS5cXC1hZWgGY0hR/udxe7r4/PKEL5ElQMA==
X-Gm-Gg: AYBFou1Q0yMGNBfiVB7W1SUG4Ow3kf9EGrSMv7xNsHhRRquor/vr6Os/6kaUexlrSnU
	wrhtYPRpYEiptcWXk9s2dhXn1d3sIpKNpJJHM34ePpSmDKKIC0lgjQmhrgeY32RmLuOd1su53P7
	LFM23nRmdYg7zxScYyVBdsdsUZbmj2Z83y+//oxH0qa1FzVP0Vmsw+otyr9cLibvG7n3n01Z1i2
	HXONnBujDsSLEC1NvtrxhmoxxPDHlK2WEuBiYLvu7Fl3kdMF72b6TZzRe2FZstBCV2B/UoaNvhc
	QYE5xFlxC+GzDkobPNLo53IHLFPLDFKbQWEqqWS+vSnHNjMCfioOlYIZ/ZpQrAZkU1lo+EytJMP
	fDkmA1AKjFLB8h2Ai2TJR7w==
X-Received: by 2002:a05:620a:4390:b0:939:2884:e11 with SMTP id af79cd13be357-9398071af2emr306058585a.5.1788510141845;
        Fri, 04 Sep 2026 01:22:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4390:b0:939:2884:e11 with SMTP id af79cd13be357-9398071af2emr306056885a.5.1788510141355;
        Fri, 04 Sep 2026 01:22:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5921e2sm72695866b.46.2026.09.04.01.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:22:20 -0700 (PDT)
Message-ID: <cd5899e7-6882-4e32-9071-98fb94b0fa7d@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:22:18 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 5/6] ASoC: cs35l36: Implement set_tdm_slot to
 program RX and TX slots
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
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
 <20260903-pixel3-audio-v2-5-7c22ed915291@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260903-pixel3-audio-v2-5-7c22ed915291@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NiBTYWx0ZWRfX38S8mydcXXUa
 Q0L7hcQJ3mtP6CR4aZPPH1xiJ3Z6nz4Dt22MaKyFtnC0KZtqESLfLz6DaixjfI8i4keL/7/RfaE
 B9KHOHJzCXO1VjJBCHUhf9OPX4dFRRY=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9a7fbe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=WIE3HCTimkiIGiWK3dEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NiBTYWx0ZWRfX+9emIa8uU47N
 aZLvd8BLHhcNg3Km9HeyO4YLZLmFABoMazrRVsQT2XKPr1eEThPHNuopby8UGHD5lVUwAaAUVXC
 IVv376/6KAxw875scpfSe77zj85nsgu0di0gVvHRv0Nv01bf/75lZd4tjfWRaU7WL88CjcUiWIO
 Of9rIH7trJQ1oXlh2Xq4diohtpN0CFa2/OQAyri3XywaJ0ru9Nf05xV3kc2uNzzIMXocnYwcH9Y
 n5WgsyEens8gPv3C9CDtyoHOIzwYIJwfAK9sWJu1r5LG0IiT9mUXprM0Q6mHBSKq6rqMGvEMsFr
 /TSjEcucO6QgrhtFaGuMDBgdK+v3w3vLkxM9RmnanyqaT8kd2W5fM0e8FeIpOwur1kP/tdRAmAb
 tykayyk8wzCWphRKVbJLiwDOIY/TiEf+6vTyLwwg8Bmxnyu6azENwfOrUdF4I0Fia9plsP6u5gz
 ZuxgX6IG9/7IHRRxqsg==
X-Proofpoint-ORIG-GUID: 6WhDWs8bxBGywE0iOp1nDteaz7cc7N3U
X-Proofpoint-GUID: 6WhDWs8bxBGywE0iOp1nDteaz7cc7N3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040076

On 9/3/26 8:26 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Program the ASP RX and TX slot registers from the TDM masks passed by
> the machine driver. Each set bit in a mask names a slot; codec channels
> are assigned to those slots in order, ASPRX1 taking the first RX slot
> and ASPTX1..TX8 the first eight TX slots, with a warning if the mask
> names more slots than the device has channels.
> 
> Passing slots == 0 or an empty mask restores the hardware defaults,
> ASPRX1 in slot 0 and ASPTX1..TX8 in slots 0..7.
> 
> This lets a machine driver with several amplifiers on one bus, such as
> sdm845 with two CS35L36, put each amplifier on its own RX slot and keep
> their TX slots from colliding.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
> +				unsigned int tx_mask, unsigned int rx_mask,
> +				int slots, int slot_width)
> +{
> +	struct cs35l36_private *cs35l36 =
> +			snd_soc_component_get_drvdata(dai->component);
> +
> +	/* Note: rx/tx is from point of view of the CPU end */
> +	if (!slots || !rx_mask)
> +		rx_mask = BIT(0);		/* ASPRX1 in slot 0 */
> +
> +	if (!slots || !tx_mask)
> +		tx_mask = GENMASK(7, 0);	/* ASPTX1..8 in slots 0..7 */
> +
> +	cs35l36_mask_to_slots(cs35l36, rx_mask, CS35L36_ASP_RX1_SLOT, 1);

GPT says:

Findings
1. High: patch 5 makes the TDM RX slot compete with the codec’s Input Mux control.  
cs35l36_set_tdm_slot() programs CS35L36_ASP_RX1_SLOT with a six-bit TDM slot value in patch 5. That register’s bit 0 is already exposed as the Input Mux DAPM control:
- sound/soc/codecs/cs35l36.c:588 defines the control from CS35L36_ASP_RX1_SLOT, shift 0.
- sound/soc/codecs/cs35l36.c:583-586 defines its values as RX1 and RX2.

Konrad
