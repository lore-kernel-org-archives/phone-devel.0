Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6766390990
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391191; cv=none; b=DJlapbhynlPhJU2uuHypy70GohZUBrhqjtp1jZ3LBFCwcoaSqllAI68VoM1sm42h4ufUF+/x9xDtwzu2K46a4Ap42wFvkpmgPimjzUgxnBTvOvMQUtpCw1FD6bdNH/kYyNIFId89GkpHQjZOT/HJTj/SmHJRy2HzlAout8VQjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391191; c=relaxed/simple;
	bh=72dJxfk3Uzm/Y/ymeeIctx5apTZdXzokW2KXJg3SFzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qufa6x9bNaRuvzCvTuQSPtMNX33RaVEgBRoCkaik5djxE0AHEjtpvKF4zalYOzRfH6Fp2glQarwW+9eLezbL9l7aKoZNBVG4S+uZkx2Y+gSpF5/W4154IZjusKx+3A+OxG9D0Y5T5QWTuNxz+gafgD7rLtIy3Wl4PvMozkc0KdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4Pxtpj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K45uAwWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4Pxtpj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K45uAwWy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD8qq3731561
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D1KwBMD5pBl3gSLcJ8Ks252R
	u3i2i4xJaHHe0CS6qgU=; b=V4Pxtpj5MyRXBUGXV3dfKu2LzQlNj6u+j9YxAOQi
	vA5wmQ4OZ6PETXxpa6NBEA33nJEC3Ve8iVvRQYBHgPyE12eg0sOkPOPNvYLhoHO2
	yrZXwVzDH5/SxFgPASAy/Z7WeqTHh6OnTRhschPpdJKTXVQoeKNkHejE9SDhFdTx
	FGeyL5EWUhBN1FZzVJ8H8iR2KzWCIxfj634k9TeFhYmbP4KMTb98Zmjj7fEwEhlb
	deCPNWKolqVfXDi2y8G2b/RE0hIqyKoawCT17KhcYdcj+XzGq1TuTLx5NbvSImgl
	78ERhoeiG0XTg+asdnDkE3rO8R5eAucpGPUWx5ZnDezVZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkeu0xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:26:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so85554991cf.3
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 15:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391189; x=1774995989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1KwBMD5pBl3gSLcJ8Ks252Ru3i2i4xJaHHe0CS6qgU=;
        b=K45uAwWy1C0VvbMaK0j6Oo2trhDiV2BaCFRGUWr2+YtHKX7JIpadtuBCcNGymrtPjl
         WniBNuv5U0KJLgZCSbjPbE4a+giNeH+LqtPktBHPqH0mzWdz/NUxjZmWMmsBOltCa611
         Ye0khiNUBC1VCNgLjEJXy0uDc8e2gT97jPkwG7n+XUypyI5HyAsxwKgDFs8lW74tsTpJ
         R9t3HSjdIEiNgZp2/diLQObCMlD/tMiWwR0r+UhovF/IgXFQMuo0ro3ORa2K+izauwYY
         eCwwpc6k0oVayZOpa7KmWVXv4rS4NGkIfIG9kEce8ivaYlW6mEQvK7E+rVNi3Ht6Ng1i
         rWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391189; x=1774995989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1KwBMD5pBl3gSLcJ8Ks252Ru3i2i4xJaHHe0CS6qgU=;
        b=LqDfJvkItixj1HSVyzM9vvvCqSGHh78HzzFTadkp6wYNTpOMUxIQS/Atdf91zkux3R
         FzNrcGfm7b3Z6KguluTpS01I9sFVRIp57k8zPSUlO97wDyIVU8YgH5MKAnJGN8gUcV5+
         YeROAnzTeFI4UmCn4B9dY9ix0rTs9SUxyTl/LV3+5vxNGEHJ8d91FLl2VxTEbtW+E7NB
         472uyf0IkwBT1wAv4vvAt8lrSZtxUeiMo3leWnfDHJoWuCn9f86o2RaewwytOet1YysL
         PO22LN0b31reE6borArHsSYEU1ki7zt85r40nFk+Ys+InBpWttldf86AcOC5EvorTbWN
         CCug==
X-Forwarded-Encrypted: i=1; AJvYcCUNd3oUI6KyZazAdyAuNxghbvBQQBC7eWCNQz/ksI+ugXBkkGd7LueV8AMPyXWknmX6gxH10fk9xxm0jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy589PiiEp1X0dvZ3OqAGJpwLqwnXrwmdU7j7owHSpNRkr9W8xm
	53Tp3oON/biP1MLvraWT2JDqqsuEG1E3nw8xwhZe8gIfkKawQM5l4bAZUC1nksZLhQVUi2IKqr0
	diwiar9pkhrRXBQKg5gRuBa5nAod2WVWtDJqkEN9J8nuvaEerJX78f7wHA7uEGp95qA==
X-Gm-Gg: ATEYQzzvpiGqoSSLc5mpkO2b3w7s3TB+WCc1wPzODsmLcdm3kFhB7PT2D8TxRk05gU3
	yiQw7EipOaN9xFnOUbPmkVeGIbjWgcOuy4Hs1p9A1XLjT+HxxlJ2pj3kTXcDcchbWLYPF8ll8gL
	10q8do7O9pNWtgRmGRiSTh3KqYDXEofBsJ3Ov88Rqgr7XbpIRIU1PpIyrhMugwXLsMhvluzy7x0
	NFYJZMwNjJJfCyWwYByoisd7QPB04z6FaH3XcmhjNZflqB7QrikbADTHKL2guqRdAR0FLGZbN5R
	xMdmO/lx+A7sbLtwx7wYc57wWwxs7OOTN/IDk4nBsk+AR/CaATkCooKsVt89WxXZDgkSRCQNBs9
	9/cyTfrQnjxZROybfCmSMfXPnYvWFr4qmQcUpYVa/Ei5DR/Fze/b3OQZXRKGl4o3KvREwj/jdr+
	pEKM4M6oG0ko25QjmyKNZilzhQlt7H2euoSBQ=
X-Received: by 2002:ac8:5f95:0:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b80f0a38fmr20286031cf.66.1774391189120;
        Tue, 24 Mar 2026 15:26:29 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b80f0a38fmr20285631cf.66.1774391188688;
        Tue, 24 Mar 2026 15:26:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a08dbsm3395670e87.24.2026.03.24.15.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:26:27 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:26:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 14/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 reference memory region in fb
Message-ID: <gikqqyhb5amajegkzqdsvxrpo2pjxji5d4cjbzukcwfhegnoez@lf5jucxtodcs>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-14-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-14-d89f07897283@postmarketos.org>
X-Proofpoint-GUID: ks4XVs0DsuDBGfNQozfmfeWM4woFl4qk
X-Proofpoint-ORIG-GUID: ks4XVs0DsuDBGfNQozfmfeWM4woFl4qk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MyBTYWx0ZWRfX4nD8ExEzmzSx
 +hKClt5v6w5rMt3v9N/ZaFoZHivJBHMDIE0OYEtnbvzutbaNO3ea0UHQDwz8TVpI3dELcjncPj/
 pV0ALo8+nHLENT/G2BoYwSLVYr0P/o7nOnTk50jwM381PV0vZ5YBDKmrmJecQ+Eav+lI6tbMNZz
 hQ+qJbq/vilJIk7gXCFNx3KelUzCO7d1S5ta5G8mRgQgoliFhv12UhjNgarTp+PKIgbnp5fmh2G
 +g1UUvXHQKEpf38JdvwLQ09x9liG9jR+T0MXkRNfQckgmjM7WBC/ZbI/z+AqQ66g+5VRebtr+EE
 HK71CwmFgNNWMnC2cuJ6GXBAu9DWecJLo+zUZBzFKogAH3OU2yZY3ZopZaHj2uQsk3EBPnlYS5g
 w4fXhR6g3oPVRZE/8h7/6djqueOsqGRn7tlIYu04x9a/4fv4XOGiwB1xZZmx/G3UtkLRd/FI6ZR
 0qdKVNpLG+3FO2/0Ofg==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c30f95 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Gbw9aFdXAAAA:8
 a=qTE7wAw9Fi2BWtdfG-AA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240173

On Mon, Mar 23, 2026 at 07:42:14PM -0700, Paul Sajna wrote:
> This cleans up the node a bit and prevents duplicating the region specs
> in the reg field

To prevent duplicating the framebuffer adress and size point out the
existing framebuffer memory region instead of specifying the address
manually.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 51fc1735ff49..f42800dd25be 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
>  			no-map;
>  		};
>  
> -		/* Framebuffer region */
> -		memory@9d400000 {
> +		framebuffer_mem: memory@9d400000 {
>  			reg = <0x0 0x9d400000 0x0 0x2400000>;
>  			no-map;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index adf41aa0146a..83e392907244 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> +			memory-region = <&framebuffer_mem>;
>  			width = <1440>;
>  			height = <3120>;
>  			stride = <(1440 * 4)>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> index ffe1da2227f0..ae6cbd132949 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
> +			memory-region = <&framebuffer_mem>;
>  			width = <1440>;
>  			height = <2880>;
>  			stride = <(1440 * 4)>;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
