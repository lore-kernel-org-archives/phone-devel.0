Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A45369215
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906785; cv=none; b=HQghtOijX85LJoDSf2yGOAXaabQFoDp0M30ZMajktmthAO2R27etlDRl2tFgu0RZxUN3gwsqMSeMj6BJ0Mf8HLp/YOWY+81K1vPXlaaiRiiqPsI3wGE3O/MHuwWpSgwj/vyBR7p5Y5KOwqo8K25B4jt1bA1pPx2doGo23nsIwiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906785; c=relaxed/simple;
	bh=QFcWsuGU1XbJEMhdiMHYLDk6GYsh6udTdZlWowBZQ58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeUxEP6Uq2Re5m9UsSLq7FA74X/oWaXLWbZHGLE54DyLfD+u5IXPPgHUrhqG5asMa7Hm0SaxdotSW/8IKXXH1IY2SMWp4m8a2FXUQpPOl0PXPEaJoHpTjAW8MJ7FJ8bTrVqhRdPp2Q6/fc4TT5LVR7Dj5/amDe7+hLbtTc60wZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0+hYcV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8o0hKI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0+hYcV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8o0hKI9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K8Qg6i3366145
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGaJ88H80cfxfBrRL86RdWbbJjprUh8y72Uii+8lJUc=; b=b0+hYcV7JzSjnOWA
	j2oD1VGcGn12iSCT/YlGWaVEdWdBOXpJlWVo0sjjKGthKswNbYZFbhUZoydkj1R5
	XQQFvFmDCjKtshw8UxShzGnbM0aYHJEOGOScSyNU+8O5jaClOIZ53RaXaXNhcbhy
	KOAShZxO8TrYpKsVI+MPPhNJ68GkL5AvV71trRoGk8O51apEWtuakT0SOlYvMlv0
	EzQYDa8dxWDTvrSj1b/WzLYlJxm0Vte8m8IjocZslTbSbjUqrPcMJG58K3tNMbR6
	BaKYhbzCXILYS8negaDJ6yC3PSt0YRz/rmg6gTTC0b0VYUFQiPrtZwjVwy538ELf
	AnAEEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb1k5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:59:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so115319885a.0
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768906779; x=1769511579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGaJ88H80cfxfBrRL86RdWbbJjprUh8y72Uii+8lJUc=;
        b=L8o0hKI9NSOAY8UHUEynaC3FbM7YGbHa24EFZSHLs5cU3jUYeTIWBKVZziStbSpvNc
         ab3gVc2Yf5R0tioUKeNKA7bTkWF3Rvf8lYkxrSi9O9upoOBypkgw27Akq8QIn0MU4psK
         /23lTV8xAfjuwH++hYP5etUeXYxzWHVHDiMORWzIfIZuEc8bKiv8JP+f1piIqYw8bFnJ
         4sYmDokUDWeLmrtJJz/O8uzfDKTU1mBScRBGSRIw7FfJpuzkUJSF5AeUUO9Bt4uCMsN3
         HE4Pp0oRBrpslWopEte1YpZ8p7110YbFnCUeIk9Neks24k8L4r6hanuhpXCo/KC+wS50
         iz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906779; x=1769511579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGaJ88H80cfxfBrRL86RdWbbJjprUh8y72Uii+8lJUc=;
        b=N8f7nOpsOezqiMsPNiT8xUiPVyd/XKLmU0m2kR2uaOwnlZLRhEsarBPT8qkJZsZtyk
         KWEMvOCCq9/BaJXYRDQl7qgG8v0E5ccOy/+CVJqMFCyu0v0d2AJL/J2oscIN+HfkkuA0
         rqZPztler0OlMP1hhHL3kz1dp0yPpi9hannItPqpdeLIPnxm44BQBTDO5CIhnNf1wEBL
         lveuA59q8bLYQnDZpuLG4FGXsUa8qdMh15V93D3r+ojTnNslPnlPINA2B3dzy0bIA05E
         2M3WEUlsCPExuoeYh4rCRwIpCqDwstCKHxwFU9v6cae7qHdaT0MexusZ+LoMzC1Ld4OC
         3R0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPn0kJlcfQ/b6KrgDDw2vmJ+6nC2Q2TPNaQpz5Tfbw1yzvgn/IeeNaSbHBzkuW3c9CtRGHdLEnRGNTqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmaBmHdmAN5eHpCRwpll2R3u9IgC55w2EmqB3bvmgddJYFT9Ax
	wxgkLDhFQZLN8FNL4kMorEEx+zPbwy3kJhcRAo5iXybCBU2XBQWjE3orkYm9GvVMHg7nJX/3epO
	I+u1e0tc0wJzyQuFArg1I61e7xtBWsByG0shQzB0dV2wOPKcQv6zjvNWsM9bq1Zrnj6wxS6sfhQ
	==
X-Gm-Gg: AY/fxX6LbeG2wDU0+gs0oJLrMdTIphTARCuNUfmVocSBwgm7ghgv0zPpIl2vkbrZ+YI
	lrNjiPECvvRC8w3rI0mOMvBXGUZLe+m4OPKWgHGYdUckhXxLpHhnHltkGIXkAf8dJ6ssrY5LFh5
	pHTBrZ8z38JHD2LcLKbdPGcgkCivl35iyy6lyQjaYTDDcmslrCZTeQXd8dQ26E2LoXsOMOs7eGr
	yRGCxh7VPeVVfxaStL3LnmmNvKoj+mBSbnhCqFuodNCkgzMjo7IUPfatVDvIdyU/e7cIc8eFoLJ
	26B9S8Sfj16tLgQDUbDHgDpmre08Lz2tHdIJVojOqq9CToq/UuXWVgEEPws3P8LaMTFSpt65yzc
	66UifKctMSt4NkwAPsIxAPHWBaP2h65CCo8YJIU9rK5It0vEBhWxvbbbcZFpSS4lEYgg=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1456057585a.7.1768906779231;
        Tue, 20 Jan 2026 02:59:39 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1456055585a.7.1768906778763;
        Tue, 20 Jan 2026 02:59:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fc273sm1345590366b.54.2026.01.20.02.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:59:38 -0800 (PST)
Message-ID: <8f7d6dca-d594-413c-81a9-bf51e0d8fdc0@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:59:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: milos: Add CCI busses
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-3-28e01128da9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-cci-v1-3-28e01128da9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 07mKebLasc7EgNBlSgVfQDQXecHkUhrC
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696f601c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=KdqX6l0VmMaWkiEhp-gA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 07mKebLasc7EgNBlSgVfQDQXecHkUhrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MSBTYWx0ZWRfX1rdI9TQJqJ49
 W60u1oBO/XsBlk8bd/79g8LAFkpKnA8L3x4Fj1g6wRRjI3BZDhgn4/Ls9tf5pIJk0KtuXl1Shf6
 +sTY/2pF45U8elNEzqIi3G0T1kjtbbSWilISfT0YSyc9bk0nMT8Eb/Ruj5per9oqCJ0mdqdIvk9
 r9EXSXrl8mXrutwxr/RBk3xdSpUig0Vh3KgG1ZAFjRZKJR4C6JzuHWraYqeS6nC3toDI2jCVnNs
 tj+xqSWN1lkU/RFsO3py4vB7IoHGBBwbAcqxf7f3g9alpT81xXlCipqQzwxlxTgOWWl0Wr0VcTg
 N5p/DXqP/AX1kmxhgCCqaNS8Fm7jXzkexpRyBpI1EszYDVbZ4qV+M6D6veXIpMOYbK/SVbNCTJw
 5AsfrzzHogssFIQk+v/gYIq4y46ZUvRu0qE8jOiwlILTeBCmjoiaApafKNP6KBYKRFhlMASuvGk
 HnKJtTB4Xq1augNEn6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200091

On 1/16/26 2:38 PM, Luca Weiss wrote:
> Add the nodes and the pinctrl for the CCI I2C busses on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 194 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 58b4c2966df1..c8771beffa9b 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1652,6 +1652,72 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac15000 {
> +			compatible = "qcom,milos-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac15000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING 0>;
> +			power-domains = <&camcc CAM_CC_CAMSS_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "soc_ahb",
> +				      "cpas_ahb",
> +				      "cci";
> +			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
> +			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +			status = "disabled";

With the pins moving to the child nodes, we may as well move the
disablement there, peeking at the code, I think it should handle it
well

[...]

>  		camcc: clock-controller@adb0000 {
>  			compatible = "qcom,milos-camcc";
>  			reg = <0x0 0x0adb0000 0x0 0x40000>;
> @@ -1791,6 +1857,134 @@ tlmm: pinctrl@f100000 {
>  
>  			wakeup-parent = <&pdc>;
>  
> +			cci0_0_default: cci0-0-default-state {
> +				sda-pins {
> +					pins = "gpio88";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};

It would be fantastic if the GPIOs remained sorted by the GPIO num

Konrad
