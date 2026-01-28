Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A7A25782D
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638618; cv=none; b=DGLhVLnyOfgIEViFMM1Cea8XGrA1r6HmW5PhWpOnxSed6k5RESIMYcmy801BH2gq+gqsXDQsIB+JlW01NFmkpkvaavnw05kXD8lWBZE4jE8fUB3Ap+mRUvLOL9oEQrcdWlnyOjbcE9eOFNWQGsvpH5YbDnq6/n+CLsgFYeaxz38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638618; c=relaxed/simple;
	bh=YaESPBqOnkUcIkx/6aDkUMz4rynF7sBFcZ5NMbkuJjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSHIpER7Jb5AWTTDv4Pb1wzvv8f4TgKWwvEXEoVXLDjudvkQUHQmJOvRdXmR3yzbUijIxVva4Jxev5mK3DdVfSA+Bq8HIP1srT8BetM661ikx5gWaHkEuf1hv4i9M449lLbC1c3T/JVtwB1Lm2hM+oVEI6PrnI9BO21KZ/FZ0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNd6cFec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYVrfl1s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNd6cFec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYVrfl1s"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SGvNdR1315697
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 22:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78YU5e+9hc8xzn+2Vdz7AwKA
	cJfxmpv8KIN8i1ABzLY=; b=GNd6cFecJEr7OEvGkj5qttsZELuy5Dp2BH9wLqiz
	qLhK/zbHKatwGp9krlH4ERdHfHxOUtc63NcnPhtd5Gioh541NTTHpqFhggr8Hwzy
	BY9A48MGjriELAKkGS0w032VkrUPVdJ/qrI2TMz2ZVIK0UPqGHXxi69Fai9A5hHT
	zz7trSoJYvXw7HgDjP+ZvaqoYNd63Djp5rU4Yw89vTNs8cUFFshtrM77I1en0NDe
	9VO4ckfkcuXkMADh8vyGxn3PVCXWE+Ojl7m7DG7v82gy3i7Pm6SVgum76BNoeaRv
	v6lOjzii0EbVIkToRUu3eH5KY2ToNdaMdirCHaXl9uHLCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bype8s0fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 22:16:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so91909285a.1
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769638615; x=1770243415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=78YU5e+9hc8xzn+2Vdz7AwKAcJfxmpv8KIN8i1ABzLY=;
        b=MYVrfl1sXtKlx90yVjrkx5OyqupKNw1sC1CyK+lG0eBNbL8keMp0F3FlKNQMWmGRiY
         3oAXcMTtZFfYArnGQgSlJY8vnCGh5atuXQ3ffFkDMLiJ6ALcFS7iqMm6N9GS30O1dHDq
         l9iY24hFD5EpKWbW9vkyhOlnWatbobR0TmGB0MSV2K+XY+FtmfyWrkx2qUhk12ARWL6/
         5aRBHExtMhqAwSwah9yLSx71KEfJGA/ZAL8280TOySzJ1aAc6t+M0T87tMp2acpM5UMa
         opWUAOj2qnWkPVDxI7XRtUpmBR/UwIbReXJvwR/1Dc9h2EgnZZYO6p4RkN3KrgL4/OqB
         AQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769638615; x=1770243415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78YU5e+9hc8xzn+2Vdz7AwKAcJfxmpv8KIN8i1ABzLY=;
        b=RYCq3IVN4vkTObvywnjwkGAiBKFrB1v1USat/x0+H9+XHIwW69B3+kJWdyEHsqPAwb
         EoLKL0F0EQKwRXep7n/CoosQKlrj6tunBu/Y/EGlEycsQocBjHZDNckv5BDK1M+50V5m
         krVbVkKIoKpE56ubutvQtG0SMW3+/fuvkpWnntA3XL87R8x2ReJxTgvetWvK0IDQ9E9n
         YgnWQhlkJ6h1g3UWYCCyc2qTAqtoK1HZDjJLn5XUmiPu+MjP8N9z37YAN+wZ4MNIgOQU
         pQsOrJCmR8u1E/gL5M4eYVbQ98EhJcjBZ0pCQiCZXC770pH5zR6vptbkdDABxbZGLDpX
         b8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVuPR8rJz7vM5ZuIXSGxyszIa0NbNWc4HcR2WCoEOsZydfrmpN1cDl79p80WrWNBhW1Jd5T4bW5kY1Zvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB9iLScZJT629GwCtG189upoM0g1tg7Qv8pCZkOpMpb4i79ynQ
	/M3eExJzHQGYN2q2Vjz8KQNP1a4igUtmA+dsiYR1xVPa0H/MAONcG6QDR0FL09Zcwp5urybRsS6
	E6AlvWEz8NH3yOl+L48w+yX0qbYHBP1kR71xVDhxeT9HzEYycBMSTV+/AJJfbb+9cQg==
X-Gm-Gg: AZuq6aLcr8t454zguq9kQbDNK9CSeSGnjp/zn1+z6I30zXcBcUSsxrMo+7qjDj4HPsg
	PLcd10ptkw+9Ix/FS5NoY0R3pxZC469FvRS/UNSE77xa/EJ+UpeWmDNAzdpagRYgMAhnhr4hwH4
	CKicu3lC/xRQqZg91BU2DqUy19+DmlRasobaGabDR2bHjiJxu1eduDDdAbfpE39nhB9Lj3U7nKa
	GbaeStPL/xzJx9BXcYWCD6ZNZn5MHhCnuA/7Www8Z2JYo4hjECzHtLu83f+zB/Ax6f9498y2ysW
	T/E3b60BmFnquRoqX7hpEYnD827mXKbVuBRjFwLUKn/JR61/9hFxTW0npgG7AmtFcuVgfhj4PDE
	k24RR+eGFXRu+7tTvwnckfh7JIvgA6cKYuVZuSHgrV6coQ2mEZxJGsILBw4MOcLQjsBAZeVdOdJ
	0dxgkjTVGUZGcnsWIH1wL+roo=
X-Received: by 2002:a05:620a:2805:b0:8c7:8cf:537c with SMTP id af79cd13be357-8c70b871e01mr814909185a.37.1769638614861;
        Wed, 28 Jan 2026 14:16:54 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:8c7:8cf:537c with SMTP id af79cd13be357-8c70b871e01mr814905785a.37.1769638614395;
        Wed, 28 Jan 2026 14:16:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f9873csm6621871fa.35.2026.01.28.14.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:16:52 -0800 (PST)
Date: Thu, 29 Jan 2026 00:16:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
Message-ID: <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
X-Proofpoint-ORIG-GUID: jg7Ieqf8O_BKmQQTygEB0-njNv56Fs5b
X-Authority-Analysis: v=2.4 cv=C5fkCAP+ c=1 sm=1 tr=0 ts=697a8ad7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=0AnWZtR2Y3YE4tC-k7cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE4MyBTYWx0ZWRfX01baT3CtOZl8
 z0UGGXLm0gKTDtIvMV0fdrnZBVDVvYklR3L1dXhJSx5X6zs39/hluYoVHip9m9O29LhM/WXxlEc
 6nu/EPuJkS/4sUqnz7JSHABcN4qevw1HFqetNYRbbivSYB4hCw2pltL6CITXd1NONG+v/jhh5ip
 Q4TSMceFdG+eiLtllVdKgOENaeKuw/Ss5N6ItDxtKH86z1WfaY7TchEZZUZW4WqO65iNCk3bYom
 DifVrL6CdxQemfan1is5Le7ny4vgqAfxEEh6nj1AWtsTW9hSXvfgQSEIcdzqB4E93u1jABRKkmH
 Cx4GbefnXbm+AdvWEhqZEYp+uoVR7xfNFk+kDm37TnkzWedQhqwY3AaDNS4JY+xBUCq18oOLPbe
 7e2KjM9TGnrZdHQgNOho+CXNT4NCZdBIf0mfkl0Dhuzs5GCE76x5Qau1RHf3NXhQU8UcVtr7VlM
 eiWP24sgzkNQ0YcpIfw==
X-Proofpoint-GUID: jg7Ieqf8O_BKmQQTygEB0-njNv56Fs5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280183

On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 9f9b9f9af0da..b1fb6c812da7 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>  			};
>  		};
>  
> +		lpass_tlmm: pinctrl@33c0000 {
> +			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
> +			reg = <0x0 0x033c0000 0x0 0x20000>,
> +			      <0x0 0x03550000 0x0 0x10000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
> +
> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "core",
> +				      "audio";
> +
> +			i2s1_active: i2s1-active-state {
> +				clk-pins {
> +					pins = "gpio6";
> +					function = "i2s1_clk";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

This looks suspicious for the clock pin.

> +				};
> +
> +				ws-pins {
> +					pins = "gpio7";
> +					function = "i2s1_ws";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

The same

> +				};
> +
> +				data-pins {
> +					pins = "gpio8", "gpio9";
> +					function = "i2s1_data";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

And here.

> +				};
> +			};
> +
> +			i2s1_sleep: i2s1-sleep-state {
> +				clk-pins {
> +					pins = "gpio6";
> +					function = "i2s1_clk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio7";
> +					function = "i2s1_ws";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +
> +				data-pins {
> +					pins = "gpio8", "gpio9";
> +					function = "i2s1_data";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +			};
> +		};
> +
>  		gpu: gpu@3d00000 {
>  			compatible = "qcom,adreno-619.0", "qcom,adreno";
>  			reg = <0x0 0x03d00000 0x0 0x40000>,
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry
