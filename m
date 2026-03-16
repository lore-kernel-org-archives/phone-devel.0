Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3161386C04
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654947; cv=none; b=ieGfNix/72N300fFb8RaFTeTxQrVocUHwAE1lZFFpxpD8ywMrfWNZ1qQb27OnISK14v5CygvdmZjbOz8bemAkoxqBskrvytlRUTMV+fMH8Ez+6FT9Amc6Q2bm6r0WXsyOcjaim69m3hFJr7y2UF7FulMvO2olSQ/9NzsR4UKcnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654947; c=relaxed/simple;
	bh=vUeYwy6YYwgKmE98VrQLfg9q79tx4Vu9QgU/DGd18Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsbOKV3oSAQIniZF4ku2JyUKHIQRNmpKtxIYtqYS8+shMixjaxBHNilvVrQz3F9g5x/Ld5ucT/irk9hcaKuibK5I36r1epA3UpUPYVKKhteqB5K9N6r1SMKjaqE7UPtYZu1QfbNwDmLUkhKacjJCAJEGCe/cMvVwYHQCAljpeUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ea4yr25c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPuV0oNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ea4yr25c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPuV0oNT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64kLw538935
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1kBcTlkaa3mAzZi23GvAfM1tf3/9KWLYcQbFzt+0ow=; b=Ea4yr25cafdK0Mco
	XDPNPYgr8dSq1Blxe2NVxnn2nrsNlXSyGRZ7tjViD5h8aRwPyNbIevZIgdkf6zWK
	0F7JbiHdM2T/R8Jl4o5R+9+egd5Z8t08UGkUnWn7tU9SbjUNxDbIJQbNDF69AHFt
	lGomLagyaO+BsSL711twZvfVeLudLkGpYddo/1JeaNIV7yXWk+9H8lmEVWU/DVue
	qM53RsFx3QAX+mRbHwYSy+cGRO3ol99n9KO2+/Cmug0Lw3Vby0GYRBjiUtvT5aV9
	nM07K/OlkdUHA/6bv35MDQbEaXesyI3Hv2lOZGuVuokqg93jIDXCMmrFqQrlidhN
	R4zuMg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5n451-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:55:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a081737bbso46295806d6.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654945; x=1774259745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1kBcTlkaa3mAzZi23GvAfM1tf3/9KWLYcQbFzt+0ow=;
        b=OPuV0oNTNO1Lbaqauyg8ZZjTE3JZV5dt+AlemFZHBaLh6UEDqzWKq1U+Sy86QQ68q7
         THDAsPa4CGPKEGn98P6RH3UNxm9auYsZrTwzZ24IIz85Bb1zeGCJX+lJXwTRpvgHHhxs
         XlzE581BdGlyoXmK0Oo5IdhGyHljYM+T4pZbOiCI9l4b2d3EpemnsQdVkWh+t0oiq9v4
         HFWwFZSFPKPKoPMl8XQdHVjGD48Shm0o488sY6QmA1zLHpwJEfTSfqvve2b8eneM8Vlq
         Y0vZt35uuJAXLxJlj2lV2GpxVf3bslDcldxdx2r0Vp7ZNNsW9cULvQ8ppHyGA6d+NZcY
         BkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654945; x=1774259745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1kBcTlkaa3mAzZi23GvAfM1tf3/9KWLYcQbFzt+0ow=;
        b=HhS6CCV7zOcAlpM8D3ZrCgzWCTU9gKGKHODwHbrjSV5rXRR4rNnBy36cgNvvjwNbkf
         n8i3/0y90//xgqZ7aPzD7RJs+0bay/RRaPqcEHFkgDbJSBc0gRQUW/q16dWcJxM4FcU3
         yTrUQQg8N+MEopMAMh93QY3gQoj3/UAOQ7N5lbEPXV0S8s+Z+n1j0++BZhb02KhU9Qbj
         nL6/zTw53ywt097qDjKYOcK+eahPjSxqM6uMSFWhPMj+//cuTfTPvXUtcDHDuIwFIvlj
         PEUwwbPsEztkQOQqr16X40NpwMuw5n4+Ikfe/BA536GkA4bBGkRoypnxxfJO4lEvKX4R
         iO+w==
X-Forwarded-Encrypted: i=1; AJvYcCXDnbPhecA1mLZj3FGDOxZZ/loh7fbSyiClj3wEpb4g/TYjvmyyBWSzW+yAbcFO274J+LjKUqDKBzbWBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8bSAnJ2xPXX4Fh98Npf/GLLZ26ztbu96XLAYzwzCrnvLN3Uq8
	d/aVeay+frJ6954ZvtWTUki+O2Zw/SB1efsLsRjyH4sCvAQyrSBDVsSI99pQwC3V60YknsM86x8
	oBB+lbxyAjR51ytEMJiizkz4RCz5eNaRnRoQUu/22WpBUAIuUIqSQqfQ85EOcdkJuUg==
X-Gm-Gg: ATEYQzzXCgYcb1qO36I1UrbnxvEYvSdiwNUo6X3ShHntF98i+eB21rh5Z/anSbj848o
	SbF/iczpnx1qj5xx0//xcILU8V2KtTDoHbEod4R4Z4Q9R1SnipXQFAYoqmH4e6H3KnR73K38tpA
	/hTGm45hOzKKbV2EdK2OcZ+KtXils/iisP26K9t+yr5FASqAdUKCSc1Yxs8Z6I9PDozmqkQnCA1
	dU/+FeUmiCWSok+Pe/u1brVix6sxXhNHB0c7zMTiQ49c/FuC+AYqX+88p+/xDQdUfOtwW342eJ6
	WyvDqi6LRdTv70Y3dMsXDduGvC+l9VsInhtK8oSgAPQdBl19z+G9O6t3SBndzIuxwqW4YQ//ETi
	2qC8oQCYtNLwmIMR1HvqXsBI4rsyZkFHQTdSQXr5jx/Eln9eZk7DdQKZPO/UGATCpkXy41FVYxY
	gXkck=
X-Received: by 2002:a05:6214:8101:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c51d024b5mr24192836d6.3.1773654945111;
        Mon, 16 Mar 2026 02:55:45 -0700 (PDT)
X-Received: by 2002:a05:6214:8101:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c51d024b5mr24192676d6.3.1773654944719;
        Mon, 16 Mar 2026 02:55:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97be126d3fsm139622566b.18.2026.03.16.02.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:55:43 -0700 (PDT)
Message-ID: <d2fd7358-fb67-4a0f-8166-2791e5c3490f@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:55:41 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: Add Redmi 4A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-5-897f130786ed@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315-riva-common-v3-5-897f130786ed@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ImD7i7TlY1JIwlDe0En6pJCT6A7N4riD
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7d3a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=t37Vj0VEYoQJ3GWKtc0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: ImD7i7TlY1JIwlDe0En6pJCT6A7N4riD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NiBTYWx0ZWRfX405smo48F5vj
 TtPy1LNkh+bznQ+DIb6heTGD/SZaGDoXYbKvKmggKfrmCq3N4LU1AP5tudEZh+6KJ0wXYQn8R4m
 BjiOynn1+Ru9LEe6Vz5nqz4Ta6Fi2MDm6Dzl/QIGfehvMXZtwtDo+Dja4URq/dLexGYfYciiaz0
 XDM5B5lZJq1ddJ5LJGQSXLhtN/Ioqr0Tx+TOuUvtRKNwIeyzFaBqOnWdIHPFUL2uW4FZBpB7Pfj
 LHXqprjfwfuPVwU2Yhk7mY/2f5zq0OD3fUz+V3zeSQCn1oFtn0XLOjYp1T+mXG36v60Gf22pHpt
 ZFCz8vCB0mFKcjPlRBvEPggFgllFPilhgncnohB6KFJLeOqbpCX6rh7yWOMYkPit5v+WCX9ap9j
 4a/aNYnsysBJddNgooyEMU7GH/DVp4Hw7muwgLYao9eG3eXHL967iEkEcLi2grMiKXofOfmltWK
 Smu/zdjNOPZvfsRHs+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160076

On 3/15/26 5:26 PM, Barnabás Czémán wrote:
> Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
> fuel gauge, different speaker codec configuration and display.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
