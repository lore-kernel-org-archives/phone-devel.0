Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378B838A707
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142084; cv=none; b=BQxWfkz17Lm87Afn82hROtKm22V4xB4BQkAUvL0M31+DGcDwG6jaIz8SWpNibD1kXAEvccJXGjKMruD8IC/Bq5B9qePxZTkH2G6CUdAeJgbw1Oed4Sn0Vl1xQHV/523tXsQIJjcLq1RA0oZbtkXw1twvgIJAJGVU09BScn6dlvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142084; c=relaxed/simple;
	bh=oeit43/noQ2g34pqMj7PtUuZKj+45nXsjrICH2+p6Uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+Hx9ma8/c6v1hUgFbxXlQesWJC+Q1LBjoIn+oF5hZkix4yEWj4cUsGnBIlagYzXzH1vCjNCXmRNloHaB8NUTF/Kkm1gruqcQ1nt4A7fggm/DvTe9hyEtsv4YNx54oBnFam+8YOdKrNj2/hwAIw1Mwx5s4ChonCEVprLon9GXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU7zo3nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBqjeAcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU7zo3nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBqjeAcG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABEbV5568755
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+yPSoOZk6Bqu9Ld3D/94jytpoG754EO2GFj1PLE2VDQ=; b=dU7zo3nctFM3hzOg
	zlyrO5me8U4OaLoGduvt4qdoX6U+Ehne+aEjfe3ipIGBLEJK+wM0fqzDIzOlWyTF
	YnUedblx5zCXZlIEum5BpRWt32m8H2dwJ8xb/MuIRwAPRizeJkbqmlyfw9hNTSGC
	gZxoHFzI9Oto53srxuUmiF2+g3YWluqervg7Rb1KOEOoPfb3Tq/U4gLMlu0Oqtk9
	CPf7aKJXtJ3w9abMFZRV/q49XOPcsftkz+qmvDEDHb9r3Z0VvFRzE9BpsRzfGD62
	4w+wFOf8bShCrDsFwGy4YK1DslabruFJ9P8ZN1G64+rDU4jq3MDlXMHT7F8g5gPm
	PtbiKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8h8e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:28:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899efdcdb70so4271886d6.3
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 04:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142080; x=1773746880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yPSoOZk6Bqu9Ld3D/94jytpoG754EO2GFj1PLE2VDQ=;
        b=kBqjeAcGO559VRfDRi8IgBJC6WF8qhdoMLOhx5gMiPocwWIqm8Zinc4ZCL+E8BHz3F
         JYNDL1WQSeczmNz9zr1myJKaqBh3TJi7WvmhXfAIs3Td6kKPzC9c8dFwyLRb0Qn9mRXL
         K+/W+Ywdc8WMCRNg2dv0dD/BoEL+FP8TL9d1cs/UYWxZYgCYJkeLMOhSbfkCJF/beCQg
         sAxThASkl0ifNaICqiFBkKcepyYLnuihMydlADLgVLNWrVE1rNi+BKP5KRNO60nr3j8O
         KDcM13bCFj5tYExhmYwouXqSVcEJ43zx3USPq8MpuZDWLDaE1DA6XwJJwIWHyK0nxUrt
         lAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142080; x=1773746880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yPSoOZk6Bqu9Ld3D/94jytpoG754EO2GFj1PLE2VDQ=;
        b=jbcK98Kha8DoQCuDSU8zZFhVHjx5XqhPQR78lGLvEYztHMm5VIZu2WWI8DrAuOvxt1
         O1RUrjsrB8ANFVwTJDnB0K6m355txJgndDwYi3AWkbSOQ0+kzm7+LIP4OWWmzbmTTWtL
         ov1I6dhTYWW0B2ZEiuarUdzkPvaxjXO2UAjgX6U3ThswzkV1rLMqOGe1iqCgiBd8VF5f
         A4jvNzN06+sU0bpaxodGNJ8/KN0plIhJJZM6oUDrPS/nNudGs2+QBVWGaYiSGqDCwzdx
         cE/uZZCqzYDQO8CJLxC10FXF4AaanJq/I0DI67Os77wTtAiyu2MrpiBWMtuUBUMW/yaC
         xdbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5MOasA31/kDpu2462y8IXjACY1Tg17emuzqnrweETgzXK0CnW9bbiIztI/LGi1dYIuiV56UcJn77HlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/yIFHd8zMOqDsEVj8hHuQhZysZ9YFpM2xquu+wnJQYa53e12
	Lpi9naEuXo/SZtUdgWyI69Z4hll5dXx3Yay8V96ur3aMLFMnXhcusbUQdMG7qEl5raGaRuoObus
	s+Z09/d0PrdeX65tS2FB3prcpdkcNbmEsllFzG5KgwOUp81qyoIyKkprWXV7dIWZawQ==
X-Gm-Gg: ATEYQzwR2TXzKoJhkadPM1qxq2cXXIuhGy0VYIMMOFOLDEKQ2lr9JEPAjVu854Gslxf
	IUI0L+hEvZIRbzSwHXeitR0ZfLgY2pSLlYGR/tyHttEW7Sawh6B6hltV8+GzLrU7R26Ba6mrFXz
	llswMQWO16HeAqVEpNGxtfSBVlCctGhT1UUqpLNK81zuhmcRaJhP7xS6zCNkdIV9J2ImHGHoaFj
	OPTa6tCSK1/uvuCqodht9KWSDsPBiYO2eLpkySDYoF1pXniuTNhjOk06Wly/bRb5AumBn+BOM+c
	Nq0BoqcD9BaVNBZlUaPh6KG/SUQ3em/JWR0xTDx+53RPdpMVOUK3BIC/9u50uS8aW/AN7k7ILFQ
	fNyuV3fBbTbuflBby+EggaoMQ6PU97Tza8Izbgi9yOfJ8+L8KFisvG0jO/gzZIyPEyJ4UNJgQlg
	GNYkM=
X-Received: by 2002:a05:620a:890a:b0:8cd:7271:65e4 with SMTP id af79cd13be357-8cd7271686emr1109673385a.10.1773142080650;
        Tue, 10 Mar 2026 04:28:00 -0700 (PDT)
X-Received: by 2002:a05:620a:890a:b0:8cd:7271:65e4 with SMTP id af79cd13be357-8cd7271686emr1109668985a.10.1773142080237;
        Tue, 10 Mar 2026 04:28:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b7dbsm458129066b.24.2026.03.10.04.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:27:59 -0700 (PDT)
Message-ID: <d92f942c-ff87-4829-bd21-8b37b4fb2d1e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:27:57 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OSBTYWx0ZWRfX1dv/N9+qsAdK
 X7SkjfhVdYKCeUnD8HUW0zP1NxjioYTYIO7aavx7eBC2FXrrDreCYlcSvoynr2/jXEB7VvrS9E1
 MPA1LMbKeTtiJq8yopdKsbgaKzQUHZfczpvLXA4XE+ZHq4KWgV9a2GltQYVpbcvE16QIX76JRaz
 AdVR+TDCtf/PKyTDWRGt05igGZv8DwY79xEfufX5yJ3FpGBrD+4T/nT1rlfgTFPyWq6gwydSiBr
 FX6JtSDWHaCLV2iVtsomW2mqSLMcuzplq9E7lvxbUiJ2j9n9mPNMbkp7rFd4uvC5PvQD9MdxVAM
 odN7k5ZvGqYNNQEieKiZQRIgt6MFYW28yDoLIWwaBjVmSjSsbPhu7HT1qhWOkDY/XMjeQ+9ptFQ
 3Y7dNF5M4sIL7mt/3q0hiJUsnCRBfR5t7JwJOp0hzZBSTcIDX8a5Bdh34d5iX/UsBAlOXFD8b60
 8aEUop2c36Ad3fwQxtQ==
X-Proofpoint-ORIG-GUID: pbtZm78QYiJe49wncUzodAEOzF9szdtb
X-Proofpoint-GUID: pbtZm78QYiJe49wncUzodAEOzF9szdtb
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b00041 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=TiCh2U2r927ZuiwL-uAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100099

On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Configure and enable the WCNSS which provides WiFi and Bluetooth on this
> device using the WCN3660B chip.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
