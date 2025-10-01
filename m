Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9041275AF5
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307061; cv=none; b=VTWyz+MwDNda/TpbhfcdNM2ihNS31fFsKHUVpVH4E0RlEG3+XRQdshiHJs9lLWTvtpK3UNFww00CrRrOpMKZ4Mwiwt4llIjeK54T1JbBzmM+Q64+bcYylJOn0beUak4/K8mNrVI6szIg5fXXyrdcmpb+AWx01aVyPhwy+E07VWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307061; c=relaxed/simple;
	bh=2C9amxCrD4gmuZzRHFFROYAejnvb5hn0iAbtlaA/Ujw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7j2aEEwNr+p8wP8hO90XZfKTumET6BNtkG0lJtyPWU8wQvCLcghjjXklGPRVC+slxkUfhelymmfOIqFWBRI2SCgoI1tC5ih5J9EiD7VYnKShnjGh1L3TJ2DgO4iC0oxUcDXiO+cKQChS2cR97itzrq9DaHvl0qUo7M7rXD8xZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDwGIaN4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDwGIaN4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917KfPk020544
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 08:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jo9b/6mPaEeK5PkbErgGIXrd32k0mUaxbolG0MoaK5s=; b=UDwGIaN4ksh9PcZk
	GXfb2oEcQ333hHiy4GgLWyZSIVW/irxtve1zYmAo+fdXDWic0m/jI8PlrmNroZFg
	miuJrsaTzjVgFo2b4JGjqEHIBanHjhyQc+FAsNB9PHfx8pqQ9qBaUXG3uE2oPURJ
	5e8idrwC9x+WFc2UN1K1ALTuKMaY0N1FVXu1RWrN7M1VSghlnUUBqISONRO1pHxA
	PYcjd8JiPzYh0XHSSQESCFj1TP6nPVdQtyLbXFH31dtpb08Vyk0dn7KqFmVLQSl6
	jo2/xvQnIcpQVbEej/+GA4nv1fdyeUCLaZ0d5QvxW0kMsHNWAdEFxxNqqDTudw8g
	4xPogQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu1850p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 08:24:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dd3c89ad67so4717631cf.1
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307057; x=1759911857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jo9b/6mPaEeK5PkbErgGIXrd32k0mUaxbolG0MoaK5s=;
        b=Zme169a/q7Kbc2ZehZYqMvscelJm0jMSKH8vsobhvWss0r+OHeV24f16uXw7nDZM/+
         1B1GAxF3zp9q+kgv6YHlFApKhDvPTJY+uJtZ4niO5nfDyjT9/2FoBc0llTp9MGJ6X/BM
         iXiT48uLFOWadxpidfFJMvERd3I2CvRuJCgZv51SOXwJdrS3usmSkTsQLfQ4DKqAJBwK
         IN0HjwtevGlRw/AFAYYCLWBpMF9caCxuGx0oyJYSbDrxfs/w6SLsZahFdNQxVaici2rq
         LX8mc3G+NgGI9xHbF2TEmRvbGEvfSEg/H5XolZsogLbgI8RRD8BDrYNZsrtCeZLtN1OO
         f/ug==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZHQAd0HHtZP8+Ly44bgI47xgxpI90tcltdq3mkuMjmY8PzBmGmd6cCkAsIwEBI9A8yZfBfcKTJ685g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywva9OZRBEpnK7oVRT44F6k4a6720NGfHNoR8Ip32qk3ZJNzM5Z
	gega3sk59XX560m2jiTOPPF3WpXlB7VTyQdZBmm4d0MY302g2HjJWqfExeu/iFHqsAUpZLG/cro
	wKdmkOo0sy8YTfaq5BZXU93Hx3DgV6wac57EwOF0v6yaLFxOeKbVXsUBX4EVSf7GlSQ==
X-Gm-Gg: ASbGncvSjom0zxpXfYzF7E9SUKBCD2hTBQeE9WkgfRIyPbEejABsV10+MecJypjfm45
	GObYrpmiPsgJJ9T1m0lbCS9+MZu0piHR3wpgANx44+V4RrYkeIHwO1v1HR9SOmYOZS7A/9jjXkh
	0+MWL8Vfk6V1GSBRV877rlo36n+uf+nL9klJveht1Qui0J5vYk83NZl2RDP2srXHl6l+UYOZRZY
	OLG4qXy0sNPq1N9FJo4xcVv607u9nLMEmSIMYwJCIhII48HxY3lwlwFn9c6cfmfwogDZbvbU4ul
	1Y2OCL3phMrY9td0ShxNCrRkFVHaqbvwKSAE6JjPXDClaBMS/O5TRW99UFex2TMSBN5aW+J1KSe
	bsw2qwZLonf1lRpvxt7RkshvgvUc=
X-Received: by 2002:a05:622a:1a0c:b0:4ce:8b2e:feaa with SMTP id d75a77b69052e-4e41c5470ebmr20268171cf.6.1759307056578;
        Wed, 01 Oct 2025 01:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4EwFukVUgInauIpgABmEZOY8yZJgYyBZcTIW1ccuqqRJmcHUXlbWU9gHnVB6KeRteTgKJ3A==
X-Received: by 2002:a05:622a:1a0c:b0:4ce:8b2e:feaa with SMTP id d75a77b69052e-4e41c5470ebmr20268001cf.6.1759307056025;
        Wed, 01 Oct 2025 01:24:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f772528sm1320320266b.37.2025.10.01.01.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:24:15 -0700 (PDT)
Message-ID: <0d799aa3-20ea-435d-9c56-150fea07aa49@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:24:12 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: qcm6490-shift-otter: Fix sorting
 and indentation
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-1-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-1-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68dce532 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Q9X1YL7jsAXwpJAzmCoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: srF4S7fZi9qrnd7FoA4nFlGv4-DhqKC7
X-Proofpoint-GUID: srF4S7fZi9qrnd7FoA4nFlGv4-DhqKC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfX3e1tokuCQEaZ
 36gxud3LEVSa4tCSWd5cJfHOuGTEb6UkXVbbs11YBVeC7++AnyxFUVm9LLkegkaN5Gu7RpCxPlC
 pw+ClkxZ9Hfr+2BjbkbmcxXLHuknaoWcckNlt6DSbQxHfZEvxcyP06Ds7m68Hb9TGNmnrz/msEh
 qZzeoxcIBlkZAkfrPxp6labaIuA46/dXAcZaf4ldXaIyNyaOAiZzoQ4/db/fKO/mGdMHzvEC594
 bzpg5CyE+VwVvPE2zqz2BBiveBmSLJrN1XMDBlkLPuJe1wBy3r+20dzfxFn7xtyIeMVBkQSy8SW
 RgxCO9pIeWiVCz+KGDXe7BDXCl3sSPEeHz5TD1XNsG7CB6tNg9sjwlFmbf2MAASH9XeWhen5B2O
 gBl600LXlp3Sv9+B/4WAoynwIiVASA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Make sure the nodes are sorted correctly, and the indentation is
> correct.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
