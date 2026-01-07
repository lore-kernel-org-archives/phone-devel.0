Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B4B285419
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773784; cv=none; b=tWT+O8OA/9rNd7nPOEJwzMsNFUob/h6u9MpFq3GR8FR8hZHXESHywHIoHJxyT7DBH6+6qb/y/Me1adLsQ+PG8woO9t2mNGXlzgGVFGINZNBdZZ3KCUDLXVLLE/pU0D0Xq0uw94z9b1s9owhh8HRAjwlmEIFDS0BuE1igb7KsROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773784; c=relaxed/simple;
	bh=b7llptmEDM1luO25/hrBZesC6P53tyMBBRiePAFHdsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV2k1MRUJkHSJ6UqCzq7+1XPcElxKVuTXW7Nu+qZeYO8d01gSQzI1aAgs2uf/jKG0hC6lkUQON4PdruPvUYzmgAa5jqCho49HMorT9ReY47dUxr7ir4MU0FNkI+x7N93HVLbJO791JQRFd6TW8D1mrxihoA0Oq79GNzGOafgedY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LR/cx1/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0Px4qEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LR/cx1/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0Px4qEY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074Cag0806319
	for <phone-devel@vger.kernel.org>; Wed, 7 Jan 2026 08:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yBB2cmx9lnK1XlQC3aSe2Jwt
	16yLObyrRqpkJZ/2ddE=; b=LR/cx1/gvwPOxL+YejIBsjQdZ5fGh8Rc8g+gWJRP
	2idfmcVoG6tvuyNsbY4O3kV7FHwd0ModGGhnGTfUUA911Dbt6AUotxcj3WMDQvIZ
	Jp5j/1NOpneX9sPFOOxWkCYDdINnQbTo7m9O5dDCuGmp6j4WbhrArhnHinmqznXd
	gUNVQ3vwk09lVhrMmv/Zan4Byt1V4Lj9UwSvIH6X5EI3bcmDq3/6hvX7NOY+piZ2
	q7uY2FiKBf9IvgzYJh2DO72xT7GzRnKEaOw1wpI0K+N9JiopDqD2bCC4Qg+y0SaW
	jofwXJgS0CN4jeeZqsPERDqcAJ2Y4f2BGmBxd9MG942fVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh7t9j40c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 08:16:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso1668521cf.3
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 00:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767773782; x=1768378582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBB2cmx9lnK1XlQC3aSe2Jwt16yLObyrRqpkJZ/2ddE=;
        b=V0Px4qEYEnaNCxlzZaMNjjlQeH2zBz5wqR/J8fc6WZCLgnZ250GS43rczKda0vRKVd
         rEossb7CmczdPahyE9IVueO9IO15/DReNWAGF6CHeneRWCgGOElhZLUuqNvfU3fYYB9q
         bZhgNw9iCN37CjiTIB4bR8Oa1GAzTqXwy2f7yM5j6lmUZZIggSbVEmiHKU11p654QOje
         CpKgfBcOf7zEZALdlCqhrMT6zCgNId0VhWR7gaLKe/oQt7yWZOo9ucQBVREomEEtm1sd
         wDbTip2YUCJZrIrsEGkowsQZzBwt0U9pLg0Z5kNIKO2cZpgtPubb0iVCoF9FQfus8AnO
         p2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773782; x=1768378582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBB2cmx9lnK1XlQC3aSe2Jwt16yLObyrRqpkJZ/2ddE=;
        b=u7fatk+6tWLzbXhYTJBtfftbtEcfB/moos+3BTqT4OKHfkaPr2UU2FzSdRkm3kkLBW
         Z3b327wTjqKEAXHY8jUgJm8oRjpE4JumijLl3z7DK7ZFGmICTJjQUie+zgM2C3TyV/gf
         Lp9Hf/4I+4eWS5mFE3F0xR2EVNB3FyTQqbux4ASS5yocNPoeeZDe0P7ARchZNcqm18Na
         K6UR36JDi6PtA+tRBO192oWIGwFMz3vimEoo13VyJ3C9AAlXMXvOUcisaMp1vAxK8Lod
         /pBN8EpAr9ApzoJiVXXTHYt230KqTLHGJgVAfxGIsazirDPEiBy7Nos2BvrHpyANqTs1
         1o9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXknO15864APcTqPbsQGbovYU+M63XKoHLgdoTorMF3kekodlpCK458wF7iI9nYcukmETl3dOMp8Sw3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze9IyRci560QewxbuT4KMP+mAekAfl+jwdzSPm8KAb8GdJKhda
	Jo7l8aE/mCpmZwapQDZ7r/SYKNHhj0vMCHsvxyHR6d4+ckk5Y3dWpQyTrBI4SfBP7u+i6Ue02U7
	6/08jZQwkgKtwbx2NytsvR3NuSLGnseKWoNwwug9l0DtqMlF9Yy9gJ6bYV+c//mLLEg==
X-Gm-Gg: AY/fxX6THWqAKWACb0/AD7bYyK9VBfc4N6AmXORTWbHEolXJAOfzmTI8bMdghCIlLba
	Dq/hN3WNiizu0S4IZycOzrxsrKa0sGG8T2de/z9Y9nlrrC2R3uwPsQb0Efpnn6/EAb9s+G0WEVy
	vQqF0iwFB4uqoyzUt1RH8VqzcFotQEqX09lWtfnJdffWhVOqnR5ekX3RuBzB0wE8806CvB6+D94
	aTjb8gmdyd2V34OpeHkaCZ1QCyuIPdTXAmWGzgs+XR1Tqr1ZU95qtHQN99eBQ8sk1b57XpCQTL1
	fdbZPa8RxCorL19Z2/FFq8qq6MEDPUT7I0NddR7xRKv5/GPNgWsGbhyUVXi/jz3RvPhR/0OJTT/
	kYUpaiJwBszFXABhybKqAzOOjnZO6gzYiCuZSyfFUPnOcIYMaeSOGXglIxUgkxbM8LaJpLJfgxn
	D5qjqG7aUCEylAfvGr7ry+ic4=
X-Received: by 2002:a05:622a:209:b0:4f1:b9ec:f6a4 with SMTP id d75a77b69052e-4ffb48f03edmr21060751cf.33.1767773781774;
        Wed, 07 Jan 2026 00:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdihUJiADpylFeISDLyhuutWUXSisSGVWPGAH1SHUu+jl7zZy3/SG5e0+6NwqMIu0tpq9bRw==
X-Received: by 2002:a05:622a:209:b0:4f1:b9ec:f6a4 with SMTP id d75a77b69052e-4ffb48f03edmr21060371cf.33.1767773781370;
        Wed, 07 Jan 2026 00:16:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b731aa442sm75691e87.95.2026.01.07.00.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:16:20 -0800 (PST)
Date: Wed, 7 Jan 2026 10:16:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
Message-ID: <plypx2dvl7hbfokvuoydzdgqhlgy5ch5j3wgsxtrgrjlce72tz@qubblpc6x2jh>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-6-6982ab20d0ac@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-milos-ufs-v1-6-6982ab20d0ac@fairphone.com>
X-Proofpoint-GUID: 4XpDVdWvYOnQNVs597HKu3-PQqiDx_oh
X-Authority-Analysis: v=2.4 cv=QfRrf8bv c=1 sm=1 tr=0 ts=695e1656 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NiBTYWx0ZWRfX+Et8BxTMkiL5
 01MuPNniX8oNQ+VjDJk4/HPMJcmIzuCrGPScatb2EofORcfKSgnjFVV+NrRykAu8idMdgyeP+Bs
 Vdz5Z0fd4sXVT41gieatDc3qrtE95HHH+KoZefXDsCxC7nlC1SlokigzBV7C8S2g1s8psAtVwCx
 +nKIFutYl6boqaNDyqjQmN6n/uZ6eWbiJabGE0lnQaMQ+7Fio0AwtjzP2DbXvDDRfP0zvRiBgf2
 bsFlc30MrRU5unFefNTvx+ztPc2GUioJ7SJLn99QCa6cbjuVXE/zsSLz6gUC5ZpePUT9gvdltQc
 XQQVajihV9yuMTfSpdWNWEfPj28X+u0yL+cQlHyPI6oWPYf4l1vvhLkbeNRBHzK1zBIXznBvOTc
 Gi7d+qKZu4VjIAXMMttJ0c+47KXDq6c31TEoVpuz86Z8ElwEJAeyxVY0ZxgVUNgAhdlgLSWkBVO
 2ASsFEawM0EohbwtLmg==
X-Proofpoint-ORIG-GUID: 4XpDVdWvYOnQNVs597HKu3-PQqiDx_oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070066

On Wed, Jan 07, 2026 at 09:05:56AM +0100, Luca Weiss wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
