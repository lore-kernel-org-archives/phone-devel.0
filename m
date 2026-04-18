Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06D1B7910
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776531226; cv=none; b=pxSv08mWa3nqrUHlNpUjbqUhtL1iK/rHzK/lyiphSVp36jfZXKFTZuP8BlX8DkhMEvTdIwdHUipSeA5yw2G6johMNiIe1U5IQRFGMuZ+55AeO7E3l7bTiW0mqlko5LXO2wJrVOgzpJChgP06K2HU71MNBBVWuH391g2/2X69lUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776531226; c=relaxed/simple;
	bh=G8BA4GtiMeYXrZll3CjeinMZCeGPFznzndL8XdzQmnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1bieOXaQTRiChKHVe/4j+4wkZyEm3xNLGbVguLsh8cwFexMLLghadsyvzfC19Je8/EeBgPAMqBZ2agpo0pElT0RRV0Zd7iPbvA7Urf6YY81SNVwrPRl0vsSl5b07mSXCD2Fydyo6UqSPg3mMHQ5zmRsJNKNmjxjhRNRdQJ9JSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldsVvAHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jo+g1Gi+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldsVvAHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jo+g1Gi+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4U8581283111
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lGsFMBmvE1oENRyczQSMgz3G
	ExFRiYlReX0j6dGJPuI=; b=ldsVvAHm9Ysf0Z9/sA0ynBYE0foFlS2owl5wTshf
	//p/YlQ1x42a6BlfJPXjjdP9OcbYadrULNa+HjLhPZJmPAqTIksixwp0CZl8QCFa
	oQ9ShZFiVdkYrSmVP8eOxqY1CBfnHcLLe8wVhPwYan0/sXUJYX5BA9Z3S34zaoQp
	JOnK8mVqXEE/9MGqUNAN5PpxuPM47M1yNuSWd9Bw3AjCSsLZiuo3V/s2Im518XZN
	UV0Bep3upVsVOi4+40+vhNoZe5C/eP2O8U7HI1MdHZoCv7zUSV7xR4Y6QwQIy3F1
	V9TGEiU8oIIdvfuT+Uo7gNtxAkA/kZjX6zg/lIcPpmgADw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fs8ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:53:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so2601401cf.0
        for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776531223; x=1777136023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lGsFMBmvE1oENRyczQSMgz3GExFRiYlReX0j6dGJPuI=;
        b=jo+g1Gi+puH7F6ZZ/Gq7GlcWSA+N5NUVGqW9cCRetHoc51JPVW2Y2UVEXQQs1D5CuN
         ui5xndXDq2O0dSEHRERLCOPAohpBjATone2/D9TgO1FJz1gzqr+fzcdiKw+aZ0LIlBH7
         GdtoGJNnSIdmdSCw7YnesYGReOobvFGcSxwSsF7vvqeLRB7x2VNdXLpgsURWwS9goPO1
         ENjNEK5Z4V6Zb/bLDJFBLq4hY9uI9yHF3mp6tqQa78k9NZjI9s2gLkfALydnF3Z7cVkc
         QTeIQstxB0GMA1eLSjZrC/MsBMJEv186Sk9xENk0M+P+QvLkLGZqWhm4JQ+YQy8zEfib
         FxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776531223; x=1777136023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGsFMBmvE1oENRyczQSMgz3GExFRiYlReX0j6dGJPuI=;
        b=kOg992jeOvm8/J0FCjRknQY+oDXd0ITSl/yhNycI8mZFxCDCFZUPPnmSxoYHks00//
         fQzQSSXsEb0T6z64jkgJgAEzi16QYF/AO3poRO7B0XtyFDgABUwBq8bfneblPLo0btqG
         p2goEroCn2Ynds/75vlKf5VbzISPhe8pf/7BgTdEWCPVs6+pVjOijiawopF+N/83CkZT
         lGlqpcRFIkDoqywF+XHVbLI0SkaB492NjBFosRlYNS0q9U1/O9WvgfjMyWzJ6uiyhLH/
         gjh/vQIQIzsd1ia06kXF7UiRavE/4HuzhDGJdSBxG+R6YVnp+DaQs0mCH5KFW3OUie5y
         +ChQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kzF6eekdVGkxv7MHTTNX3OMM7csTP47+f2YmNPDBofc7C2JD/C6fhYzRUB5H9/uzuUCVhzwJX7NykTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylEix4+zuPLhvX6mX9MJ8am+BjO/FRd1frNzTQYFiPeVggFZC9
	YsqTrPvqjIOOZS3V7nJvU3eFW1Dz1CgLjhamUU0E+jILeOYy0DXZ7FxXVB+R29BLaG74gqj6CkD
	ODr3/fJeH1CnnM+PBfMG6wqdqXKx74BbvsoPeimknii2gHecWZwiYg3h4FfQGHMp9Tw==
X-Gm-Gg: AeBDieteGGuFiIrNWhEDqd0oiktq3wxnZaN/YXZ7xz8qWmrME9v7M4ofNvJuWElhT9U
	o9lF61+z6EPtah/JHoUbko2dt8PQQKfCx2lI0QWegWXpq8t6r85OfRZp9nPq32yxBrbE2rnAxRM
	KW9i+NmgzsB8WPFml+IoPcTl9nArUA8VcRsGPnMV+3+sksk/uK3t5ZIiAxnzaaxAIN2eraAOUKD
	NwBjUaV67YCv/ZTRA1ApTX6aex/EcEQc32+95bW6xN/qN1YEuIUKxr55suCZhXJdqXizn21hCBX
	x6jC2dcBEFznP2KyZiokLTXUU6S/3V7i66ZdM4FgDSw5lhQluphUBmDmWbEI9p5QdXu2bG6I+Fj
	KL4AtY4mM7SA/TXbzwLdvlgpc6WHCh9NFBPnQX3E6D0mxcYuSccpesRIc1+psu5KVD+MxouEXW4
	ydI4z1ETRjqbyGWY4jv2CVhk4Mr60C5rtH+mlQLjHwIbZsCw==
X-Received: by 2002:a05:622a:987:b0:50d:6b4e:ea3c with SMTP id d75a77b69052e-50e368283dcmr110159441cf.4.1776531223154;
        Sat, 18 Apr 2026 09:53:43 -0700 (PDT)
X-Received: by 2002:a05:622a:987:b0:50d:6b4e:ea3c with SMTP id d75a77b69052e-50e368283dcmr110159041cf.4.1776531222631;
        Sat, 18 Apr 2026 09:53:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41d85f704sm456531e87.44.2026.04.18.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:53:41 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:53:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 08/10] ARM: dts: qcom: msm8960: add SMSM & SPS
Message-ID: <u7buljdmiu2kf5unlqs2jh5u24ymteyrfvbb2drc6ntsei2mqq@yuhjpchgpgh3>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NyBTYWx0ZWRfX1kxONPPO+wfe
 2CSEBai+KXvlBSZ2WhpFwE5PTAz3CjA5dRBoCMUkQNNnmGeS5h1xrslVG955Do1WA8rrBPlZcBi
 UFb/rwDwntUY9yFMFipDH78FanlB5bMfhZq3cc3fngHdRYCa8ZFMt1dVPzG9yLg2DHA19toyCla
 4Wmzl8vXf7VY3TROwT2YNO6bc/VLKdaOyj/5j42Wud+TUyRnYwqGInLi47gaAExxhu7Xc/SSIts
 XYkCnas2vHysk+fsQ1cUcgA/xtGQ7VmbY6e3zgtR8QMEuL9OkGeVtv13C70VhfE9sPaLmndNPFc
 5t5RxBf07rfDbdKs53f6Uj9bKH9Lp/8phrwFh5Tj1iDpIuF5WfFK/q4JCG/T8WVntT9QR+qFDZb
 +yuzbd/CcnoG8A9EOtu3Wi6G1Cy89ZKgYq2mn6D1uBGLBjOeZzxeC2Gg4TiMDUS6VspyGHBe1ig
 l3g3slLdBmR7bqs4Z1Q==
X-Proofpoint-ORIG-GUID: aOrYm1pR2Zxrejh146onpPEiVSlTy7ti
X-Proofpoint-GUID: aOrYm1pR2Zxrejh146onpPEiVSlTy7ti
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e3b717 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=j179qWkWid5eCuaOytsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180167

On Tue, Apr 14, 2026 at 01:55:35AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Shared Memory State Machine node to coordinate state transitions
> between the Applications processor and the Riva subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 218cf3158dfb..107c5613aa4a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -109,6 +109,31 @@ smem {
>  		hwlocks = <&sfpb_mutex 3>;
>  	};
>  
> +	smsm {
> +		compatible = "qcom,smsm";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		qcom,ipc-1 = <&l2cc 8 4>;
> +		qcom,ipc-2 = <&l2cc 8 14>;
> +		qcom,ipc-3 = <&l2cc 8 23>;
> +		qcom,ipc-4 = <&sps_sic_non_secure 0x4094 0>;
> +
> +		apps_smsm: apps@0 {
> +			reg = <0>;
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		wcnss_smsm: wcnss@3 {
> +			reg = <3>;
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};

Are there other SMSMs (modem, Q6, DSPS)? If so and if you are going to
send another revision, could you please add those?

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		ranges;
> @@ -455,6 +480,11 @@ clock-controller@4000000 {
>  				      "hdmipll";
>  		};
>  
> +		sps_sic_non_secure: interrupt-controller@12100000 {
> +			compatible = "qcom,msm8960-sps-sic", "syscon";

This one is exactly the same as the block on APQ8064.

> +			reg = <0x12100000 0x10000>;
> +		};
> +
>  		sdcc3: mmc@12180000 {
>  			compatible = "arm,pl18x", "arm,primecell";
>  			reg = <0x12180000 0x2000>;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
