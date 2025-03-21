Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472121F1511
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 15:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572584; cv=none; b=ICCG3xRvw+gdmEIJVJSpx0hIfEU6ai753DLOr4LX7i+iXpGhqiJS7gkSym4DZwlKXvaDIBrGd7R4JBb+O9ZSAGgiQlJ2+zZyXuujI2d9C9gQCgW/z8obgjCz31WvwvMz1CJvg27EeUzHBr7tkh2iUfM78vEUMw5mUodkKRvjmdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572584; c=relaxed/simple;
	bh=jtK2QDqTlhKBwHUhLX3eB/1RysUYJzgNVdE8YCF//74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0yjXwM9XpCzhHw4gwizEW7Hbsa78GO3n5FrPHEA8R/BuwzdiYuXR6dkHsesNGoKlvs/3uQyvwSPOcE+cT7Lxs1jBPWJ/YiMWaBAX1/8MugRANUvKNpddnKvNqXka2deVuXRGAj3+wzZNqjGt5MDXiiZWiLbuYRPxCLsiE3soDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8aRXCa2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8aRXCa2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBW5000776
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 15:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JXxXMbIKZDkQCmeSC+3+cLMa
	Rmgp8rIUcHJrJ4UWDm4=; b=G8aRXCa2wGLolSqPh30P9gZCcy9SUpVv1ZkSZ3rm
	jeSi+IXul8T8VL2HlsjzwYj+YkABge5RsyPegv+wK8A6mYwJ1qAqmIMir8Oh+9lD
	tEwAVtM4LmM8WzTBAs1U9ToRCJS77J0Cvt4OlskBBjnFip79h8r8n5fgaE7XRHlq
	GYsaPmwd9Xxyc3/M40vQnW3pFGGidwuD8Ej3xFb3NrkBTGYfAh6IPFgG0wIVjSye
	sHqqNDyzBBklpa3kwaYC1kRDW+RwOz7pBpCkkws8WmteXQ5hD89jd7hulJAEy4F7
	CJm13DX99jFrbhhUD6qPSQ8fDVXvco82uF927alVBdVUeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4u9s63f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 15:56:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476900d10caso45415751cf.0
        for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 08:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572581; x=1743177381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXxXMbIKZDkQCmeSC+3+cLMaRmgp8rIUcHJrJ4UWDm4=;
        b=UQXuvOc5p3/1/v91MQ0YsPi+Pyypg+mTFJvhx7jc9VhTYvege6s9djW5zWxTyLR8O1
         1vSo0vLxulVcXCsWtveFPDHMUtsvPqZCNbMWCncsU+HCcV665iOrOw0dwtSscep/Jmvc
         XAy/Hdzjom0FKe5mA2ozVBDblgx1FVhn+7sdW7sL3u+pgl4rJNWkJwo3Qg1VouHYQnnH
         oDqtypigPJQkgjjqZvP+shKMZYLFnd2YSbbQmcbZ++3Q3tog3MNH2Fg6OmBVhOpCODyE
         4weZicc14YLjVsqZjHR2Lkw/K7QAPtqDV7WGDukCT+Q8RmQceCGwC0+WY06/mq5hdGW+
         w+4A==
X-Forwarded-Encrypted: i=1; AJvYcCWouiYaD7z3mm5Yzb1dp3Q7V5aMPzQVwDd4qdgs0OsEf0aFRq7wyM46fX5JaLlpI0l6wXr7lxiF/2nWRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIwoaONMjNA+eQXswoZZ4h6qJ3N12VggPchF9Bv7MuWW40LVW
	/3TizJ7hCBAaizdIUBUaD38Yzz4mS1H86MPmPecU8T9f60WL6zp2waL/Vq0XKY1ABpTpkbRl27w
	e0fcGb11zAxUYEDiuHDDnKFy/qdtW3rK7ExidgXhIDqloFygZEb3oJrlRHWMhjg==
X-Gm-Gg: ASbGncsDCO2UiXh2m7y2cWt9RKgU6HF01FkhxMdFogRVLBWOcNfSZZRzesejFZHLtVC
	IBmkUvFTfYYMmVfmEfI/kQLA6VHqXgJ82uedmcT3D/wMK+WDrjKQOIaO3i2/RD1IMnjTSF7X9Xa
	lvmo4o4Pe64yZ2rwIJc941DmcCijYSxfJkLNh6r2fBVr4AJwcO3xJsOJvOMriih2w2mvvCVkzfM
	eT08iuNT2TXLC73cM6uhpxWIaBKFO4+3XVMgnqh+tl1OT1keHT8F6uFnvHLLBVBmmAJbGouyIFw
	7OQYE6CV0cgcMcM66hGmwctuUq4h31K33ja6fC2GeMsqNCsyH7EQH0N5lQfufUGkvRN+fxCNtai
	LHVU=
X-Received: by 2002:a05:622a:5814:b0:476:ac73:c3f6 with SMTP id d75a77b69052e-4771dd6088bmr60922761cf.4.1742572581025;
        Fri, 21 Mar 2025 08:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCsWGKRyqaJ2TmOkH3K0NMiZlYkbPPk/QwcpHDS2Nnwly3JDGm75e6MKQgY3daBLRZ6Iq80g==
X-Received: by 2002:a05:622a:5814:b0:476:ac73:c3f6 with SMTP id d75a77b69052e-4771dd6088bmr60922321cf.4.1742572580587;
        Fri, 21 Mar 2025 08:56:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468750sm207248e87.14.2025.03.21.08.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:56:19 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:56:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add video clock controller
Message-ID: <wjq7sxdc5enfu6zhp4d53mpyevzbuwm6qc73kwiu2v3v5p4zkk@mevxbzosjai5>
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
 <20250321-sm6350-videocc-v1-3-c5ce1f1483ee@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-sm6350-videocc-v1-3-c5ce1f1483ee@fairphone.com>
X-Proofpoint-ORIG-GUID: N8uNsYuGwQEZZLfpZTqtKyyQGFM8GxLv
X-Authority-Analysis: v=2.4 cv=FYE3xI+6 c=1 sm=1 tr=0 ts=67dd8c26 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=BNP51y9EBxushDLX9oAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: N8uNsYuGwQEZZLfpZTqtKyyQGFM8GxLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210117

On Fri, Mar 21, 2025 at 03:45:01PM +0100, Luca Weiss wrote:
> Add a node for the videocc found on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..ab7118b4f8f8cea56a3957e9df67ee1cd74820a6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>  			};
>  		};
>  
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,sm6350-videocc";
> +			reg = <0 0x0aaf0000 0 0x10000>;

0x0, please.

> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>;
> +			clock-names = "iface",
> +				      "bi_tcxo",
> +				      "sleep_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		cci0: cci@ac4a000 {
>  			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
>  			reg = <0 0x0ac4a000 0 0x1000>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
