Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA135E94F
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244479; cv=none; b=nyisUjyxuRHNoDnW5qcuRa1QbbuCWBxjlFuciOBnX28zZxPapxsogzPNA0vg1TP1jL7/OWsvPXE94SGFmXQiqDGy43IFMmJj4ma1o5MQlKoHevqja/U4vgHbhe25Uf1A3fEQL8ADS79SSYFajqcm0OoszkmU5FU0uDacq6mOIyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244479; c=relaxed/simple;
	bh=5q3xTAy3ceHEamuEbTFb4TuIH9r1qcuJh6uhVKuufQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmO/DgpHXKUqphhKkNQDzBMxWC7PGKqyPSOYqagCPCh8iHjDH3X7tnqLgGzH/HRwXHgc9JqgB6GLLFvFgLS78WO1U/6vZEIMZSXHGE6+WtYtfnCDi990tF5ppy3NpGnLPAiIf+/zlB0TAFjICatn2UzXs6jPYK5lDZtVF3nU8mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJWbNuXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzBhphsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJWbNuXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzBhphsN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AxUbP3803922
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 19:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/3sonBIdbluoUrAy71UfeN4h
	HhgvOxlNaGnfbCWEk9s=; b=nJWbNuXSuzNixGEpytL6xyKJyMgsDjnsUYKIy2f+
	1LiuE9rU9GXq7yfcWtsi+yBvoKvLPhm6RwabVBKTeIkib4b4KqM24Cuzl+N7sWTY
	bW4OGivTouXqQTRRPUcOSbqR6oCJZuXT2rPtk7rmo1wCJr691O88pqKmR+oJzDv8
	H4FwFLlkHKmVHu9qiI8vnDht8pbc4B26WbElO2hMQBDEZOsuKRrnuzPzdxyv2REs
	PvbBu0VyyCz5Vxpa8xpa3OJ+Z9M8Yt8q9rDnBceCqFi8zVH0oGO6OlpCuTlQsUl4
	Xqgrtfuci7BsROBaIXrAVK5HOksdsqQCWXQjZqI5cWAmrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dac9f9d2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 19:27:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so60486991cf.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 12:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244477; x=1775849277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3sonBIdbluoUrAy71UfeN4hHhgvOxlNaGnfbCWEk9s=;
        b=TzBhphsNtpy/A7sbPntxpp2hotWd2ORIgrFgpYMsePYSaowRLoRZOLXl73W0leQdRF
         yz6lbCnJrfwfuURokAwbSC2gzSRYuAWFMFXDfm/EyG6WKSEqCR97lVVFgninNE0eno3r
         c+E2U910bojy2Lg2Zfw8oipkDl9jw3kWR2WjLT1C5wHknSOMITf1BNSnQs94S5TXUjKp
         k0+LA1k3bwe7fjPuzCfKZu9omrtkuLdMoTPFAdq1+XkGR1JODvho7hMzeGs/V15X0SKo
         5Kq2SJmCNM654UYb+0WUQM232251rLyPlrmtIpezD5QGXw+sc5FnJF1s5NPF4Sq+qAG8
         esMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244477; x=1775849277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3sonBIdbluoUrAy71UfeN4hHhgvOxlNaGnfbCWEk9s=;
        b=lSniJwETCRzqYr7Io4PCrjlQ7N02tEFYBXeC4yKzMzOeqFFEROej69H90dfAs5Ze8M
         apu+Uw1oOUhIh4WssWuxBh3cGn3ez7OhgzvXNFndvDsqNwMrlMfm8XAmyY+FaZzYxDhk
         UWhKqi+dPDLgvNfnY23K21ALJpvhlzvM3RFhp4IQPCZEpok5O8bsUNcmgGBcn2eblos2
         KRtFvqOTxsaCA8cFHU41rqZpQ+s4ZBVKmVP6LbjgT8zUZ8zUYWyDjnHTazFCulKuXdSN
         7MIcFxjHyzb4WqdLaCHLfcJk+Zxasii1rz+BQqDugv5NWSgUreqAQ62+EC5qj/kxluC/
         zBjg==
X-Forwarded-Encrypted: i=1; AJvYcCWusWMIisa+PDpNQC9IV/ZF1K/+z1hps1tD0uL1cPWGNQdU8U5+skODLRjo2RSLqF83FKVX/2uc1wYVdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBsa/Yi13YoCnd5CEauerpzqBs16aWBxDR7QnY22hECxNlIQg
	sQ68C4lUnf6Pa9HwX6FFDlengf13jsrQczDEODeQK/DyN/NOQN9XUqXaZmfREVPXy4d1zsVRpB6
	GwO9YyCk3dcmxx0Swc2dy42gRSYCoduiaxHrrCIW+HE9O0wFbJTADSd+TLimzFeTsKw==
X-Gm-Gg: ATEYQzw6kTV5YPvDELzN0d6sZRJj+8ZJZ5i0Az65SyeZow7uzNO4ZhlsFTHW3YvSYTU
	EfZEhZQ8VSxcJMx8MjO8T3TUqiWS4BcAig1ulB5xzyPhJj2MMGFYMrPgXGEfi4aOWLBvA7dsMll
	zRlNLsQWV+r008lAB5tCAD61QubYM57AHGr6s4I070NOi/UJ3wP1dZGjjYSFthwH/oB9sKlYj7M
	f48TMRDq6zu0UAVkS7sxmrGldqHMcKxTeIZqLaWeNVFou1OgRURe/ndQAJJPcDjmOHgiNwCeSgh
	YzG9NBtdzCmCwrL+FQ7q0l5TYB4KnJH9EZ2fXEeF6wUsDfAmX1xut9NXyJfHw6tnf4+jGnFFOxT
	y1XChzfXBNAmr/A83tpstW1GOeRs766N3k9hgvGxolB6RGRZMvyCf4cjs40KR9yXANSu35nh0VW
	HHR6NxB/RxwbA57WDQleivKb86OL4X54Kq/Co=
X-Received: by 2002:a05:622a:40cc:b0:50b:40bb:277e with SMTP id d75a77b69052e-50d62afd8b3mr55933381cf.55.1775244476834;
        Fri, 03 Apr 2026 12:27:56 -0700 (PDT)
X-Received: by 2002:a05:622a:40cc:b0:50b:40bb:277e with SMTP id d75a77b69052e-50d62afd8b3mr55933081cf.55.1775244476399;
        Fri, 03 Apr 2026 12:27:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccc83sm1618276e87.65.2026.04.03.12.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:27:55 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:27:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
Message-ID: <ku4w5dbfk4ihxfslyf7lcxtxnbzabim5mmtm7xlhqbnmav36iv@zt3dky3vbfbo>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-6-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-ipa-v1-6-01e9e4e03d3e@fairphone.com>
X-Proofpoint-GUID: bSbdRWcaDMt6QDh2liBJgsOKsU7-BrYa
X-Proofpoint-ORIG-GUID: bSbdRWcaDMt6QDh2liBJgsOKsU7-BrYa
X-Authority-Analysis: v=2.4 cv=BO++bVQG c=1 sm=1 tr=0 ts=69d014bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=6H0WHjuAAAAA:8
 a=EwYZka1PfJtyEMGjZCkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3MyBTYWx0ZWRfX5D8CCEVP9wKU
 k3pwIzWGTw7xbrdDNrs6aH5foql3GicOpdSNV6bH0l96N09ZNhXhZPBnhwTP5X4LEEuo97dcQsI
 ECZnvE5yIzRCV5nkqHGcAbnsvT4K1+VweStP9iJCp9NlxnBLSwB2mJbYi+U6dt6YqlBuGO/bpMX
 PEm8IVPWLBCjTxR1d8FNYUcJvd/RutTk/emIJgFYYCiUbJBPqZjn51c4zDqbSKbAdxh1snTI4Um
 kGUT1Z8nYP9iL+keojIPOqVOBBh3yolt/d5wIqZj85XpD02sD9UnzYBQqC8TRA2s3Zv5JNU8LSP
 iszcqvaxIfYnJ6BANgIQGg9K6nRQvyJyyvjS6f4PZRwcyGwFVuLcOxL9aCNW9eJFfG295NJcYvx
 Wudn/70tZCfZddDEURrYRzE3kzRiwflXsd8w/IZHAPs6ZM0jbbBmhGJ5Qfk4jKkfn87dwfNpCo0
 f1ixBv4nS4cfhyav99g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030173

On Fri, Apr 03, 2026 at 06:43:52PM +0200, Luca Weiss wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index c1899db46e71..31c6d6627619 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -690,6 +690,15 @@ vreg_l7p: ldo7 {
>  	/* AW86938FCR vibrator @ 0x5a */
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/milos/fairphone/fp6/ipa_fws.mbn";
> +	memory-region = <&ipa_fw_mem>;
> +
> +	qcom,gsi-loader = "self";

Are these two common to all Milos devices? Should they be a part of the
milos.dtsi?

> +
> +	status = "okay";
> +};
> +
>  &pm8550vs_c {
>  	status = "okay";
>  };
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
