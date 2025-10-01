Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4F266B6F
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307456; cv=none; b=IW8I/37L9YiKuL9eoWzkHC7R8hrVG8sp2YJZuxemn+uIo872689S6rPxpxct4SXg/bX5F0bJHq/xTcOTM4Dl7dE6HlMuqEqVS/VEJxkvAszi/oUjSw3VJ8rVStgSjZQUDtdYttUanTntAGHOnCxKj/Xahk9ZNM64zbL/4ajCNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307456; c=relaxed/simple;
	bh=GT0LRKWWLolOUjYL+JFNIRty+gSBWR7OB009rRCYzxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+jpDKNMq2R62x7p+9rNlWLP+shcq4el4DpVcJ4r+WNWqICGHjepMB94Pmkmy1Hau8QXc8dFApbuFMwApXn9iDVGbd+Wro6innptnEdN0eBKmZMSH4KqdHgsq9EE4hBDBo1Q3CdBL+eHFSLISFtzb8FzDzMufyDj0nOwcpVNBcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnHvYfIu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnHvYfIu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKqpQR027451
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 08:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cjzm3emaoXKpMvDV9sAM1BbWQ575XrXlSZCnkzdhJSQ=; b=TnHvYfIuBM1/HTJz
	8Htws6ocSLKvpEojwbVzmqEr/JXECJzUOe3ZnsVGtsBIk8PRy6zkJZsWMqtGQMdI
	ikgHwZ8WTojLkgIKvkOBmhAhwOkb7DXXqwRak1CoqJtlI+72Crq3MSCO08EZffQy
	KTS2GcgAOPv+JTpu2JUFfEmC6zKLpSJuCLsguo/1q1Nsrv3IWmiCnHFvq2BT0Ypx
	Ps/VsW4qnsXFg9+0RyGtgOhrPUjsyvGXJTXxr6qQaUTwP/ko2lf56/QooglDDm+a
	djwZO3RNZtpTXbanB4aFe8GvP+QLH0c67uG6l29ysOYjbvD74z9O26YY2xn2wu7M
	gZTnlQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851kv4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 08:30:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-795ac54d6f8so10096136d6.1
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307452; x=1759912252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cjzm3emaoXKpMvDV9sAM1BbWQ575XrXlSZCnkzdhJSQ=;
        b=ovkvvrBVweXW5du18h58H7FdWqWSmML/1s90d6b8PoUGWOokP3jXZlEWmn3m2UXmc6
         JXyzG0esqIYhnV9cD4TllbSyfVMcQPEXhL4R2PIaEvG7dq3m62yxIkP59ihc8fru3rPB
         92VALMeGx3qZa3OAkAt8wgM/scrl/6d8kIY4bXNbAJXWSBocU1ba3+K9jiU8CbfPSKao
         L6OHwwdrzj0qdprlrnsW6bGWkUfcmNX4nJk22oniESJSeUsC6RKwXNtwRlEALsLslCvs
         r28qQ284/EjWef5kJTpILFZk9d4HqpNxCBT/ocV6TPbArzC1gtMcukgnLe+7mKNJvV6W
         hn6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSzvt/B2RYgMg4HAM+PnqZqKoMljXiETXjs1vrAscX5g9mK+n91g5F3LEjdvXh7Pu2S2v+rvSOIDVMiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8pu7gIBeK9FMoR5+GMEfCeFwtYc1QTMCZQz0yWnMlNn5tPpdY
	pxdAlqpj8rTSrkflI5it3cUdMZgSTCI9IVXqd0//uz+DDUPb1InCxIL2pQOVunh+EpOKvb8FP3d
	L0C6/iZaFd8yMkxXqgVTRfCCQXLxLb1AsD7PWAkbOanT+cBBdJ4tj4OUPFuQk/95avg==
X-Gm-Gg: ASbGncu4CA/OT+7Ce+tYkmWBeFlcN5nSgHUYZmoNNJ09TVZRZVGKORDO+BIjpPvShie
	h2cQdmVg2GsxaFbWKxadjGiLl+5YQ9yVPHLm9eJTZqSwM1G+87LG4Sy+EFXmuapODuoRmEp65yq
	BGOP6AptgM3UqVrXZpDtcud9izU0X71UPciPtsEohF0mFHztyeLFsnJNgbjLaEhsM6kgM+UQECQ
	QWqx78SkAWewFsbZ4NCdxZBoR2gc+IHBj/7mo8uUWvQNLnZiooK1B28pl5B3xJQinu4xdBYkqHM
	WrmMybwf0AnQMbRxD8GNy/FF49DYDfhor85FNKIGh25+UEkW9CrxleqsESUX1yEYZQO/8gYwFQa
	R2LLZeojZwTalluUBH7mZGzxZe50=
X-Received: by 2002:a05:6214:20e7:b0:7f0:787a:46c0 with SMTP id 6a1803df08f44-873a60f8fccmr24664326d6.4.1759307452375;
        Wed, 01 Oct 2025 01:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG822gD7rUPMNB4okaH11eXrfFzHLQWvCQu6RuTPp8JaGF3dxaajwDtHeT2MS7SE5K8lJJWuw==
X-Received: by 2002:a05:6214:20e7:b0:7f0:787a:46c0 with SMTP id 6a1803df08f44-873a60f8fccmr24664086d6.4.1759307451860;
        Wed, 01 Oct 2025 01:30:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a364ffa4sm11234059a12.17.2025.10.01.01.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:30:51 -0700 (PDT)
Message-ID: <ac1c0d1a-36a9-4542-b879-06c017f7f2c4@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:30:49 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 VTOF_LDO_2P8 regulator
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dce6be cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=_C6b-tzP-owvyH6gxLwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX+XlW0/LfewXz
 j1fZbIwxrWd0WOyF5nA3iwSXqucVXuVGf9d5iNdPKDg29BgvIklX0c5ldf0DShxfFmaoJnJ3wsS
 8DIlnWDWtO4pTy20Ip8QbQkKgTQSSBx/72NgfZ4WXBHnwUcPzRQX24poQMCn2arXI4qViNGR4L4
 Von8pAKuJY4l+pTNbKPdY/fYr7WH3XZVUz4ziWSryWeE9T8jd7paBEbQsBi78JNpboU1PUMsSRE
 4RJF8CNaFAWRorgq6dqFPXIOqq+K7+HHI+cRGfCYOFGmb9tWmuEDWBnWb8Itr7eRx7U18FBzh9q
 EQL+bi2ECaoYimybpzNMWhiro36P31oSYAcUM6FDNdZFFupJ8QruWqyF62Gz9n8KsK5FGPzS1jX
 Ulf1jaPVhWQwDBmla/B574R+GzLBXA==
X-Proofpoint-ORIG-GUID: DGH17iN8BAMWHIPCpXFrIgSkIaShcHVt
X-Proofpoint-GUID: DGH17iN8BAMWHIPCpXFrIgSkIaShcHVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On 9/30/25 3:57 PM, Luca Weiss wrote:
> Describe yet another regulator-fixed on this board, powering the ToF
> sensor.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb7329335704eee567761 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
>  		pinctrl-names = "default";
>  	};
>  
> +	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VTOF_LDO_2P8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-enable-ramp-delay = <233>;
> +
> +		gpio = <&tlmm 141 GPIO_ACTIVE_HIGH>;

You may want to define the pincfg/mux config for this gpio too

Konrad
