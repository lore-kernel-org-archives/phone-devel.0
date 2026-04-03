Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D33F3D6467
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244620; cv=none; b=YOLpw3FD75Aj5Nzj+PvjONnWzV7Uuv0w2CqteqaZ4mS4E9n9CJqW+KH1gJQ/MXYJR3XJ11uygaPp0DhmkfgztvDAiA+hi4oH+iAhhrH1S2wbnz9A8dXqt2cZ+137BsPTRFwVItGP1fAQVwrUK9whNiecgS5nNW+hzDRSY58d/Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244620; c=relaxed/simple;
	bh=5nbHgkZ8sU9but8KPZCsdUP48/vis75RxWzu+7Hq7ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3/8QnVggO0O0yubZsRol21n0gt2kchmROyVLAf5Gz5yFnHrAnjoFtusR7rjqF23WiIl9V+6Y5ZL9cxpQ/8wI8XNhE6j5vF8vZnlGbUG5oBLoUp/rlrtBoMalI2E9pHqtdOSSJpxoSHTPYk19oQtGif+u4qdykPhpmUpzj4ut1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzIkdM4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heP7M17f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzIkdM4x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heP7M17f"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DVt7c2360070
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 19:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VsyulyJEd9fkuORDKRPPQ4Qo
	N9xTMT3iEK0TAJuE1+M=; b=TzIkdM4x1vxQxFaWhQ5g/fzZ3ffutyeUtsQtQe0u
	6QpN8gf5dwvbLwkJApk9Q0CukSmYdGiRw4vNtnOBS+7VxrySpF2JgOJd1iKP9dUd
	U0YHF/SI/3YYtBjt0rUCuh6TtgALvQUEBQMZnobZARItCTCY1oL5iTCz+UYJZjyK
	Q4qCdA9ONrC5HM2dTV4PmYrReNXQ9bzLdXjZqfgEoLquKsuIA7iKUfwCQpmJxy5C
	51SoPr3VOHcf0aPlI6W4TYmw30g+Xla16zl31qzo/f1n83APbDCPNIptlDGWTJU9
	c3HwRa8lhIAQL7HUGC3y+8xoursrsXY7PIxC1E7quLVc/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daeh1gxse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 19:30:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so38264211cf.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244618; x=1775849418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsyulyJEd9fkuORDKRPPQ4QoN9xTMT3iEK0TAJuE1+M=;
        b=heP7M17fW3elKC/WVttZPn4f0uihexcgeWyNVQKg5Yfv8f50UJRHTqsiplDY7y+sp2
         CIAG1KdPRzcHQqUT9OlBjDBntQPZVAiQYafMfZ9uGL5I0OzCFbBwiatrqnAUvrVBiqPT
         wa34KVdLr0TSJiHfuEmTsxGaCuu8ltzyeF+s2XAbV0jD2kabn7Z4SefvEBQ8kx5mfzoL
         Hd1BvuyFQLHew6z0VeDK/7/vWsIZf9oNSi8EqM/8dLRXZB3rStKysiUQZ6D6ARukAMC+
         nkBFitH4KZgJrS0bC/3G8R3qropV0/Kg/UsscNpQjYUQfHPtrJHgwo47bixxNPUVMmKz
         YJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244618; x=1775849418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsyulyJEd9fkuORDKRPPQ4QoN9xTMT3iEK0TAJuE1+M=;
        b=eVNpKecwbFqcsXO4TOWH80FRnzSTLnCwa1dPpjT4fuGyMyC1p8hISYD+S2lOUkP6is
         xVuryA6rPOpsE7qy45m9jpyTQcy7p91KiMiGN0O2x94zQvn1uBLNpcXClGu5ZcO9cQ6h
         QTFdtTgwEmMsnSd1CHrii0WWU9Pdsrdf7vffn2xGbeRvaW8EyU3cG8eJk/kjcPec1JOc
         PdJ8BlHKGbW88K0yrz7daJkxoHXs1oplhuh6hwAAYjNIi4Ah8j1oHeDAJsRNeispAl3k
         qb0OXmlRwxCZycnv8TGa+XsA08EwaYTBPu/22K6BuY3r2oX7jEhkF5XPZgiaDLrWm4k+
         3E+A==
X-Forwarded-Encrypted: i=1; AJvYcCXJVn5/J7U6IGBnDtZZusyaSCGdaqy3HUAWC/LDPvvWXHBV/BCf3ZyHHwta1+RKbRHDLwvPMllZ6tTKuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWJwcIqndPqEjtSwndgiiGbdUP9b/xUKHL/ymVOT02cm+aRQAj
	uRUzv1U00MqITjOlwLMZ/++yTC6FRGQBrmNIGtO+meG1hT4TzOH44NaIE/pQDx5TDXWFCf3IUTl
	O67J3jHUp7B225OFH5u20/ypVOHDeg74gKXIyX+v/X1OUb76HsIVDEM+bEXd7nfWknw==
X-Gm-Gg: ATEYQzwYyaJk+PLm/SBRq0/fALpoFWBKOGfLcSznVwKeYYdrhYRQJDa5TigwYfosvBS
	+LtsJPVZKR3CuhJaqn/nC2zfQNhs6/INlT7DuDeKgZxAo3016TTsblGAMN4I9mngqoCcurY15o5
	swGGcZ83YTbcoSu8otj5xb2VxVq6qtGddYMssisVMQSZxNjoGTBZMs6M7ulcitMg0/PVa0ACzG/
	IxVvx3aT85nANhoyVhT0CCvpfaCfzlhHtBICmh1Wun/SXPvqDwt84CIw7v52nOReAhHABsawTBB
	FoubP/eIhlDkpuGzDH7OL9E5WROIKJXw5OCJj/VoOxZrv2A+cjAVoUbBPZx9hY4+5D+sKTiI3NX
	vwkgzK24SJlnPgKwncxBOu3LcRH+vtZ+2D+vrJ6re/UYspjvgKjSWsQvZzFFwHG1nQqlQ4u18A8
	AFJdVhh0IFL9DWw1oYHuWXRTwr3b73JlpI9dw=
X-Received: by 2002:ac8:7e89:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50d62ad8295mr64090951cf.47.1775244617854;
        Fri, 03 Apr 2026 12:30:17 -0700 (PDT)
X-Received: by 2002:ac8:7e89:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50d62ad8295mr64090421cf.47.1775244617352;
        Fri, 03 Apr 2026 12:30:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fa8a93sm13810691fa.7.2026.04.03.12.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:30:15 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:30:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
Message-ID: <2xztppp64gvmde4zvj6eevjdowdioojawcnbqe4s4izwgsjixm@kkluxswbo2nh>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
X-Proofpoint-GUID: 0Xs2gcm1a8j8WgN6Fgo1aoQd9r6aEUDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3MyBTYWx0ZWRfX5cnh0dm6pSOn
 B/OKVQqLu9OhhnOmdxUrbZZP4T+rJspDl6OWd79PIixXlo0eQ31O2hYT7u0giVq9ifxaCvOPHno
 YLC5jj2pvLsjWf6/nmgz/1T+3c0tT5KqdYTV05ultlnG4pJxISvo++h6WY8tcIJbNi40oN1EBoZ
 vN5/aY/F9uPkyLprkTvz6HPxqZ/0NIB/C2sTcljD8ter/GNA9Z2/75dFGABOmjU4haioSpMoJPB
 XGkWgO+ltw11AwtR93eKXCpAEyUPKqTOEHzycNPRF94I5QkLgy4UfawAxer8zXrMzNMX7/vAexh
 zgw4oNeugYIqnH4fOixW3bh8ZIcu+AEtYMOJGybF16C23SLMvnda38mjW5VFu1WrGhAlTNd/vyR
 Z70pSo7bCQrdFYqHkA2v26sfzEtJbarxGKJDwto82hi0cJ6X92llXWswG/1SDfPblF8eBeOHoKd
 SC3vc9UyQpXidLYbD3g==
X-Proofpoint-ORIG-GUID: 0Xs2gcm1a8j8WgN6Fgo1aoQd9r6aEUDx
X-Authority-Analysis: v=2.4 cv=JoT8bc4C c=1 sm=1 tr=0 ts=69d0154a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=6H0WHjuAAAAA:8
 a=Lmd6kY3naWo9R1DdeU8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030173

On Fri, Apr 03, 2026 at 05:00:24PM +0200, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..1c045743ef77 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2289,6 +2289,25 @@ scl-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,milos-imem", "syscon", "simple-mfd";

I think, the latest trend is to describe IMEM as a mmio-sram.

> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0 0 0x14680000 0x2c000>;
> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +
> +			ipa_modem_tables: modem-tables@3000 {
> +				reg = <0x3000 0x2000>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x100000>;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
