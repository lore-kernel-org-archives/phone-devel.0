Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475EB420862
	for <phone-devel@vger.kernel.org>; Tue,  7 Jul 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419385; cv=none; b=SPXFAqcIFm2+FU3rq3SiF/tBq6evnSjethf4PbHV//XGNigOIU2F9K6j8twfb4SO432eTbnEqhQiBkX+z1C6bxhtx3PW8B1Z/W6wGNuJJ3mNJlGTP/Jhr1gRSzevAybmwvdp4DxHyobXSsMbayleOTQnJ1fB6wkS7LcQU0lAXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419385; c=relaxed/simple;
	bh=Nol2MBFLiaw40O8uQ0Z8ousJfKsgyK1D9m5fxsVh8E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8/1OmxuUkuXt0emou9zvZjvEAm8qLJ0ZoTNpCXpOYIYY8r80GKLSCKI8W1DPwKLe6fT+yWqcvuN2iwvfuydYutE9rxmMPhLpGQtvugiLdC/AJ1nIgGmon+nWXtOePKZtmPChrrmNbXrRMHfRIKqgrv5woBeW335SlaZwDtrxys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYoHJ2gJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4a4An5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYoHJ2gJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4a4An5E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DwEJ3070376
	for <phone-devel@vger.kernel.org>; Tue, 7 Jul 2026 10:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=; b=JYoHJ2gJXK1AWP3E
	ikrG4NbbsYHW6Qn3Vpqn/E34l3DlwxKePDQ1Y1ePCYeXUuQCrRvjCpZcyKXXYRem
	gB9ou/O9eptfed0y0Z4DUQTMa/vrX1GJryY/odwOHM1wQmSuVDgindjNEGZuUwgs
	p06gWovx5kjv+dflKSk1+NkVXSOCnPUyNugRX61sK1PfT6tyhsZ96lmmhcuLCalO
	nK5pg3ZX9lGq5Ar89TZCgBKq1acuoXP6g9RpQAQ69mjbWvoh8QNaBC6AKXSEY69k
	cSYhyUid9itC9Iyg/RqNMSe2zSJNQNoSRJge7wwLyBm1qgYX/Afz/rHo2miwpIL7
	1yxx6Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8hfj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Jul 2026 10:16:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c298a1b20so8230401cf.0
        for <phone-devel@vger.kernel.org>; Tue, 07 Jul 2026 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419382; x=1784024182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=;
        b=W4a4An5EgpxXUs61sYUTrWcu0y5e5rMbyGyotNfUplQ5ec6x7by3WTATbE8fRfsLgI
         hGEMKVDiI13uaiu90Zgk7GQGUodIMCISNNs+uffo2TgUx5c7d+zBIiIS/hSDpHkRPahU
         n/1vf5fpj+aXgaQgwLx+h5lNHNpIpEJB2nvLJQ0lsIa0/nv0/wDPHHPvXFxjzeJAHJBA
         YiGO3DmUYsIiLR/DqSFsTTVgOnND9FdSjffsGgpNcBoHkc3Vpvb7vqtMqA5iL6dY0xk+
         AEpY7Tmnx+YVRY0oCPeccnhtmQQaGN9jdSVRchabedGDHuzitkDWmflDiKdd6J02rddU
         6xcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419382; x=1784024182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=;
        b=GPYOlY9nF2M43Ru8gYr+zIdlScL4ZiaqGnZZHJnDxhIt1W39uebB8oEItbTs9+WNat
         EpfJEDEozfnQLOA7rlTmiFduSzfMFji3Ijvkv73pCx24x1ILfpmZBHF/z+YyQGQz+ETT
         m7z/Ai2XCQAEoTiOFRRvVftacspVd+rS3amTmdHVi3eolHDkS4yn+p8aOg0cBA8A8e81
         bvT90WfpU2D3MV0K4ULMB8zzjysl8b/wI2u4G4TvGvmZI+kqBvb1+AP/H6Pym4Pay2JI
         o4dQ+kSFz+1Tt5G19vORSp4sf+1YxUYBcIwgmTuxx/CGvhQRgk4906hEuChyOR3dQ05c
         vNGw==
X-Forwarded-Encrypted: i=1; AHgh+RqhmgXnlmoBVMs/7eTpSJYtZOAvoNaThK7driWQ7K1L0eGpDUosQhxMFrAAZM+nAWilocUpxLLn3oBEOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6RePxZ5cS/cYr5vQ5cQlcmHKkjdLpR4N49Kaqxiu3k4/JQsg
	SXoA82qWntXcNBy4h+6DVvrRrqIQBCOnKxtL9EwBEWfx2gP6ubTep7hXNk754lUWbFMsWpNR3w2
	XXVEphpIeq0OJgafbAr2jE154CCckUuZUaEF3wH7hdaxeH1zT7u2SpztYicxNfX4PkQ==
X-Gm-Gg: AfdE7clNpBmit85UzDVCaRHT/qmbOwrER06bfQPjAWUcIA6icjKlT187hj4n1ms4+Nr
	3Sq62Ut6TZ/X1lHtuZpJL3KkuZnWzco9JTIeEk5KMKkmZO1PmL8LoANfRlUpVJpneJmS4LQZjgs
	WhX6WRyb/CyWKuXCpiAgh0Pf51mk+GRUlGEJns67iJjQFV/60swVoZ5Bs80kN8nyFNRjId2P7TD
	DgZtYaPIySJlfnPJtoknA1HHBz7/GSLxP8O4uSmkRWZmgvQRhOK6TOGWJKpZ84XYMPPCMbTwIes
	6UUPuu0JoV8WrME8AqquwGbgrpy8utGT4ZuqaxYLtU0pCleuxhO3r7WL9Y9WkS4zQWqNuQHamMg
	iFMlFRqAIQJwxZ/40cJSCp5A6JH81h9X3dcE=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr121325031cf.10.1783419382510;
        Tue, 07 Jul 2026 03:16:22 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr121324741cf.10.1783419381969;
        Tue, 07 Jul 2026 03:16:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm5807352a12.14.2026.07.07.03.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:16:21 -0700 (PDT)
Message-ID: <b2ea73d8-7fc2-43b2-a9a4-58185d937d88@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:16:18 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
 <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX0cR5yXXHOS+J
 Dub+CBcdi8/UxE4vt+QBgT5MeDgZmdDDj8zbhNrzbB17yVacggfhzrgoCBq8JoEOwr/g4gIL3aN
 1pLUJLWBThI9dxpoYD5fCdUsgb+g3Xo+OgJyrzP3Pgg4Rj+G5MY2gJ3jtCFRmkIBVuJ9rXAiUBH
 rOqoofqz4AxLRYGDUy5N40K6ppsS+HoYWd1M7wKLrd0TK6w33byiP0AgPeF8PNW6+zAmXM0Ax3H
 Lf7figonaHujG3Q+TQQZcsG6U9manHlQTRCFPrHbJ/8ObBAZLZD9WbHJPC5AsYHY+R6/JnMPiyO
 b5/6Lff/RXmza70O2gAGav/2RIOCyVUKHS09JpQAulQ+JNcFqW83rFBoRH/gesjrzSIVk/v+QCn
 3rWbytirsOILmM6AJxIWoCIwbc9t0UlvkHUQfE/nIWvqEKpzujbuvMNvVH68VHaDyKQFS4esw4V
 Woe8jf0o3xTKsF39VFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX36/glyi2F/zg
 G3Dfz15noR10Dfigx+VbjBRH8t9mSRClLhKam2zNh/A7HMxNTJlDGfOZNFgZr6bMLoD0yvXdSJO
 +uHNRlc/wNs/9EZfp+j4zxU5HMgjYHc=
X-Proofpoint-GUID: 5gMWgfPPIcSO1lWwADp9zDYe3dOwAcrT
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cd1f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-EjxOQQyEQsex0ImKKQA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: 5gMWgfPPIcSO1lWwADp9zDYe3dOwAcrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070099

On 7/5/26 12:30 PM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:
> - Framebuffer
> - GPIO keys
> - Hall sensor
> - Vibrator
> - Regulators
> - Reset input
> - Real-time clock
> - SD card
> - UFS
> - USB
> 
> Tested-by: Stefan Hansson <newbyte@postmarketos.org>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

With the usb3 situation going either way:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
