Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B2263F5F
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857560; cv=none; b=g0f4oMYSVV7aSLKWzsqfPM+8eOuU0mw+RDTcLf79zzaIEWYCTH/FqBA4g19VijBjq/chDpSUVklU2oX7Hn1jZ+KelNo39DhEOH53MvpyiJbhImV6qWXgq/Nbc0Vi39M3cO6OPfCiaidWleB/DMeYlDC9uWlDM2Y7d2SLmkH6Lgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857560; c=relaxed/simple;
	bh=OLbZLCeEIh/QhsKvBR05z93Lz887to7p39N5x/NgpCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mY+KNjdXPPytle1v5NdeJxljPYOhGVyR2hVRwMo7xld8rLxaM5Teys040UwkHU9mrtnsNlJ58o4lf/PvjC+WBuQNMCMjiYPH4fglkyxZ6/ZU3Z5KVfKJvVHm45HLF6GIagdRPwBWOljCh5s4OFoiAlDAP+H95AG/BGliRwLGVLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leSlgYCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leSlgYCU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDEmK3015564
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eQaxjKeabn3poKnIk9ut7d7cX6un1MCActTxh/vj5s=; b=leSlgYCU4S2q3GBB
	1lbhTVp292Jsbnzfu0mSgY8HM9o8ujQDXR2hA0Lr4FXdf1xNMALD5mzetNA+vDkc
	ymcLd2JH60xEunoIq19CPr02YjJgwkxcCdMy6HUtmBXUv2GEr5JFDwR8XG0iaiiB
	XWrw2I0lN3ZJHcg8MLfqhdk+QpWN3gk/vxZhYvrfv+7u+0HCK2NOZPNx0RS9vt8T
	5o7CFjYS4psQ1pzk01QmWvB38mo8lNG651C612lyekzXDTNq8wD3d+OLQEKcXObU
	FB5qcVE3hteNuy6OfEL3hG2RgLEpZP3/sVjJ3bk58UwNwvqKL4LdBEqEddJntp7k
	pl3bKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqpfty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facbe71504so13295286d6.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 06:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857556; x=1751462356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eQaxjKeabn3poKnIk9ut7d7cX6un1MCActTxh/vj5s=;
        b=PVEg51bXGisCrEEAwtlwiVovYIuz9nSZeltJ84xp7NauK9+e9++vEtKfmCSIn0zb+Z
         kP6GQGwDaSrEpKdfl12imt6c7seDErdmICpYEuWxGBZ4U8XxzwMqg+5Hbm+54HDCtyP7
         Wn0llTf2Y+OR/30S/uFv9FiDP1q3M4nB0+1tOhr8VWHoZYfVrTm2IhuxVyBq6aLNwIUe
         cepR4xaJaWpPljWfuktItT9VY9WjF3eAQl8o2mpENAyeVNQXdxY65Ov8IefrOkCCXEKI
         xoDPXq01Cm8Nu9dMnNI49a823BhXJewxyfEirdLgDzT8tS5xYEc70ycq/lU72IZSc9ZN
         Im9g==
X-Forwarded-Encrypted: i=1; AJvYcCVZnYLYyaULSOZVKDYgPT5kd+U82UxqiomLtneoZYKAnD6akmdn3LNds+4W2AUowmVJJVGsT7HvRNBj7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5e8ekfx9kMA3T7f3oT05vtUT5IQbtzjhCg5tEC5CtNGXPolNd
	uRPCs6vhYDzU+lhRbkdUaoT4gHeo0U89mpAjaeVdPMeKWM1JC6J7EGrN0XsuVbfzv4n5aWc5dDs
	+Y+WfEp3qT3r20Y2pSpT5HW7yrz53Gm1GOsbddIUs5j5DJdkLu+q6tcEtQh+dHAde+Q==
X-Gm-Gg: ASbGnctnyYeMJHmNtUIeXrjQdvKRxsD7O4r8viMVeh1RgiP4EaE/2Zz9iw+Id++xNUx
	5mStxWKyYCNGVUpRPowj9dApzA6ZlKiX5mZu9F5jhp8L3NKJrlcBjA12ShFd9uwFutW9I4oehvH
	MT26QeMTExkm3ONxeJnCzkxWf7F4nRoJkrONDj8Cy2qkfTaJIglc+jRX3QtoOc+DsMKs98hpEby
	XPzvnCD8+5pxDgyJyFoZXT0ObrIQhkwi13PyprGiYI11hxRCJuVs5StWDta/vxjKHyvBl7NLOxl
	yPb26o9Z/feCY4MwRDkh1+Dq/j858mOHGYeK3AYSLX0vcXf6rZHoLEeUXtUYB4WuqKj5l11IKX8
	RiQU=
X-Received: by 2002:a05:620a:8801:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4296eabdemr154363785a.5.1750857555847;
        Wed, 25 Jun 2025 06:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqGtKUmkLUVvMQx5KRJ0CRLAplizpPsb2y5iNrRAnX06UrCQE5yCFeuIbo7mZ8pru90VrR1g==
X-Received: by 2002:a05:620a:8801:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4296eabdemr154344985a.5.1750857550072;
        Wed, 25 Jun 2025 06:19:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c3ca7b8cbsm1919553a12.5.2025.06.25.06.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:19:09 -0700 (PDT)
Message-ID: <50fd7271-5311-475d-91ff-03c3c593866f@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:19:06 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add PMIV0104 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: THezN5aCN0SRFBXm7UqDUbXIn1jLq-6s
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685bf754 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=gG0EGFSrpznu9jIhvzsA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: THezN5aCN0SRFBXm7UqDUbXIn1jLq-6s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5NyBTYWx0ZWRfXyEBUeMxXZ6bc
 W+1q73WWRZSGGCJNR6GaJ1XQtiK6mgWeTy38UMZmJNn26TFQacz2JSsObZJ9ObaDj5B5Yrfw6jb
 Issi8Kl/jk+/EpcAHZi7aC0M69lDPugiBbaZLhodrhPTfRuKgBErkBvUV0K/Lrk26F5RrHnbSDB
 OJLzDwgWl3AVj8f5u3CelKbOOfO6AXzSalOQeOX/3QXHoqaqvO5ar/5rvGCwKZZQAAc/CXKnCgy
 O6g+z13ULZBNIzxH24Jsd0hhMFgZKdBZ4xuWLUo5rxcw5Gco2KXtkbHexr0BAEtPxn8ZFilkRAF
 PVVuQqVtXaF4p1rNaKqKKGDqx251CoTJrz4Sm2gh6c/rmRCdgbYWjR02hU+nAjolIqVFaLXxaiV
 0Ia1l6LEgoMelFMyBx6Nt0wJmskmjsvA3FuDScKBycQPSjAVggRgV5/n5z/jnm+TCsy6RsjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250097

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with SM7635 devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..04d929db76f409c49c47ef0147a3de568006973a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmiv0104-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmiv0104_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};

Please also include a 145C critical trip, which is probably the
most important one

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
