Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751A37F73F
	for <phone-devel@vger.kernel.org>; Wed, 14 Jan 2026 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386506; cv=none; b=QO4QjB4hpbHHt1Z2Kw+8Clj4k3w9NQrXXGg7LqKEhvYhKb4E2WcO3ZXKY3WMLcr2p32zBtb1nyquTW+IXMq8zRjmTuLX9HZ447vq7SxaKSVbbTuuV6pYq7mOAIc4pgDVJTmmrfcytHPLr3sZdCiWztv0820pSrsIcTQ4Hm/AYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386506; c=relaxed/simple;
	bh=0CbyshIj1CFfi3rZ8711K9DQYajBFEov2AFFETZzmJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsJ+Yt50JSYzpNHPQXn9ep/4B7qepWgcoD2Ew8csP6E+S0wkDDE0dRonVYCRvmttjOlx5etkQlByPfmu2GZAeKabwNHYV0TJqu/59VV8kpXRBDCntwqhUbCEOQbrGxzCvRECKXcHqI+kZP9XoU2x04D6/74IfpMMS58HToma/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4Y7jY8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJAHklZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4Y7jY8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJAHklZW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j3qA3270846
	for <phone-devel@vger.kernel.org>; Wed, 14 Jan 2026 10:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2rUIWP734jgyS7kfTHkz2k68tE+yGXTA1ZKqPQH6og=; b=L4Y7jY8tZjq7r/mD
	hQzFvYOFvfU9JrUK5CwE6O+iHhAC4cIrR8X3ek6CvmLs47DY8JgtEvl7AE+O3b0b
	MHxQ1dfKobRAoPJJWcLf/DMlK3umedQYtsj29x5yhxJHnQPaQUNGrWAs5heJzhHH
	kvY7iPbdQ6dNfb0jKPpNyoNMrW1hTyCDRWriWzvvHBidunOZfxXsYX4EpScElBd6
	CWxOdT445z7cz6NaXJ7tMNhcgMpJJHXsY0LL2wxvXW/5RKdHqtUqLrG1BquFdw03
	iEfftDnx/92CsZMudse3feCnXVI8dDlITb+BcGvZRPB5cbS0r0fIa2TpA1WlvLX9
	IDjfXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v3de8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 14 Jan 2026 10:28:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b25c5dc2c3so176403585a.3
        for <phone-devel@vger.kernel.org>; Wed, 14 Jan 2026 02:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768386502; x=1768991302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2rUIWP734jgyS7kfTHkz2k68tE+yGXTA1ZKqPQH6og=;
        b=LJAHklZWs8jmKxAxN233zesN+nxbeA5DORiXTA2x++5bJ/4COzWqMSLCxl9fAh13DR
         YPVk1aRkXxMS7l4sTcGU9dk0/g4u7NsWCqGVZlrtBuf5evgBvXZKTYpB4B67w5CWz59N
         4v4R4sjGks9ks141s2+kwJU6dsDe+MkBOLlcUB0rtcrQ3m+qhuRPl1naTq9Z9xrtaZZz
         /96Ga6Q+1io/v+a1Cosfleyz8GUJ38bXJ2pZrtx0psDxx2B137NZ2uOiSycS+eN2IinC
         ScEqyScklGOvlIIoQwxHmajepLiKXTSQirpOvFiXORZGo1/+VjF/6TyEFPkUsqCy6GWc
         HlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386502; x=1768991302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2rUIWP734jgyS7kfTHkz2k68tE+yGXTA1ZKqPQH6og=;
        b=pd6glF2tNaC3/U20BCqZYq57v+L3b/t9CL1WpkZm0E1UH5ZGkXUqWfCekKKwW3PH37
         kVVpDq6kdNYPfLQkORu+JrM3RaO2lSg6Ee6uTJGiCh0J7Rc439bXZcJXDSs5LK1eVHG2
         pWwte7A0gdlUgm+omS1qYIT2mBeW0JX23lWfHSpHo2VWjjdleS7ojz1VsUhepvwJ7+zE
         ylLFq/HXpLGQAlraKO7+bkR/+xyKTBVIwUms8yAY9BX8rik9UeDw2RSUGU0vu4dad7wq
         ZVGXS250+qE4ifvg9DtIsCy36ZO0wv10yXNaQmwUIoxUFH+at12inGpPvQ098Q8pRdkQ
         O4vg==
X-Forwarded-Encrypted: i=1; AJvYcCVSfuphuHQRi6JD4QbzXQNzHJ7obZTX+V8IN+7xf+Tfe28wKrWzoucxt+BaFkJbDyWUVi7VrKQ/w6e5MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9H90ut9c36fB650DWcNOwsaPSgy3Q3kZtw4JGIQ0r+F+f4c0E
	Jq7EuM/yYreX7HhKg6JEyN8V6exMIotgWIGbzwEb8nTpUgafjPMDKX59/NLuPgjiLERMXi937u6
	3sABUR7wZO+SZEJegXYoslqqeP831YtkoW5UZcm8I3pbtecH1D9+F5C8CEaV3kiORGw==
X-Gm-Gg: AY/fxX6AzwOCVeKpk9kz3GNgjbEHv487OyoWjI5AG7DdA2TOxo3uR6w3VfXJk0KeIDW
	RvRnv9vV37eDqr9FJ20yPGMC23b56tYP6IPAkSmvS33fT5S3SynhWfBUWPzh5Ike+wUPFy/YioJ
	ANKusyUWZDcJEyCFj+1rMiMax+NJr21aoV6o8fKi/UG+pJN35afvsz6QBHl6qQUdeQSSMok2/Pd
	AEH3JML/DNSBhmuhewyN2vgbOvqtvYc0FJanNAjynm0ihWlAfLQ4PNfKO9eyjvMGDnosKm5deLW
	0DaB0MFqGq0dPV0KfPmQbRnLvWqG4qY8HI3mK+V4mDVdVtFj4TNLRzkuxiVVhuou+V424B72O5K
	Je0pZdDccPWd93O1Pn/xE8zw9Q/jFZIxrRoXtMIxpViWav1/CjA5/0qj1AegosHHME1U=
X-Received: by 2002:a05:620a:2945:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c52fafd3d0mr237609485a.1.1768386502244;
        Wed, 14 Jan 2026 02:28:22 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c52fafd3d0mr237607585a.1.1768386501828;
        Wed, 14 Jan 2026 02:28:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd007fsm1275650366b.31.2026.01.14.02.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:28:21 -0800 (PST)
Message-ID: <ff4d697c-2007-4b2a-b66b-dc86053a20a6@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:28:18 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
To: David Heidelberg <david@ixit.cz>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
 <723357fc-a785-45d6-8d49-4c00dd4f340c@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <723357fc-a785-45d6-8d49-4c00dd4f340c@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69676fc6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=za1BG0YIFsB6r-OV5FEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: MiLrOiCJYo54s45HeAVFO3jNUh_J1SQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NSBTYWx0ZWRfX114VWJ6yuDDR
 SpmUftJm2g6MD+w7nlXMZB1A/j+l6DaFEe4n09i7EKu4Hrp88y2U99Tv7UE0fJCvd8BWYA681Wm
 aUfgCijTps4YufrHKPIyoTUODvQZMpnhvmN5FdUL8XLpL19R5zluFzek/paEq1IvYuLw8drrmhe
 fs6O2GtBl1EWQuo75XOh7/a9q621MJE4JuNv50UnT5++kLWb6UbOSnx0Qq6G0Y6GP+/ZByYca93
 /7yXb0B4LaMgOJ3KwhUB4IgEYl4b6zXXY0fYAFOF4FH6cT/uEgQuR3Sb648zWEcENKg5vRDHc4F
 Pz0ZksZq+ii50FXZFUsgrmM8HicuqkNBGtd5YQCzp8d/KV8yg45IzQcNqd866h+4W1hObolV29W
 Jm/r4b7nDc7T9NZewL8wH5wN85NQheDmJ92qWmtMOkWpDfSD1Rxa7kLnwb/1wODEc0r3SLANHnR
 /9xcZOa1kNHUaoiL+eA==
X-Proofpoint-GUID: MiLrOiCJYo54s45HeAVFO3jNUh_J1SQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140085

On 1/14/26 11:15 AM, David Heidelberg wrote:
> On 12/01/2026 21:13, BarnabÃ¡s CzÃ©mÃ¡n wrote:
>> The device was crashing on high memory load because the reserved memory
>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>> Change the ramoops memory range to match with the values from the recovery
>> to be able to get the results from the device.
>>
>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---

[...]

> Hello!
> 
> I suggest one more nice to have improvement:
> 
> you could label framebuffer cont_splash_mem since you already touching the node and testing the series.
> 
> Then in additional commit, you can replace manually defined `reg` in chosen > framebuffer node with
> 
> memory-region = <&cont_splash_mem>;
> 
> For example you can look at sdm845-oneplus-common.dtsi
> 
> Tell me what u think

If you wanna do that, please call it framebuffer_mem, "cont_splash" is a
Qualcomm-specific name for (roughly) flicker-free bootup

Konrad
