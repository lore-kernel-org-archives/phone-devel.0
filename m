Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210B262FC8
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857626; cv=none; b=V5ymQnMDnz5E7448IznrOl37ZLsNI8wywI8UPX9e8WPXaHT2UkNPpLQMMknQdLYYj/22JDbUxRILI8GFCdkB7ABbWZ1nZQubIRQewmS0aqjbucduPvcyUHbyzAgqCGIytYu9SCYayjNWemQJuCV7DC8vo+njnvegOEwFeEGxWN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857626; c=relaxed/simple;
	bh=J32uwR5PG6Pj/fkgodkU8NToknBPtoDkFd1PmBMP74o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WL+EP4pFnl6kXXAZNcvx7iaDujf1g/vtksM0hUP6lUd9WPvmsb/a96wg5n3JwDx72hIzXO5vGFOGSiBD89KDe7zMjgCSl7+lWIZDkOVcB7pMrwh34Ja19Eu/78CmokBdR2zy53MYXuQBldbzLpQ01z51YsIEIfrMZkUNCd0Diog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmEJCt+K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmEJCt+K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAtMfP027754
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 13:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Wc6gS//yAoCzSiP++Qy1pCvIWUQ0H5tM6n71zaADIw=; b=WmEJCt+KShHamXWM
	DwQtRpdWj0ommS/ZUnTqMILSd46G8aIrPS2dHbUNg8QsD6ENqdrgsppZUkf1aqWv
	/7tukxP4ubFmNP0/A1lgRMc/0m4HrWcMbQlwVrvomLcsaFw42o198fZP/biNGa2D
	XFGsDnCLYsKEgBCn8DQ8CdnNciMy1R+AD/fCOtOQHAFPj+A8kJO32k+2vnP/YydC
	H/s7Uymw7CFZtlbvmaLzFt8JiZCl3aPu9iufhwPQh3nw2F0y0pWkRShNJ+I3tsWI
	JHP73zuL+ytXK9cJHa3k6RWj8+cQ0CuWYtvJsbnHWQLt+Keq6gHljgBeiayDY8lt
	GycS6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26a7g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 13:20:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a517ff0ebdso19678721cf.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 06:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857623; x=1751462423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wc6gS//yAoCzSiP++Qy1pCvIWUQ0H5tM6n71zaADIw=;
        b=J0TFHTaILGG0GuxO+98PTBmPhlbSEl47jlmYrcSnNGSKQR5EaPq6URITUWc93ygwji
         HIW/wHwfDSvAAiBC/cPaUJowkqr68VNfA3gVJdgnpP5wxZ/vzi2HZoOYuMIhFcQeAzRW
         DvkTMyUzGe4Mvy+vl+EYZIwyZCgHb3RuoBdX2su4MW/mALE9aKJeN259WwKywhE7TCZI
         13hI5sRxJqiapT9fqcOHMWHKFiUp6bkLpUeFHg+GgcE05/9Yt8V0YQijcGkk7zW307Vv
         uKT1RvVfLYAURfQCv0JKDeOyM+4ESyrBot8iqUZ7UVYKDtcepoCVT3JW199f6K98Q6ds
         1Z+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmeeFbhx09nBhwgh9D+fS3/vYRSFbHrM+9teiyBu8QdYA0M5CV+4V7QeBW3+bEbIJ8ustIjqWfgFqYZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxemD5IAaZ6OpeVK+ROf96/N4mbGlMDGECGPZhXzdPoT64vdJRU
	syN/h66RE9pLnpCVvOcoVUbVnx42+fu5/N9ch/GKfH1A2OQIjxfDkBe9Vs93EwoSDacbMcf7Lg+
	CwrIx0gj9Qz1T1NpxH0VL39LV1zkIYkZWXa/FqDwlBBmYcHz1fTmumrXtXaSbVOiKwQ==
X-Gm-Gg: ASbGncsddm8+ZB/eafH4yqLSznMUu0dqiLmjxxpPoxHoNHXSGlt+NVR+o6kcdGayuuW
	FN4kpABrt2gK43+qQElkS1ylxXL9/Sn/a87g9rbHzYvEcDBP+vBB9zh+5qQn7Ff1gDMdoz97EP1
	tpih0kz6d6i3GdINh3BBOe1JSwoZm1EPAKCkTi0SrrTK9SItSaRkqCe2uut7NSBxWsbSYuGYTbC
	i5f0hskXN36SsDiS1a9V6E0rKBohLPcYy95XKyzQ5n9PdCgWDj8WvcByUTU+PFxLoCJ4MRtC0fM
	0aIRRKfLJsgWtPiK+Wr4nax7TBisQrvOai16L45d8xNc8t4B5JnKWovLxRaSxh9AgicPmzc0cKP
	H18Y=
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr149810285a.12.1750857622600;
        Wed, 25 Jun 2025 06:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhWy2dsS1LyGigZ4Dt8bnXgAs0PhlY9HNqrotGcZ/DU5sSn6FMsWkf7WES+YXghkiMky5/Bg==
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr149807385a.12.1750857622105;
        Wed, 25 Jun 2025 06:20:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a06ed21bsm373251666b.29.2025.06.25.06.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:20:21 -0700 (PDT)
Message-ID: <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:20:18 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5OCBTYWx0ZWRfX58JLJK7/KRYd
 LjnSPGXGcpiCWiX4Vhvzh8549/daCKFgifOteKRG4ikQ9u0OMCpDVdgNRFU88y9gNKInNqEG4gk
 si2cvOHy8UVKMj6SwzI85Y6MLreoqnL3KIs0RuDxk7MxMfmb9wnWJE85z4nEF0lWSRKlXuPJr0Y
 aGdwTRp65vW1Sd9k0SJTM1RSgrw7DF3I0ox2kuHf78lwT6RMHzWi4fZt9UIGW4oIWAZiglIjglC
 34/lI6nEnHKew+bGmDDBKF3KOLkkfCKLp7EeRGtIbiwC5EMLhjI/yr1QD12s8v8YJ6QCMI9XPvu
 Z25rfAuqGt02EUU4xQYgVJDN2rh5+mttiHVqrnbPU7BRzgbAfgDmrXfxZ9RciYxRKboGHvTCbcr
 U30GhxizGKdRLxUfZtq9PI7H36Y2mFkC7Nb6qvqb28+x/Jt8bSGFUqqekmRt7GRAUPn6s+Lm
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685bf798 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=1Wqoc7Fd06vDnn7CWGcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 43FAJeDGWyThqSlPtWcPS7t8qiLdgbUa
X-Proofpoint-ORIG-GUID: 43FAJeDGWyThqSlPtWcPS7t8qiLdgbUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250098

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with SM7635 devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
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
> +		pmxr2230_thermal: pmxr2230-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmxr2230_temp_alarm>;
> +
> +			trips {
> +				pmxr2230_trip0: trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pmxr2230_crit: pmxr2230-crit {

This name is "meh", please change to tripN

> +					temperature = <115000>;

Unless there's some actual electrical/physical SKU differences,
downstream lists 145C as critical for a PMIC carrying the same
name

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
