Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE23806C1
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294807; cv=none; b=d/aMesph69VoRrZaj49N0iW/ZYx/LEtSztXGPR0BZ85f5qdl6gtQZKpmRLZlMgi0WJzEQgnIr+wLxwUUhEX9UUFuIKQVdbuYo+wNRhfx5So+qjRxP+st2b8nDHcWGu1C1e1wewc+Cxnq9XPA2BnTeoDcal2kvK/DTYeWy4CDmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294807; c=relaxed/simple;
	bh=FCF4q9qOJWS9NHXKZoBM8Iw1gaRRvlvQn90wrWegmwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jma6Nv6JrpnPpZsIWa0cuAIyglEsgQGANr5W2y7X5+ufWNMDzgeE6BBecVv9GD8CfI/rTizwbjO/ZAf2R8KdPeg5su4WKeDd9j6+M9Ec9R9abVUD1nPuSsxGgC5wHJi8U5af7CgVowSZrE7UYGQIT7Riq5pzQN/Lv6c9oCe7e5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX+iY9Z3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVL0yP6B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hX+iY9Z3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVL0yP6B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8YwJu3727114
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	815T0lxMWytul4mq7PTn7K3i/c3uKyORiv0nGB/LA3c=; b=hX+iY9Z3grFRMtgm
	amM2cTlj6Jn2G+wam16kjJXHFUJG/HqBRLt1OLGH1sKpsbKINAfg0wkLh/DyJ4D8
	y8uTTZdoNUA1NVCLmA3EeApUPLsKYP3myGhQxRztBaxmidpvsm8JkpqCLF5wnfKL
	slcUcI7WDNemjQ6bO6k7svLcphB0y99GuJVGPr42GJa089rEYZZABEhs1UjMu3lh
	1N3iHcbP8yR1hnJLwnu/GZLLQkPn56XFVItGMA/HkYjCn2IVCoP4pKrXjbdkD87o
	QYlptcM+U1JC2IDwW1qkov3xbyctPt7tDYJKLPl2Y28i2s2tjV+3C690FgQ4m9lG
	1zUMYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu02ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:00:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f357ab5757so26775211cf.0
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294803; x=1768899603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=815T0lxMWytul4mq7PTn7K3i/c3uKyORiv0nGB/LA3c=;
        b=UVL0yP6BvyK/czYpTwEOJGnV0RotpTHLaQqRXm3HJGgPnNvNLbhnS8/x5UQeKO7YoA
         jaAWyPvdIOy8aAQk75PS52lhexnN4QUl/DDUtnUOVR4La5GypHtEupC/Hdyv3snRMtQz
         PqrhCUo91pop1qsCZqO1xE7KR1S4biXeSSJyk+6QTNR3zYXwJzOKN7A2Uh3SPjnjAiUg
         8EymotSkDB0+jAVnzW0nC1H3mwLPOyrfdmiqs0K1qRgJ9fSxwG1B8v+mqafw5cXEE8uy
         ZsawxmkiaipIYl6UixyVfHqqMKVLbodB5L7KXphN9pO5GWZh88stNM6ByGchjuaVSy/4
         3U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294803; x=1768899603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=815T0lxMWytul4mq7PTn7K3i/c3uKyORiv0nGB/LA3c=;
        b=X/qUeyZSEs9w++sL7yrpg416CAqwX7+A7y+zK2Wn0R91dRiGrQ0pDhT5F/9RjCfKqc
         TaE5bn2qGS2dnsMO8lPRuRDCMQjU7wjFX51U0biOAAUfmPRUyEUL91lUGr2xhWmTIPzD
         liKmj0uKVipMsTQqgvCUWtKYP7o9sa7/ZybgCBEYHiNsF+ngHiv2ZqDCJt2RRmGhuXtN
         NuWjSORmdfpuZaW62gDo7Aj4y3wJXGtL1aOfSSCtmG0QUSMtWqoGzb0AnolmlobpNvwd
         B2FgTTAmycfVtqvEnZYBvrfCD582I+ktl7TIS03P+sU0rSDU64Z58wnL+5i8+3DmS5zA
         ji9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVuKLwrDgnEbNW+UAkXamsRWn5zscMTmKs2wvwjH7VKZZO5iPv64xngqlRdQv7TsHuY2P2mXzOT3A6vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRWusp6z2G8qLpOyQAZGUeqa3MdqYLXBoQ1nGoPkYHy8Vri29T
	IrFunjkuCFpA8pA/SjrRLSF5/O6a9t4Qf7Dsqdm5oXVpOBvjCMsrEo2kt1tbebzLuNSsGX7IzzD
	WmZe0f/zdDgdWC3CWuEBtc3HbpnNf+pmDPuPYZZ7bASzuGZxlR9YAgOLDH2puLPiLXA==
X-Gm-Gg: AY/fxX5Fz9eluKw2bvRKjwwDoMnj5ufEDrhNSV5L63LIOOkjfK63ZsJBe/1DYscbwsx
	/yrRhatfwbvRk4KcG6bxctg1bGKJnIOyHvFocCAe97JyfbZ9eccexzbcxwe2WYj/Rufn22zn+dT
	zT8u0OtjtdqyQ97SbYX38eCPQzqyNwIzd2bTxjWFHXSg+6v9ZVvJwLlKa/MxMufOyd+zAZquQ7u
	1oy3I1gqHlYkk9LvCq3md8uPSeaC1WsElYe91kvKtEcb9zcU0gAlB6LQBvTOxp740tqdqgzMBXS
	IovtSL6ugyr8MpDLILgX7EXQr84Rt0LYTcs/mdx0y6V7MZOs4l8tnSJGUxAR2PVWPFa/JjS7Ucw
	oJpWMOAacP5EvqgpkZkLITzbbmzzJca0tgApYQ0YeTq2WglS56iAh2HHyKV71vT3KYhw=
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-4ffb7544295mr214248551cf.0.1768294803224;
        Tue, 13 Jan 2026 01:00:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ8aGRfOzjpjUfk8j8SqmbSv/9Txkex+3v7i2/la0oLmXMS5y2aCzoIybMk3Mc0fUN+b1k6Q==
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-4ffb7544295mr214248291cf.0.1768294802712;
        Tue, 13 Jan 2026 01:00:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fee09153sm877245066b.29.2026.01.13.01.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:00:02 -0800 (PST)
Message-ID: <2853a139-8ee5-49ed-8c38-4951a8b03ed7@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:59:59 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
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
 <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: guGEV2kyw2yLnLFJ64wnmfOHFhB1-pZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX327djReugShr
 TT+KXvufjf9yJY4402dDI03aPPKb8auxIueiLt0P46sHEWnsXrhGkE0gw0Zg8+RXM7+j9C+gLoj
 QrTXGEZ44sy+RLNVFxnFFIAjkHhlxrbk9loAM8SDm9AtRez1ZVVjiXlquyCqskcGodqufPWGLkj
 e9ytjjjKgdOcKQ3Po3n5DnFmt191autjOAxj4GWaf0F4HlwpqP9z1ltDMmHS3/HBE8/mzqRpX5M
 JWz/6n/5XLDOTgc3NfK6pmYlSSA4x4qF4gyOeKG7Q/fLLgmY5WHPOSOHY+jdmnci7/lyn0DgR+6
 +7hqBLaK9Swn8olM6UUKlai3wA/xj9c92BtB8SiorB6WHnYvzo51nfVk86O1OIcoMWiJItHLeo4
 5bGq69S8K4jzoKgFCYPa7xBcuSqrHbBpPAlwhx60aTW/pfclCyoXOa2zDayUyIPEB9PPwWPZfeX
 fBV+Je9+HGiIQvqIKMg==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=69660994 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=4INKmz3kzACxWPG1-2wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: guGEV2kyw2yLnLFJ64wnmfOHFhB1-pZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> GPIO pin 102 is related to DisplayPort what is not supported
> by this device and it is also disabled at downstream,
> remove the unnecessary extcon-usb node.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> index 4c548cb5f253..666daf4a9fdd 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> @@ -80,11 +80,6 @@ ramoops@61600000 {
>  		};
>  	};
>  
> -	extcon_usb: extcon-usb {
> -		compatible = "linux,extcon-usb-gpio";
> -		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> -	};

FWIW

trinket-sde.dtsi (downstream for this SoC):

	qcom,usbplug-cc-gpio = <&tlmm 102 0>;

trinket-pinctrl.dtsi:
	sde_dp_usbplug_cc_active: sde_dp_usbplug_cc_active {
                        mux {
                                pins = "gpio102";
                                function = "gpio"; <---
                        };

                        config {
                                pins = "gpio102";
                                bias-disable;
                                drive-strength = <16>;
                        };
                };
reading the blurb in downstream's gpu/drm/msm/dp/dp_parser.c this
seems to be the select pin of a GPIO Type-C mux?

Konrad
