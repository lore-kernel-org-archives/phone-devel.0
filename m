Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6741E9B06
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 20:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744663510; cv=none; b=c10rdeknCHvq0ZYm/CqQrZscTstT7bnYLwLlvIGqJ1kCaWzh4yFAdlUkdGK2cfugeW6a59E0lK5AGCAnJtc3lC/LNohwxiSc7f7YpyUQ+rTbBgX7VS/2hkIOk/muZh3RlsD2F9YETphtBNqj6kbnNnmPPimOWI+cbBqxPVm/las=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744663510; c=relaxed/simple;
	bh=zWsdiw+TnJkpRWJoGIEhDbM9jVc3PLjahi1iBg9BPKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uW7LR2HcYFeQLZKUPBUDQTnLdJJvTWmEdTU32cgvAylqK+o9xSlgo9jdOG+JQKkau/UrKCh8KBbXYycyflJ9k55vmUmGaD/Rg6dkOS7vDVEioHky3bw+hC9HHDzpgTqiYtofexdArzIQWLcEKupDSBoXfduS/+46rNoI2x09jG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBxCIJWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBxCIJWE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKds40025778
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 20:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GpvC2xMf26mIWpkQqHlnNwAhWALEdfs8GLwqb4OfI8=; b=KBxCIJWEzDpTzj4J
	XjyWl8fUJsYhEsbotApe19vWNG1m0Yvs7M1ROZt8nJk3KhDcHY42mF/oxvQ1UPZ9
	YqAZf1nQ3GWl0r26lWtz8/zsBZqO7tSbFiRyV5KHmpdZOXJGzNkGfypP4TA2Hehy
	dND01cfjyEO5NGuwOieSKvNsS1KpqPE/ZuBpZiRTXKquifUmwGsMUheDJ8wyc8g0
	4g9BEWhO4vSGavr7e/V24EUFWGPKyJSGiclYyx1iUY4aIfC0MNUnRjEHm70jFM8L
	EjpHugjS/PPy3aPlKeHuaEW+RLdkCOVYAOvZ+y5KTAMCOwgQ5HFjYQwNJjIKwn2m
	qzQqFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs15ths-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 20:45:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5560e0893so35992385a.1
        for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 13:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744663506; x=1745268306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GpvC2xMf26mIWpkQqHlnNwAhWALEdfs8GLwqb4OfI8=;
        b=cIIdiDKZiTBFh8pn6FXic0aNwJATMK1AZEp5/eFUp3FcHs0qZz6GwcUzDjbtvnARXx
         SvIcxi/ExQ6xSGXLJ6MctMiUzkYlrSqFmqu/QBDdPIu+26TVd9ER+DPBJdCUT3pNINYV
         gz2LmGEYRWR8FJEJkzQ3bYiC0XiRADBIGiyHNeNvkG//+QMq5/80mtHSpFF2B9gjQb9p
         WinIHhgNs3A2IL48kRWIkQJNymAKep3xas3ae4NFR5S4T81boA4ct2q1/ovJgrZXVMqs
         Ul9rudDHOL4z64ynyhw7eoZxtbbCPgHzYVgJ5lPSSd/OWX38RdecFq9rvvnYBYkCrq3H
         YPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfLHpltid/jlndmK4vqkuOwj3Dle9julDylyCOHhlkbrSMfMrtouTju6QsDqr+XKb/Gj1DxUmAnjzgsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPz0CqjYwtL14GMFCIJQUOlEOBDIT6UIyPx/6attORA3aErcu
	Ljw0WMvEJ3W7N0yNb3nx9axXHjCWOgTND5XqPYF2XJOOPaKOE06RO+ZRCR4P9P9VnFTkrhvm7FZ
	pWMVH3I3j+2ypmCZjxZdTcdePSzV+K6ao2KYaB1Pb/NCOpDOGoy4Xz5VlUTngiA==
X-Gm-Gg: ASbGncsiws0qgXKda6FtH4FrHmH60l/tsfRi7aBr+aHuJ+tec2NW9hmYU4RijkLD+Wt
	RSIFRqj03vXleFooIppZ7l9X/XKt5nebzEUstS9kAkmFiZGmo7RMCa64rTOCBsVRu93rle5bW+h
	kOZGYfJTTu1gslh7r+oEtBYgo3jJuMTyS/yV7iw5p3ghiDhlwu1jf4gbwI2bJDrQnInhtJauNdn
	cOFYw2Ic+qi1zLHEwEPU7Cv35IkzMdqeOV8CDs9WheGA2XlL5gWl6xS1mY/N7RoxDu0jm19qhlx
	lRMMGFjK1O/71wT65z0srXgyv8zdM+o/n1BnlYkrBqXYwDyYJxgbrX0i3NyFSCW+Jg==
X-Received: by 2002:a05:620a:c4e:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c7af0d639amr601361385a.4.1744663505687;
        Mon, 14 Apr 2025 13:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLBb2WpVtzoAT+y2FmV5MGo40yUFAbGagDmJALFL0LsA+GecCl49y7VoJexczSZFb7o/nmpw==
X-Received: by 2002:a05:620a:c4e:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c7af0d639amr601360185a.4.1744663505264;
        Mon, 14 Apr 2025 13:45:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7fdcsm982525066b.176.2025.04.14.13.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:45:04 -0700 (PDT)
Message-ID: <c1672544-eb0f-474d-a975-2a4f6b29d549@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:45:01 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-6-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-6-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fd73d2 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=OuZLqq7tAAAA:8 a=JKK38O5rW3uoAxCGYa0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: mlM5PdTjHvyKEZaqZB03K105nUCQbvH9
X-Proofpoint-ORIG-GUID: mlM5PdTjHvyKEZaqZB03K105nUCQbvH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=888 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140151

On 3/15/25 3:57 PM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 3S (land).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +	headphones_switch: audio-switch {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&tlmm 129 GPIO_ACTIVE_HIGH>;
> +		sound-name-prefix = "Headphones Switch";
> +		pinctrl-0 = <&headphones_switch_default>;
> +		pinctrl-names = "default";
> +	};

We've had a similar change lately

https://lore.kernel.org/linux-arm-msm/20250327100633.11530-1-srinivas.kandagatla@linaro.org/

I think this could be some sort of a drivers/mux/...

[...]

> +&pm8937_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};

Please also unify the style such that there's a newline before status

Looks good otherwise

Konrad

