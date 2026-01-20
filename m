Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9F44104D
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918380; cv=none; b=TzunH/D7XwoIgSLGnYnCxelzXu5nOM7uz0Sg6VZUoSM+i/A58a9TXrFDPsIy9zdW4c1p8SqIhzA5vmzJRozFnz5w0qwqgXFfVoO0AoqrH7aUegzYoMztIc0DFoB6OKSmKliMt4ZONUyQc77VpD4wuIb6VaSmR8QXaqU0FFvrx/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918380; c=relaxed/simple;
	bh=YisKAKLmsEzq7as9dr6tbJOdgMgNjkPbMldhfyvZeIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqQRAyZF7YIZnFClSj4zu/cCpAoKvKxZxOJvY8FBeF1YZYCxcqW1PT9frL9o5qGcgZYE89u+OankHzD2kQ1xvhTQcZbloN404xP9qG/ydcXuvhrAO2CRkSJLOkxQoS0kLRCYPqM9MpsbOxF36mkvyqvpXWC2HDrervu6SHOgj40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqSZX06w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzoCPsYi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqSZX06w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzoCPsYi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KD9aRJ512332
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHBfsKrItXne6uZzgw/96JIwvuMEC+kFda/9wO1JJ/Q=; b=LqSZX06w8/zufVqy
	Pmb5AdcwYg9oKFdBNypfjr8ReB5v7hZJGnZ7yNT6e0s5AVtPzL8e3tfVQjhDgiqh
	uIfgCI1xM1nn9fxNgK37M0TzoUKtmNCdmmkx0FfBHLq+IGrLv/pyHJaeXQMCBfly
	BbNv3j0YLtXdpu5SPuWZhqbQ0pnpaFsrZaVUS0PV6UmVFMF6ADidMHRTYY58rrK4
	5Mx26jiklWOr87QA1Qns2Pf3G9+yPrBEEJvB5pHPir1MTZs26ITWfvy4lakrB7qw
	G0vO0iT1J+ecLAKkQLpd8HqxyBMINPxn17ch/vGCQuuISNbrlVleAvhHM4u+fl5H
	SJ2OWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btabe05tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:12:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c532029e50so181057085a.1
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768918377; x=1769523177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHBfsKrItXne6uZzgw/96JIwvuMEC+kFda/9wO1JJ/Q=;
        b=HzoCPsYiUd0eKek8c0pQWRdy8fI8P8bzDj6QcuDPrmDHYZobfSsj8iTdLs9u6cQcmF
         elmrk5QJjiXKfLatQ+RzyK3D24UAvv2j99qPCASkmNN4FvzM76jpcTzmpbcsZ8IWLu9t
         ZfoBiFXYlN6FguWynNfj/ORoA0ikdZ0qboeEgw/vUYB2baJqz6SG71rRLVriR7Qbs2DS
         OO+Q4fMcxp5+6LRfxGicmBQ0YyoGG8mPOq2ySXHd87Idly3xcQ5daphogNgMCxPhLX7V
         43UcD227g2cdlz/4vWDWCrYnSqWd8MVh7aHVs+Oh9QptOV2Yc6t5xXpl9zoESPRINehR
         d2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768918377; x=1769523177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHBfsKrItXne6uZzgw/96JIwvuMEC+kFda/9wO1JJ/Q=;
        b=TKNVLCIBvvx0kYyReY8N3PHjFYmvDkYB7r6GUwoXILlvIyXWiPH6WEHCt2bER5IDbl
         hKXru/3BIyJ4NN8d11lhZbmaaQQ1d2rIbS8YAR28dsyGktocscmSqMs0pBdZpRoTrwHt
         4jjH5x63w6wn2Yh/QKa01/Kj3Im84TmmQEFW9plHwvXvdtyvY1q8hBPoK7cm+oHUWUer
         LlgNDxiJSby1IqkDm1v0gZBTN45XIistxF/VDo7YQC9rNcV0x3tzajLDkmUDPZn8ubVQ
         bqeE7I55ceSCf2/CvH189zvv1KqkKqDUyMuPfdEpuXASR4NxHZkI4gw5MufI4cjOsoFW
         0hRA==
X-Forwarded-Encrypted: i=1; AJvYcCVh0WW4SymZgm6rIW5m1iFFOoqYh2ibbpRr+G8uQe4HBAZXAfH6CbGDc0twktQyv418btD2XmTRp/NHog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy40Wf4DiJUwkaR3/5T2QZNm557glcGzfjmPn62DrBVxxOZLOiD
	kitWAjtE7kkIk5v413RXYVwn7ofk4kIWvXiFtARnP/ngNLVSTDZdS3eGN0dFQFchUZN7E6YlroG
	YIGWGhshMjj3FjT4+9Udpf0EjkH3Uhh+SS0YRnxXfaiT1F6NsZUOAOja0Yk3dt4YaFA==
X-Gm-Gg: AY/fxX4jcBaetBnp1l3hDGujsmFsYjBu0C4M6mRRFidQZnimqCMRbkuru0Rm9wKKdIo
	ZUupPbBRVjbJix5IwmpoAgkO3JxnCqUCEMzvU0ZVSQ7f8ODKfHf87x8TmyAfkwRr3DfldWXhPsn
	w+xyfGr1+iXw3SzPdDKG3IgUgj61AFrR9wFmST75tzsY/il3KnQF7rrtitN+7x05Fm3pR/Lxj8H
	CjGJSYd+/57AxeYLgnIAT6mPvk75k5F+uA3FEgYX3m88RxXns5qODqS2zGXpDgMXmo/3z/Iipuq
	KkL0f9oVtQVd4UKyeEzVFhEPBIK6eBNCv4zg6cc0SpGUG9IBuPWb7xyZgSWJJ9zOFYTZ00krbjW
	Wusv3GTZVLEolc0l8QJao9tkxMpKqUgA5Qszo04+lR/bHWwyuppxGR3f0quAV6TM7hUI=
X-Received: by 2002:a05:620a:711c:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6ca3a8fcdmr320036685a.1.1768918377274;
        Tue, 20 Jan 2026 06:12:57 -0800 (PST)
X-Received: by 2002:a05:620a:711c:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6ca3a8fcdmr320020385a.1.1768918375214;
        Tue, 20 Jan 2026 06:12:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452ddfb76sm13260091a12.15.2026.01.20.06.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 06:12:54 -0800 (PST)
Message-ID: <41840083-0cf9-493f-a9be-d671b4d59a0d@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:12:52 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: milos: Split up uart11 pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-2-27b4fbb77e9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-2-27b4fbb77e9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D7GHyD_6YA51R3z3cKYcyK3secUvhLjj
X-Authority-Analysis: v=2.4 cv=Q43fIo2a c=1 sm=1 tr=0 ts=696f8d6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=yynwHhEk3PJQGNIDankA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: D7GHyD_6YA51R3z3cKYcyK3secUvhLjj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExOCBTYWx0ZWRfX6hXa3AJHkB8R
 G5TXYr0zen1zKlOton0CEGTT/n5Jks5/d4gIPW80Vsg7Z4ZK6wSkcDwzBNwfVn0Y0TkoTuthbai
 e5wIcYmKdjLynt81KQf2szdZIgE/JwngmaSliYVA0h2nYmF/Yr3tATLVSMcsUxsTs8qt35i6Sa6
 3YssoUSmQsO2J4Hsybz85H1L4xJGrlp7B+nmt9aP0nLgJE7zESUsasQ+ICP4Ek+2BFHamEPJUVW
 KFBHlg0XwARzKj+f1YrvBipcUHtf0u6N4gf1cuW3W5y0NceHyomzWBkw/jl1DxiHaAsTRvSCaSp
 /EXPz7yjXYW3RcAM7MQoke8EcMCQ3c4cX7Ms7rCkHpBAjCgaRyhzxfVelsHA0wYpiZb9u8/gm/d
 t5dZk9ltMrDXE6mDpVBsP+iNZqMAwykNHg9CVMuQU3tqbH0TUQ5ihNRZ2d88LVPkcxdS6wRiO1h
 mbX2IuKn5keItU6ratg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200118

On 1/16/26 3:50 PM, Luca Weiss wrote:
> In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
> split up the pinctrl configuration into 4 nodes so that boards can set
> some properties separately.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 0f69deabb60c..024e1c9992fe 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -915,7 +915,7 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
>  				interconnect-names = "qup-core",
>  						     "qup-config";
>  
> -				pinctrl-0 = <&qup_uart11_default>, <&qup_uart11_cts_rts>;
> +				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
>  				pinctrl-names = "default";
>  
>  				status = "disabled";
> @@ -1835,20 +1835,24 @@ qup_uart5_default: qup-uart5-default-state {
>  				bias-disable;
>  			};
>  
> -			qup_uart11_default: qup-uart11-default-state {
> -				/* TX, RX */
> -				pins = "gpio50", "gpio51";
> +			qup_uart11_cts: qup-uart11-cts-state {
> +				pins = "gpio48";
>  				function = "qup1_se4";
> -				drive-strength = <2>;
> -				bias-pull-up;
>  			};

I think the best setup is

qup_uart11_default: foo-state {
	qup_uart11_tx: bar-pins {
		...
	};
};

qup_uart11_cts_rts: foo-state {
	qup_uart11_rts: bar-pins {
		...
	};
};

Since  there's a lower amount of references at the user (default vs
cts/rts still makes sense as that's a wiring difference) but we still
keep a label for customizing the properties

Konrad
