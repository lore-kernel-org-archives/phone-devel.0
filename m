Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8242EBBB3
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764112608; cv=none; b=hMTLVxL48zaCzqlfid2CpDRfoitBtAr9hDhSFq5X2LM5kTJTZRMvUOM9rEEimfyoH5ubGXiUuoOb4z/Tz/Yx2ikjh/lzJ9C76u/rpUJxxKkjIuXmEd2t4WVvV/wI3TKFujbAeaktUclAshKWX+g2+j3gr10G8qfF3Xjs509P+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764112608; c=relaxed/simple;
	bh=oUjqNTyOrT3EHiuqSjp80XkHCfo8q6zGxTvsTRH8p9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnpzAsUdeMT9io0Er8q/KX6Jt67bK1L4X0QKIuqoLbEkyJxNt5fPS7Fy3C8Oi2KUMNgSDvS/iI90kpo08iXw1HGmMRQLLU61BI1sl9dTSk9eyrwqpk6w0/JXc9wFSPTV+wf4Oyp1HuEvUPIYPGR+P8HGZ9Ej1BUeNklwFEfkbjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=il8HerLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmvpXEp8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="il8HerLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmvpXEp8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGgJTQ3587377
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qzuPqlmp5yspaITbhEZIU/AV
	QzJ7g3JoIGiJ7SmJwX8=; b=il8HerLAlNbkBjZbCalCi8M7+cmdMlZ4FfjzrfDq
	oh6ruhBjztIM5EHvSNpV8XUMeyC+4Nmas77BerNqQZ//KBL4r1bCkEKUCb/LjfGM
	XxdRguL5Yjg6UlpT7p7zxUodSyoj7NKlzjKRbmsneSUDRD8qaN9MAu7CQQAkjM1w
	o8a+FqaUHBB/dYsB0Bpx6EQotTB+BmqRQlTD0NBPjaAkABNWZLRSm5JBqugQDRtV
	3zLiaFFWjL0t6iIuadFRkyifISfbSUgnapl4xkaGuoKP9I+1ELf2sMCu17BEOVFx
	3QMev4iGnqjD2byTDEgJiu5/q0jbwMXkOiqBtGR6Nj5aGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang790xs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:16:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b24383b680so2089437085a.0
        for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 15:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764112605; x=1764717405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzuPqlmp5yspaITbhEZIU/AVQzJ7g3JoIGiJ7SmJwX8=;
        b=VmvpXEp8jIanqUBbYjdNRmPe5ULA38GIRjjzkid1hRplIHDt/HZLICaW+A/FXj56D+
         0O/6jmrM4C8H0hoFYNUNQxaeZeY3icPSN9fv71WwHldDFyBzZ8aTHJo+/WgQ+N87Jvei
         r2enMAhXh6OfwE6/mfqikxa6F+vMk3dSY47OebYtRTYL5XNk98gqpAWRzIwxKe42fIG4
         WA+75yXmfsJ56uLase4w8igPcqtWqdnLliBZpmjgWwfcfCVqzUOBL7oYSS4REAhb6mzO
         lKP0JX49brMKKSJsEo1wk3Xjp4sRkjbUSTxjKcKvfDmMBXMHAuNrKaYEzjVb2CZEXX1t
         7uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764112605; x=1764717405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzuPqlmp5yspaITbhEZIU/AVQzJ7g3JoIGiJ7SmJwX8=;
        b=kYQnz4GFjHhT47lvR9qgLUS2TTcCoPB/ps/yDPGEYW4dJw+bYk7YCLIAKcq1C8NADi
         p9EphAHk76CSpy5s9vZFzi/BhY/lNtPFbKik3hYfpqgbzuMWd9PpwMY3fGkeGh6ahFBa
         NYwnXqONVFfaGIiqcOv3Kuhhfx0vH4ZgLxvaeuILLdFiYHYlyyu5gZo79eok56nhhnOa
         c1waLFLzP1b7eMIy3zJjJzi2ioXCME35zMDX9P+u6bU15N59HaAGwf5LPaa2LALXLmSZ
         nLWl2NrjjPsIA0H4uZWyZL4Vl2k13PBE9Q7aN6TMPp8ADJPQphGj35OVQSAQpIvU4LwQ
         jLkA==
X-Forwarded-Encrypted: i=1; AJvYcCXF8cBdWexlf8l9AQoJs301pAmHRxn5edy4m9nHrj6bbRzqePIvU/qN13OlA2dj89DfkIKdSK61RtLesw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyLaZReABwAzdlA0yqB/osk8OtHX77frUAgU/WwxVo8PQWOJ8A
	0Lqw266nZ7Su5czR0CJxmNWP+gW5MuMVHSvtz1vN3NT1qtlx4XhBA9xabE4dQM7nxETLObRS7EM
	O8ku3pSYLzh5X+v1ECQUjjGe7dfrVL8FDs4TWgoQr04IEcz82PejKNMwha4odaHO1Tw==
X-Gm-Gg: ASbGncv8ifqMShSn0g4d6gQ4bF8N/siUPeJITSeJeae5SfdypTwD18X7YOy8tlNZbnq
	q3c0MJ/V2F1M5J/g4G8ypHohj3dYkuYrruSnJTlWE1PdMNifOTfg/xRE3JcvK21jY28q5ux8gxD
	7wpinkuFxeSOmS7XUQJ4vBe3qF/cyGim9czN9QxNoxgHJge0iBbnMSYoL8MPRfB60VeUesnemUB
	poreZYSqvLPpxIg0JLmNOUCW+zljsSmT7tiyqLeICtH5K2C0iu/TQLSrD/y2edwqP+NU2PsVi0p
	ejcMQITXf5ahvOfC5WtBnkajJKAH9yXZMvI2vhC+jjSXQYVH8sElkft3BfMP7nbcqRWNPf3BDIg
	STv1cr9pwRJINfhRjz63O5Ij0yfxL8o4Fip4NmNT4Rb3f7o2v5geznM+89MmNQMRbhuJAOYrSFa
	RPVS5PEg1IN0G9ejegP/MBHEw=
X-Received: by 2002:a05:620a:199c:b0:8ab:8037:509c with SMTP id af79cd13be357-8b33d2038edmr2346172785a.12.1764112604941;
        Tue, 25 Nov 2025 15:16:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+HwF6A5aw688UzGyQxWA8SToj7LCNYJA0XBbuNKVFrDhxYDYP+yoHB0s5q49iY5XwzrZ1Qw==
X-Received: by 2002:a05:620a:199c:b0:8ab:8037:509c with SMTP id af79cd13be357-8b33d2038edmr2346166785a.12.1764112604488;
        Tue, 25 Nov 2025 15:16:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5e07sm5457657e87.83.2025.11.25.15.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:16:42 -0800 (PST)
Date: Wed, 26 Nov 2025 01:16:36 +0200
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
Subject: Re: [PATCH RFC 3/8] arm64: dts: qcom: pmi8998: Add fuel gauge
Message-ID: <vddjrusyejecaewsienryiz2tqisuexlw5xjyhllyu2upnr7ho@ualj7rliu4iw>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-3-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-3-dd3791f61478@ixit.cz>
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=692638dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=RBDvnDhvgAiZZpE4MIUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: j0UPlQgKdjciaztK0XoTloqX9s8KqZkL
X-Proofpoint-ORIG-GUID: j0UPlQgKdjciaztK0XoTloqX9s8KqZkL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5NCBTYWx0ZWRfX42oHEV2m95zB
 NFW9iiBafIVE4XJVbTGtMPDk3MapJcmlqHRM1LLNZ2UiJW8IbUXlx9/BjtPNwDWSI7Ux49dkafU
 s3+cblPpquntrfNaTjQFa+6TSHJwIictqTisbXvUO1t+dz84pFWHh0pfZK3twEODIgKAFUA+I4I
 LVDw4Gj1tI7thXXrxkYvae7phoPUAXo8uu5QOCsDawP3xjmhkg0i7hq138H8GIsqblw9bGusMIp
 GX7aE43aZ7V17yJuuA2c/j4ESUpTx7XlzxqzpyExQ6EHNXMXlJkOoUOjtngKp9GzXVuzOlp+N4u
 +DZmylGdufQPCUS2YYx3opDum/ftlD6A176BKNIr2+DHhwmbU52e+qnPeEfqKKhMv9sdDTcGLBf
 aYLGhMcODxx6zguajQdiZ5lrkqmggg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250194

On Mon, Nov 24, 2025 at 10:53:36PM +0100, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Introduce the fuel gauge node for pmi8998.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Again, missing author's SoB

> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index cd3f0790fd420..ab3bc66502657 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -44,6 +44,17 @@ pmi8998_rradc: adc@4500 {
>  			reg = <0x4500>;
>  			#io-channel-cells = <1>;
>  		};
> +
> +		pmi8998_fg: fuel-gauge@4000 {
> +			compatible = "qcom,pmi8998-fg";
> +			reg = <0x4000>;
> +
> +			interrupts = <0x2 0x40 0x3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "soc-delta";
> +
> +			status = "disabled";
> +		};
> +
>  	};
>  
>  	pmi8998_lsid1: pmic@3 {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
