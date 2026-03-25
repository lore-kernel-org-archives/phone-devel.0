Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC81371046
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478414; cv=none; b=UC8YUZn3IIKKWQCf4uvbG0aHZ3WlJzFPo11Zf06ifb8khtJsuoWT28Lj9hhyA1M5JBEBCF+uu3ZbtWh5p9ZjVXpegmBH35EtieMwWy3wMRKAummZWleXgaVzp9KwskPyUZ9cwidXz1ihJRu5SmOw66MhjaqhlT6WCzcAiKUdh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478414; c=relaxed/simple;
	bh=NAIvZ5890qoM9mwWteWIr803n+3j5/tcS32M8qZ9hfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux4AjhoUZkkJb6zH5oIKobzPPMbUtDMMLwM+mXmkdGC5yh4zCwc+QXAWaUwkEL8BXyXhhIeZp3ruSjglJ/jFSLbdiFKJ0YYGmPKH9v4DOeCKqVD6Yroz7nLrGAjZFDULM6aWMOxPfncVU6LqlBqi2VVMdDH1nbTN0QNfY0YNmxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icNIGBoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUkPOG7F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icNIGBoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUkPOG7F"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH96T2737603
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6kHbTlHvPKo9EGAJ9UfTuO3r
	4iOiLGUngfwomxp+Agg=; b=icNIGBoA34jsE9qveWyXRJKcx4bYvbXbp9m4FzGH
	I5HeXy4IAj1l0uuG/zLjMpxVV8LjFWqPXi+3J5QvGyLLBGX1hSXUQ7TIoKG4HOFn
	wkbIZv6IzVf49ac6t2t6Qkh17iXfuGOM8vjNbNGW0wsppTdYLuZk/BOETi2cAgoz
	DGusJktILAE3MaCxSoWNXGO3OSsbu1vLE3bTfPYcA+JyHUm4AC3h2q7fLNlAA8OT
	Mia4GY8icCIAmXHQ8ZG3XBqXoWafU12uD9SJbtflbV+Tqrob1Pu3n3+VIcbjeP5O
	7SvRknX0U+ifQ0fxp0OCHj8jJILSuYIIt6yqOTAZlMMAAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4859bvey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:40:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090bc4823cso18274541cf.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478410; x=1775083210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kHbTlHvPKo9EGAJ9UfTuO3r4iOiLGUngfwomxp+Agg=;
        b=GUkPOG7FUi3C+S3WtxKWjpFM/8SS9pQ2ipoO8cTTfE6GgF2UFVQYZ8HAD3Vv7dfrtn
         HerDYNFhAq3aB4LS+/J79rhWC8UunA+h0fyybnQDm9epNE4O8ruOUM6FWNfyAd3R0ogO
         q03+xOPWZpKgKtgCMuYiIGWXVahKOc85mD8gIS209sbMMl5/QpTGGm63QwhNHOEI6yFl
         FjvP7ysJDh41lgBlanqRKS52zx6OdpHy4gjkJ+Yt9ieYDWAPMiax6z8KqYBZlATMe1DF
         TZ/ttsY7FOj+YVuo4qODD1mFMfwjki/iqNnEuSg3zC6MlTMTdpHfwKBqvgkgS4s+00M2
         vatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478410; x=1775083210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kHbTlHvPKo9EGAJ9UfTuO3r4iOiLGUngfwomxp+Agg=;
        b=cgC1vnMUFlX7lW7kMGZd5k7zQNjrL2kIGbVpRVoAqZqbHQAfY3987ocY3W9Rae67ir
         AvwyvGgHIpFRjeX2WwJWmCiL3C3E+pBBzWP/4qENXPc0XPmn7yC0qBe8U8P9FW8vfOIY
         akW2a7/8YiHfRuHOYgBqBitexodaGXZ/JCBP4a/0SCQ+wXpoy0usds31btrGN0444gBM
         7VL9wpqFxtA48WIVeoPMETmXrAWdM8zZdoFN5268A4TP5SmrVpu6SI7iRsX74Hd6tdON
         dXFLfS051UdA+aV+quA17Fk4jL7QPsAADlkPWoIvXg8t7Y4erK8/VrGbR0vin+4Clcv5
         mVBg==
X-Forwarded-Encrypted: i=1; AJvYcCWTurO18lgNx93J5nnHJtdSIOk7ZPIiF2eP5MIQcXUeFC4DsfE7Aa42FZPJMVxMAGA3OmfZ9jtcx61yhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNbb7KOzejdCsBRRVGsWrrRIe4RgssA4c/Q594Z6/HnhLO0BY
	Q8BNBcBkBrVs+MZYMmmqFqjXPYjrvwkPFlVl7PlVcaeVnqzF853T9aKnpxF4w2wnNTlPO/PnXmS
	Ga7S5fojxPPlQta6Zs+Nw2ym4k2nqbSlO+HWeKHwD0lxeKmsLeI+ZVGkWz+3SRJTzHA==
X-Gm-Gg: ATEYQzzULNHXG7/BxYs3kSpG70IX/Qlp/vT+fDeFHZ+SS//nQQtTLRezpQZcpWvEVD2
	0bxwY6h8/OczL/dp8syYZKhILwDbytYX3dmfev1D5OdAPa6+s0vcfQe9oZ4fc+8iVBDg3/3sR3C
	565QliCBN5vt2/5chjDN1+L68TQCIZZa9b+oIy8wnMNiYtqMxATM8LQ+I/vonyWUKUxYrcpvHNi
	RXgupy8ewFBO43P0gGa8fe0ZzaZv6y3B0jcK2Q6Hesu7W348jW8kuLM0jzOPQ7/715aUyVTAIaf
	RwHmyBii5srNKYm2yyh40gxXAcyazb4FG9b8+rqoSJegare59ZLDN7cey+AS3W2pGCTnhHTKQbU
	i0xUSLMiVk9BhBFY+g54LMBMXbf46ZitPYrQoUEGJ+YYC0j+zv0NrO2TRIMN5tbWHgLZXQYyq4M
	5vGXFflM6G+zTROwodDkvkYiyvSIb9bc2dTZY=
X-Received: by 2002:a05:622a:315:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b80ce9d96mr80324361cf.21.1774478410241;
        Wed, 25 Mar 2026 15:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b80ce9d96mr80323861cf.21.1774478409750;
        Wed, 25 Mar 2026 15:40:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a06a5ca3sm171455e87.80.2026.03.25.15.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:40:07 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:40:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Message-ID: <5nnowag37qecmviblilfdou4sbh6ogk352gldrxgqrtwvil2ra@r6uytpwzxcbg>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfXzaT2J8aUjNzk
 mA3Jdoa12v9Lq9ZIS3G0abyBIulBeXyvj/rjNPYQtpqr6U2ag9B4JgF1jK65D7E/bHoRfq0B8Vz
 uPcQBtO06qcGOyCHieRVJQam80KxhxJo2vOcTQ49myfiSFSQ8fNTP+6+WfsQLOgHb1I7OiMks1j
 rYQsuvXq5caB2Q/S/NBiEgHE6bVbBr7NgrbCS0YUxG57JcsfOSUs03g2vVhPD/8q8RuzDoojVXx
 9pZRuXFw2J/rtvn9oB6yWsnKRBqexXVfI0B/6f+DP5HajEbB1Pb8+z0fJCUgkDqvwTLHxQ77GNy
 BS5sIRopzVzhfPyeKRn9ZAtbcbAcITKJzzPtZWms6vgt7cLYVJFqa/RggkOEtTrgSU6gkxxkdmw
 HDptMTPvzDQ7mrwhha7Cti5aqrd3EGnDNF/76oFIkC5nkYfNYndQH6nkSiO80DgDWmci25c8Ajp
 hUbwuxa253AS5PFjY5Q==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c4644a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=H_3iQ2LuRKvP6GoHn7UA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: a7Z-DYDXoRaDJ01UQghjpqxuwj7rd-H3
X-Proofpoint-ORIG-GUID: a7Z-DYDXoRaDJ01UQghjpqxuwj7rd-H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:25PM +0000, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
