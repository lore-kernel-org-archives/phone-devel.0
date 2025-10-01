Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690027AC31
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307366; cv=none; b=GRcD1L5MN043ezXrqs0epOcjT1wCU2EZl3nml2CKyVIxpkzq0OQlZRRSa0EcnHyAGNU3YYl9Rk32jbv+76nvmt9JDm28dOPyWWSBqh4zlzFpKAaUhXi3JWtIJM3rNzZoknaTxNipvGnfEWEKRLP0+BhzGkmRfz3+jzCsBVKf81s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307366; c=relaxed/simple;
	bh=GJyYeYBHgy3xU5bBVM/7TBQUpVqwyswe9ISkR//AIrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IzLc0zj2OrT+ebsRbd44RUrNK4yv+30k2WNAbwDU/3f3fFFUMBN7026zWTjLmcswpUwOQ5NNRZmGMIMJyMLsi9rmilMmEwOIsWblVjV8YmKfasJxtCNyWwDK4d7i+jGZVhQQfcg7LsIH4TkThwoQ/ffaptBeHkO+0TvskG+VMso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKeOwXXw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKeOwXXw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ULoJVI030669
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 08:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tlGyIBE+5l5QzImcJDdIrFcGN7HtYMPqbdjDmPS9GTo=; b=iKeOwXXwxHqn0lv2
	S89T90rOjaSXW1R50jxrbHh8M42QKQcO6KDkTqXh042ZYQuJOfcGQy490v8NUkL/
	vgu0NmGD0DhZptmRhx3HthjkVRzSCu288/T6npvjXOSOOo9I9z3cNx+tszJDXt+R
	2vl2/FqXZUop/VnyX3pX9NKnMWPk7bOoy6QbOygHMh1MPzeanAXuR67JqZbVh6vf
	CQG2iPwKZ22ecLXE+03NU8n/u+SvPvEJbCCkr+33wLpwfxjT52BtYMFKXecMxmVS
	t3FxKnj/J0Jo3xh5ijVCfpnhMewCZZUmzK322iXdcnsSwRtvPyRR1CJr4eotZdqa
	KP446Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdkm59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 08:29:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8572f379832so185130885a.3
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307363; x=1759912163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlGyIBE+5l5QzImcJDdIrFcGN7HtYMPqbdjDmPS9GTo=;
        b=ctFAGalpsXeNZjpdA9rWXZVcBvX3UnQLatUY99KP+gnEeDZ7KRrctth5rA/LzU7d/n
         pRkVdTcR/4IkOyU+f5Jx2vf0xLaVFbblJtDRiJvzSe4yrbUY5WPY6+v0bkKushhDYyIU
         2nv0sNqKU+d6td7ftdGoO6hzT3nGYfMbQIkcK2ImIy8UcOqvAsQdq1FRGJq6w4ktJ+xN
         iYHu93/1xeqb4N8AMy7Qk4z961TH+uQb9q8b+jEvqGHLZ2Au9vH1oQWhFHPkEjrH4jkg
         Fo28fzkGLBt42b+6wXbUqlj8IYJLh9pjRJa3S0NuEjyIouRQUqlI5wKdmENHiNevvHeb
         SNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/LIZqcEECYT5NRtrcgjYaZQ+AJjrf4wm92XTcj5OK3LAewkgtfmJk+YKAzPunFKAsVCw/V5XCksfYMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqlIW6HXfGlXXdvd0kXNl9u2hJbbDG2G/scfGGgk7DyV1zaNVJ
	mYwf7mmIx/EZrspz0gvvWUAGQGFCpbWsm/rWqAkUwfTZSQs7rQZDtxY9QKA7oudFjUyk1wLGrDz
	rb7FsU2l26uq/cjkDwaj4ZIa3mqyQ8Scn3qQzVEGNUfmO3DwrJmo2J1vB2e+R+AH16A==
X-Gm-Gg: ASbGncsEIY9fF2cZCHOQJGnj2/FXyCnwhIJBdtMgrGQ/HfzrSJhgGEsGSzarySlTMW/
	JAGIDRtcqz1M8aPbBQRz0skqTbbmqbcABjDF8K870Achw1qalL2LQF5fPbxrRLdVGCPeqzZTPLK
	DmqkcGGkf+Y0L/NCeCGN+NTgIq7Owp/htiGPnU9AIY+weZa58wcvZ9iowqKunNE+oMKqkRmbF19
	t5nTewfgGDVkIpU6x65KpY/tR2ePtGPDmR3ltarw/9tUvW4BmL3tanGJCLK821G3LtWlEmZKYE+
	RRFEJKKwdwafJxH9XA4zdLVCBrgBx8eQOOP4zI1nG/HTlgGS2t90TxtqRU4I+2B/CdMBkQtZ0kf
	huA5VIRmAqFDEVwIvAE2PepKUGnY=
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id af79cd13be357-873765c02d2mr260636985a.13.1759307363468;
        Wed, 01 Oct 2025 01:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIHr/OLBZEdgkn80ZN1dE9xO81kbu8cI04yKLGhC2XiEY6aWxZ/xP+utxgdYGLZbef2R3pXw==
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id af79cd13be357-873765c02d2mr260634885a.13.1759307362978;
        Wed, 01 Oct 2025 01:29:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d7351sm1332312266b.7.2025.10.01.01.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:29:22 -0700 (PDT)
Message-ID: <fc5d2d9c-7200-416f-ad89-4c1907e313c9@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:29:19 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lOiHuFTEYROziw6IEcvqi_VKwBXP-v9X
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dce665 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=RgqGmV79IvFMSyKAuVEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: lOiHuFTEYROziw6IEcvqi_VKwBXP-v9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX/ynr+H2s3EJE
 Tgl+HCO22T5sEx2dz2K52CLm4aywct1BQLWsMQ0/WtYtVvcygNTjr08GPUdlusMWGyelk+ndyh3
 6PLDN9ZdUK4PQETfoeaYyZIh1LId7iNFWcMph6A5KRx96wuxZGJkA68hgD47Y3Wr4FXMK7/u/kR
 N8x6KIEU6zWK31nYyRAxQBg2XoC5tm+BhF6RCM6i+6XU5TNXdmGOFQYmea1eT/uIR7VY8/OIR1g
 8PK3MyQKQsE3Ap1uMSzflm1l03Rk7MvN4mb9LWr3/iS/xsvIot+T0f20G4eyhXZktXE0XsrarEf
 MtDjkTA2d/PyG9L5LS9t0E16bFBCpKuEn4iSDBXRSAZ6vt6JfnvwT+2zKyYmUvnejUfAHmpXn2Q
 VBzYCw3YhyhxQiB8MyLPOww4JJ0XJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Luca Weiss <luca@lucaweiss.eu>
> 
> Enable the RGB LED connected to the PM7350C (PM8350C).
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index 36cc67469615974c193ea3a9db1b2362869d56bb..b4c69dc50ed0f0b3cb45341a01c89210bd261993 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -632,6 +632,33 @@ led-0 {
>  	};
>  };
>  
> +&pm8350c_pwm {
> +	status = "okay";
> +
> +	multi-led {
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_STATUS;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		led@1 {
> +			reg = <1>;
> +			color = <LED_COLOR_ID_RED>;
> +		};
> +
> +		led@2 {
> +			reg = <2>;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		led@3 {
> +			reg = <3>;
> +			color = <LED_COLOR_ID_BLUE>;
> +		};

I assume you managed to confirm these mappings are correct.. sometimes
they are not what you'd expect

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
