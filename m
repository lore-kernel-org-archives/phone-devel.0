Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD335676A
	for <phone-devel@vger.kernel.org>; Tue,  9 Jun 2026 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016731; cv=none; b=VPexwtshTLBFEJ2x0MH2fH3oUoF9wBQ4gxWIHg2UdmYCuPLAJKyYqzBQ5lQGYhR/Lmy2yPbloUWEU9xsDIXX8vv21gxsOZWD/lJQYOJuxNBAyGZ93sQWNwPxBlURBm1CND4TPfLxxkJboacgM6MNCXfCDEib5/eLlHQCjEhgvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016731; c=relaxed/simple;
	bh=plO5hMcCF/4ygt4ohaz4T1j5So9o1YDIgKVuqScozic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CO7Hlhxi0VMfpCXeTFRrn0nnTxugCWeVZgUvdh9pT41zV0cABORVL/lCfCf/mYSiEtwkRjVJvlRS4jvd78GDuLz9/0dWS28H/j6Y7adu8Ey8hsyHk8OwQCFL/HOe5PHvFGQoKLF0pCUy8f+FEuk4qAQCPkfzBBxMTDFkKnrWATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPOP6Xjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPojoQUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPOP6Xjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPojoQUr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmwF52702029
	for <phone-devel@vger.kernel.org>; Tue, 9 Jun 2026 14:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=; b=PPOP6XjlbYdd83mP
	WtHj13CR9w7O2VJxwz2yv93wSYeH+S4hazLd7PZc3H6kolIRkgp3H5NDCltlk3rq
	BmtpYwuKIFR1HjtdXjzWNHywnX/vZpt89H6ULFRYVWOlOUyVVHfiTvgwR3htaLC4
	jeV62TyGek80DdZDdX4nzML1/UPypULiZhbDzezCONgTBeFNkokHZDAPN7kXOyA9
	OEKB3tcL9xK4WJwgJm3kNOg8WWkFxwgurab3HDcYuUYGF3OOIvae27JykyO7EdPS
	4DcgPDPoKVTmtk5H/84zXH8u0aVpW86GsM5ajnHO0vybAN4yN/IiHGVd7DlE14Mz
	NCY8TA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat0qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 14:52:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91550f68e7cso148167985a.3
        for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016729; x=1781621529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=;
        b=dPojoQUrLgAsG0PaRyS0Uzaoxcem4N0OGayBLfgrOhGT/D8+GZ5WVwzDw7pAT/+3He
         U8/IOgbwvK4Z8bdVK4lwXmm9V5FCadj/J+uFJelG2z0d/FOqYKQG4TJFItiyd/4aO+pw
         GgGBpfbRynLCG0nGSHdADJ+FvCEganIYWpAqDwNe2BJk+6dY6UJI8baEr+vbnlFBazcI
         LSU0Axv4ivENpn9cPqEeUXXxq/FCXeH0lBBsUYk7+4LbHE327PqxRYtKki8WCvP5OZlZ
         cM+fWj1TJyCQoQJSY8N7kTu5gW3xS0v8nB4xyoSsFiECuqawH8B6REsd5eMpJkhLMlNc
         Q6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016729; x=1781621529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=;
        b=gefLvIXMrEUm5JHFEvXtVwy6P/mX+kl535GZcj7VfLzyFVmiOjVk6MhvRUBjfOAQeh
         ubRkO2bluRIu7sfhqGfUMkyz+Ruq/GvpWtWxhVSVYdGGfpCkktWTAJfp+7wLz8MAPiuA
         yQIDRmAQpaNhJmxSYT/o7dO0kp0XRi0gcSAFklJClPKg8Eq7ToXJNO9qJyqfSr/VyiS8
         145Ul+1g8A1BWzEBzwTqZ266aMINYXVtW+vlqRlzrMutOEb0To+3pc6CDuzRekc/smob
         hUohd6vfmvAvlwJE1WhMT43dD1mE5LtbcafOUEjuNw4c+9fd0OLPe6lPW0kjPsuqHyHz
         vEWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nNdi7pND/4fKlRrZorAMU8rko7BbOSZ/aUlH00h3JI/VCjKE3+5sG4TEBECJn06MvU1DPEWiteZ/Qsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKkSEJ6rKv6ByBYywgc3SC2ktTvgODThR9mohB7UNC8OeoCzF
	OTpES8J0cy9JkLhTFErzDNOtxzYB2coSdn58JZBUXxhzO+PUEX+QzDHT3gVPdHbicTToEayxWBv
	0yfdUo+6wADT3G/wP2VAplreWKdFSHh8QVN09YpM0VWHM34ecmvRdo2PxWOdsjbl4dw==
X-Gm-Gg: Acq92OHVsQMxk0bFprm5cdjO56pAnuL6K6b3kRS+uDKDrMdzlMQ/EPrp/MUWDHr1n/m
	C7Td3ynnKZr3sSk5l89gjYczHjx53blV60/FAqhLO+ZGX1fkAUtTcb0e6ygU+01BvEsEbqkEmZI
	bA9HpuTC55QxcmzlakrqXrJBRU30owWrnKYZCxny0t1ytZjFoa261tYB+5dvmXpfaD0MD0nya8Z
	1OJE7WCJ11xH0mP/yeZD2FxTnC5H6SP1X00OeVY0SwD1JE9Fn7WBYMy4dLD1wVf1cO+dvG1vHrt
	D+QzUzyQY27mVJTuvgP5VDF7M5YZ5kWLOuVlHZia4mLpPiSHHbTVhQ6cqqxYH0z0Rxkc6COvRiA
	628DhZ4Y87cEWXMqrKEOJSXnc278RRVcTb3aOil+XCn9h/OsRs5XJvJda
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr2044041985a.8.1781016728788;
        Tue, 09 Jun 2026 07:52:08 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr2044038185a.8.1781016728225;
        Tue, 09 Jun 2026 07:52:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2d2bcsm8765718a12.10.2026.06.09.07.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:52:07 -0700 (PDT)
Message-ID: <52a26036-6ac0-496b-8990-8bef0ea029b3@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:52:04 +0200
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S2YESrT3IYK5UiNjpb8CXNvLxjttSf8t
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a282899 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0fbrQ5wkLIivLQXGzjYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MSBTYWx0ZWRfX5FVWwQwOEGKO
 WYKLQWwT3/L69qzFHdcS8Tlf5/gF8l2lMY4t6q3UpK2C86QW12VpRnoRZYX3B6wXQOUotJuAdej
 BeL7M1+d2MIrbplPymOnqxPNoKxBbKd8fvGXBzzs9XZI8prRiQMM2fJ/v9USfgagbrY+JVdhJ73
 paITZ2E/tVOumFe3TfNfbSxQq7vtCshGKUW6ox4QkjzTegw0fGEHPz/nVkWJISBNfiZoLVns57c
 YOlGMeiNxxzGscJCU38fbKrw23yzmogJySPtzBBd+yrsmuY3FBbSvB8TifhX8gbbqmmf1u5nRhV
 8tTZ0SvTuUjwTaABoaZ6Ux5ibSOJEir7sx2TEdiTGFKBiQiTZcQSLg7wDQgVOtB7XQ98fitaDMM
 3JsYONKR1BqC0SICmsL5CI3U5tjnYcojdnSGWOAI1rtKA8CE8T2fuipZvR8vhficPOcjgwgK6mT
 SfBAXHwuWtMQbBOA9dg==
X-Proofpoint-GUID: S2YESrT3IYK5UiNjpb8CXNvLxjttSf8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090141

On 5/26/26 5:03 PM, Luca Weiss wrote:
> According to both the static definition in downstream...
> 
>   yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
>   #define BOLERO_VERSION_2_0 0x0004)
> 
> and the runtime detection:
> 
>   CDC_VA_TOP_CSR_CORE_ID_0=0x1
>   CDC_VA_TOP_CSR_CORE_ID_1=0xf

Some page tells me this corresponds to Bolero v1.0.0 (as found on sm8350)

But maybe +Srini or +Mohammad will know more

Konrad
