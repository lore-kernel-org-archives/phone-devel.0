Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391C2C327E
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764114622; cv=none; b=X+JmKYftxokO/kIrYrEYcn/wLCfFpssyFXD7M8Gmw3gM6VTYC94hzs4fhJmwsZFDq5iXnebDM6/9bgyQoH8xbPP/QX+NIAYJoZvwGrgmzJfHhv1CbpITAZH7ph0FmvmtzcO8a/hFEgTFOT9kJiKefNY7X+/30Pc1d/2DDNs/7Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764114622; c=relaxed/simple;
	bh=4mItPOhvM4H9szT6+05D7vYa4vALVB2DafudfhRro4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNUM4SvFkqkOCN38CtWuQawoy6bK+xvpE9zuvMpDoJihMvfgbGgKpnqPQOqu3Iqw/6j8PCpkNXOU2sNGOnwKOCFTog9UMmncNPjKI7TNzQ0W8c94xWpue0fZt/VKp/y6Tx6Lc/iw+pQ43ePRzGdJJbi2x/1t3Bi0M9W/MrEk6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFZqkUJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpRzVpGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFZqkUJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpRzVpGP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGeDTf2655357
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xq1RuV073OvDcWKqZ2e+3llv
	d9UwltD4sYrYTmCV9XY=; b=BFZqkUJ+XSm5ZbUtoE/g4owbq6IGAx2etl/C2Hf4
	dNsT0IvhjeV5ZUxrzqxAnWgZB2upx7GYAm3Ac3iACm9kCnjk+UaVvhtq0bOWwapM
	SqwW2zkcl9wRN7oT92+7n/NSOg/AzhHBz3zkcGRYuAvPoSxmqsEpUFZcP18lhYAw
	18zOZXnmLWZQjs5tvpUI5NbvWyFS9M2u99CFy/NKGQxMb21JlYYcrveGcOsUh1gX
	HakiReXr7kCls/BxHHRVZj9N0JCxhxkDM2Uxlxjx43iY9vMzZW9BHQr1pbKAtY/n
	fRu4CmRrfatAA3r5KNBn/9/6kWd9yzS4tDPAwT9e2Byi4A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxtdxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:50:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88237204cc8so139639906d6.2
        for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 15:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764114619; x=1764719419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xq1RuV073OvDcWKqZ2e+3llvd9UwltD4sYrYTmCV9XY=;
        b=BpRzVpGP+jCWupwTbswmmItrjN+sHHOpC3VKcrJXRUzjmPViBK5hQX/+QVQwNdeARD
         +AWkoIU5IkZTMfuqHxI3hMyOIJcUcFv59iA/6Uk8NP/0b/Gt2kUzsnZ7rT/MLaTtLuTj
         AaOvUbsJQGEV2qxgsnc0rDzTtg5hc1FAmr1B0odKwdPwpgq1bcUM9sxBNavdqzjtxbFX
         FU4QoUVLEHCSynzOywvVlsGPjsaFzfI9Di7KPEb4hA0JfE4SoOMM79c9x1CI6KagCLoh
         +V0lbN4GQwo0KZEFUCtRaHdIRMgV8EMe+h1HTa2PKX2k7lCVNqMhOekOv00IJY2MtI1r
         oeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114619; x=1764719419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xq1RuV073OvDcWKqZ2e+3llvd9UwltD4sYrYTmCV9XY=;
        b=hwl6nr5oFo581innrDqoE8GSe2HbK9PrVmCIwj3eGL7fphvgm+xeYbdYPpBqUAth2m
         Bw552/a7ySwkThjBFMQnF+2jBXwRLiA/4L111SDc9Q0QbXxhYTl7xLa5irwWYcAj9Tz3
         64LD6g/LXi3FGQYjDMFSrRYXi693zL8MdqoR7u3g5S56XsnvcZlqXsuOSgxsRHJ2L2hP
         Qw4kjhcBS0nOpKxWfEEitnhd7uAoScyCDgA7oZN6lP7BL4Xbnqw88qGfzUdZLUkOhN19
         W77gqmIU4JZ8WSmVPHzDuK/7UCSIDtvPLwI2wVsSZi7eqNCkQF4xi7UzBWNZ5OzCi0ZD
         prIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrdBC/wDRQ72x3IMxoMvM7U5IxmFNoBRXa/OZYnplO+JaJGNxvJskPCUaj8jrxi+0pkedtinAT+pZsVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgBxkTtLGRe4gkBpE9LubuUQjseNv6EsFClQJgiBAwWJhrcfLJ
	d75lSHe6mweuLH/YeObS4AFqMgA9i+PDIqiG5ZOcYihAvDh2DTbrfkif8DUk6wtTS9wr2o0AoKX
	ZnAp/jZt3moT0hxjHZzLtJg0pwFgMQuwKI9hTPvZ1YM3Bo+RLNHXnLv362/E2wJNRYQ==
X-Gm-Gg: ASbGncvZvhpoW0EzRBAU/qEJBCTv6aBF12sEiaMEtd9C5r88TcCSe+9r6xlLCopYTxq
	SjiHw95H/QcC+sveBhBmJV9o/9XVV2r2H38LXZGx4eCOKZEmZdZpn4a/fYg/TAf7/pmKeiZNGwj
	GBtniDmXtdssm4G1kdWiEoUzB0l6SSavABcjK+Tg9S0htlDT7Ooz/4dZ41NmuGA7AKTScgzwbVK
	QO7IhFnoZ86DivbQW0ytS2sUtmYYH87Oow+gHKW5dVg2KML9LVfyGZdFWKvXV/Qo11hPv5kye0y
	aFJEJ2Q5fiXz7wdV/kEVzJ6JIUmh8muOS8QMXA/XERh0Bo7v34PdSGENoaBIskyQpn2y9aBqmwh
	GEI35FnRT8//4OM49piSMilh6FIrsAGhrsHsgrAAwmnGT2QD7xR9bmnPB15MAYDSI/qc5HEwWSp
	RU6LpBukkBmkLeGIOj8LCFu1k=
X-Received: by 2002:a05:620a:3911:b0:8b1:ac18:acce with SMTP id af79cd13be357-8b4ebd6fb56mr668259885a.28.1764114619491;
        Tue, 25 Nov 2025 15:50:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIdqta4ZvsH5V0RHO1Jej7JHnAWnhFeOtY9yU8aPhrA+ex3IXH9w7nl/oofzNRmRf+uY/Agg==
X-Received: by 2002:a05:620a:3911:b0:8b1:ac18:acce with SMTP id af79cd13be357-8b4ebd6fb56mr668255985a.28.1764114619045;
        Tue, 25 Nov 2025 15:50:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6bc8a70sm36770271fa.42.2025.11.25.15.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:50:17 -0800 (PST)
Date: Wed, 26 Nov 2025 01:50:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 7/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable
 support for battery
Message-ID: <mwe73kw36g7yrvehou7vel3x5jb4bkbydhp5pxssgxbuiazhoi@63aml5s3luwg>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-7-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-7-dd3791f61478@ixit.cz>
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=692640bc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=nFx4E8QWO6DfJFsFCysA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5OSBTYWx0ZWRfX9JkmmzL64P2a
 uyoCYK2BBzlDohASFIXE5cdENLss9LK9DkXTWuXjfPyBCmQMg4an3Akmy0IJ+v1boYVbGJ9xtYS
 /pPjhCUZw4D5T+eRfS0AnM0QFaBtuG48AZUWT0rQUalWpthSC8g7Kn2bP4c8I+bMz+z7napdyoO
 XXh514ttQBm9jogZknQBTFkrKwaJ3VmB3QNEZ43bYGXSI3tPIAoTk0n392WwPlHHH3MTOiLhiIW
 LSSlXGLHbZh3btUp97dosF/Uii5s8E4lLlMaFVjb4A/M9kOfnYv3qp/HJ5uSheplp+nM/qRwkUO
 wqPWLBeXgZQn5Mm71I8dBQPsTdvt6n+qAWDeEjEAw==
X-Proofpoint-ORIG-GUID: gQu2U5J0NIe4tSMvSlwVHbkFq-Zby9sc
X-Proofpoint-GUID: gQu2U5J0NIe4tSMvSlwVHbkFq-Zby9sc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250199

On Mon, Nov 24, 2025 at 10:53:40PM +0100, David Heidelberg via B4 Relay wrote:
> From: Alexey Minnekhanov <alexeymin@postmarketos.org>
> 
> Add support for battery, fuelgauge and charger.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index a9926ad6c6f9f..cb89b88d887d1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -38,6 +38,14 @@ framebuffer0: framebuffer@9d400000 {
>  		};
>  	};
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <4000000>;
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -93,6 +101,23 @@ &blsp1_uart2 {
>  	status = "okay";
>  };
>  
> +&pm660_charger {
> +	monitored-battery = <&battery>;
> +
> +	status = "okay";
> +};
> +
> +&pm660_fg {
> +	monitored-battery = <&battery>;
> +	power-supplies = <&pm660_charger>;
> +
> +	status = "okay";
> +};
> +
> +&pm660_rradc {
> +	status = "okay";
> +};

Could you please also add a patch moving &pm660l_wled to a correct
place?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +
>  &pon_pwrkey {
>  	status = "okay";
>  };
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
