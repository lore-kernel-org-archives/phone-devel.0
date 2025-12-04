Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74713398F83
	for <phone-devel@vger.kernel.org>; Thu,  4 Dec 2025 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852616; cv=none; b=kKW4yrEZvCJR2vw0aNb6h4ZDpozAPACvtckuC7afMb41EWQF9aQlpUjKbuPznsNk1loG9LAKkkkY45bnqY9Ls4iSuTpirrESL+DWKvbFaU87B390EJOlkTb4PhGaTlOCOobEBcy+X6bMT/Pp769VY2zhxHcDQfYdBzRNG3FIJzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852616; c=relaxed/simple;
	bh=FU3jDXaONJ3Qu8x4iLrpnV9Uai+6z+hNT27rJb4peYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgZkBdJTfT1CVIlYurDuz/QjfQZHI6TaTNUnd/fH+pjc3Rw1+5RFa46HcdpwWjaPtov+z8dOtMz41clIqlzoy9ntd8OilD6BlbJTm5q8HYMr4SHLEXIhfKQe9uG0/UhR3P56q54cJXyTSRiAA4hOfCIbbYEyuUhNZxKgI9W6GbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwudHUFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbRTJkJO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwudHUFy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbRTJkJO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AvX4O1120200
	for <phone-devel@vger.kernel.org>; Thu, 4 Dec 2025 12:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oZlqMIh83DdLccdFdJGccPgvX8HsoEbNhhTi/MghckE=; b=BwudHUFyl4b1MDh2
	NdRO874cO0chG6n4d+Le3iNSbsk5Pw20bfLosY7SfmhFJBxucW0SgwQw5B5Fiap5
	13o1toEZRu4ZRqbxdIyORw0W7uvdE7Hu7+nKOocU0/xutcE64dFDGXfHqvsTy0AR
	33fvSP4QMthssxSOfc8BaS5VmylOd6LbQgUiCGIzr3qd/ZA4XKGxuNJqrQPuDehG
	GIgPEY5NfjOWzm/YXlrRSHyJUoXf9+lyrdjlGw6TE0+Po1CZd0OYCeyyIOha6+MD
	3UQudrMUH5gbV36zcpFDPxgsMybR3YYnn5ftJTogKq4RMZrpgHCRQy+ZFYBmGt2f
	Q4PoQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au90fr9g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 12:50:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b23452ec2bso4373385a.1
        for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 04:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764852612; x=1765457412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZlqMIh83DdLccdFdJGccPgvX8HsoEbNhhTi/MghckE=;
        b=EbRTJkJOjEpkdHBgfgzPVgCtrxo+mHqtLqZ5Aia4F6aaUnKKj+Fsau79fKJ+WsBcdn
         tjn3qS6b5TvpxdwX8s5GJFxus9sACXpghLKbclYMwHBWZ66hXI9VHJJk47k5scdbC2VH
         0NfpBTGstgqZ142ySd3PHfxHeTETXTiKC8BvryOJAZrBQ+hyqSJIV7eS3uGqUNCI8sPS
         xgaZSzscXZNPn6o9M3P5G+L5Uz5drmBG6GOtRuSTU3+cRQSAXhNYlJtQGJdiSiitaU77
         sS3zpFReRlofObmsYTDcL2rvlXzwJdZKhsT9p/ScI6Z02GL9+LhlJOzr4cRj8P7DpAMY
         +5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764852612; x=1765457412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZlqMIh83DdLccdFdJGccPgvX8HsoEbNhhTi/MghckE=;
        b=dE7dRA40PJ6nnJMvBMbqKcUJzUZYYAz1YNkcs276qz5Wd4m9CYGyxUlhClFBhPiHZz
         9IvA9xbl0KhrNIzaYwGZmckceov4qbPOcko1o9PIRqwHO5VLVD+CzAIiYNd9Y7E8SlA0
         6/u9qmf6535hmBB9Lv2HjLVGMRGfAxsc9wfIEmrzUyTO/wHpx4OiMV+lWcHPnkuCtbKZ
         Has1BcMxyCRZwykjMrV+T5DfFQRjCsEts9wUUgHt1hYH/z9VHMFW5ZafAbU8s9ohRRok
         GQs/aQZ2X+4lPVIXHtv9Gd1jhG0iHVZ2LYYCcpn2neS5pJP/6hGDuoaed434dwRrJqZv
         qUEA==
X-Forwarded-Encrypted: i=1; AJvYcCWeg4NT++IeS6c844+eX4Gm9heT2jCwbyUIYJNx8eGjp560Gfl3pqgp9ILcgLJFJw0TZjv4JBuh3BN3Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRTcmXQNXWQHJ5II4Fo9etDHlaKS++Yw0THwZg+lge0GnTWuka
	WtfWiAm4TbwPZNMuBv/AeyUFC6FLdnKjOrY66M5aI65KUcqn7KGeanHsrHyRlfuFAQrQNH55qsr
	96QKUuimX4Z0rx2wdbxwNsKRh+5vwGaYA8GOatzrRWfeVcxaXDpkX/+bIbxQX32qzSQ==
X-Gm-Gg: ASbGncteBrNN2+PQ2ZCqsk88/MeJk46SRAFJ9btuiR1FYyZTEaxmUadjN7RVXsSyWYX
	Iwfg7NZ0jyyTY21Th/dVn2e0iAZ+KgU74RV0vYUH+mg4tp8USODH4iNHI0SyJErpf22sqQDPPhM
	pVC+oPFkvAjfeqovbwu1X9csCCmMG8YBhdXc/Rqm7njL2PyYNcMRRhTr0PwDeYA4DEmipqqEpzV
	yAF5SeJUaTDUlW5Wurzq2VHA78wlfOw+NVBqI4XYlXR8cgFoV4C996mO1V8I8uxPf0scqAu1Si/
	HuJvwBa+GPE5STD/PrwmOdqA4+rcc9TWYE5cLXzyMk0eo9F/bPaOawhaT+4SgfYWbrXO7gd/e8H
	cg93ipVbFlHfrTPPebvjumPNOfrOgfhTnPQp9CkFUtVc13+FtnJ2hSS/cFvxirLy0fw==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr536685285a.1.1764852612031;
        Thu, 04 Dec 2025 04:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3kCqdkJsP0fZMeA72r8x7tjeQd4EXy6jusY8xtR98W5IC91rvooV11clRg8drzH0RvqQQew==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr536683185a.1.1764852611527;
        Thu, 04 Dec 2025 04:50:11 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49e45c0sm124590966b.61.2025.12.04.04.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:50:10 -0800 (PST)
Message-ID: <84a17875-0542-47cf-ac4b-5af7bbdc5edf@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 13:50:08 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-10-80c1ffca8487@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203-judyln-dts-v5-10-80c1ffca8487@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=69318385 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=4a3UZYCyxYPj_-8OAHwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 9vbPzleTIqL241PYl5rqGHsuLiXG2KdQ
X-Proofpoint-ORIG-GUID: 9vbPzleTIqL241PYl5rqGHsuLiXG2KdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwNCBTYWx0ZWRfX3GVyrcn7fm+a
 Zd/hXkStD+HZe6j2QNEinxI/SkzSO1/i6KaPMMhj49DkQtC4WL1/ATcLD8b14caUMdhCUqAvi9v
 sa8nouv8xe1x/jSp5VySpiAgT68tAaO6xdAAQME2V6z5Yy+Kp86wAXU99GAcTm/8Ox+jIG9BRTH
 Raqxl2xGagG8Cj8QkIP3SQSwSWxpAafMnPIr2aHO3Oofb3Hkrm8B2SeBQmbr5iIiF+SE3rHDzSd
 eO4njcQ13wsSb0AcsGbNTfa9QZ7SPSpOB1/VaByvY8VLRS5YnnE3/8snd1JX1HKVpC63kO4+ifp
 neP2j/YJ4BhA339Fop/t9CXgWa/x1Zh3tIQiO8W/eM6qTfhUP1HJ3DyUbhixFQHHuLk+NCDABny
 Xxo8/VnS9Ai5injiNW38GBJsanTrWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040104

On 12/3/25 10:40 AM, Paul Sajna wrote:
> These regulators are required for the LCD
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 8b88f75b36af..cdaf84de5e6c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -56,10 +56,27 @@ zap-shader {
>  	};
>  };
>  
> +&ibb {
> +	regulator-min-microvolt = <5500000>;
> +	regulator-max-microvolt = <5700000>;

These ranges seem much more reasonable, although I would still
expect there's a single operational voltage - unless the panel driver
is supposed to call regulator_set_voltage() in some different power
modes?

Konrad
