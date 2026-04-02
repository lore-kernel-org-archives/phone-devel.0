Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3015220698
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121793; cv=none; b=aOLHFwsLFgO3cZ7zv5az4qiLvdBv1NjN6xPzO8m3RU/wpqXCAVcsq+YuMjk58fcoXvtXk2O/4lBKOHu3t1ua6xq6pjO66AoesKN9I1nHVgxMYSH0k+Xhya5RV0WGKZHPLdoBdj+0pc+nbFOD4TKvpGXlIcihC+znKYVybaaHd9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121793; c=relaxed/simple;
	bh=q9j+367l79vYQecpLmaLpTtH+va4Wtpz6t3r4tF7vyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pses3bqnzJDSsv9qlqgUAEUVoZp/K/stDr0JgLH+xyuBhsbD8aNaRz2P3tvHY64gtIHkNst1OfZZr3enaHeNbpNn0JzvNsKAcjSAvg716+uada7rPdomx/1wauRFlBjJQ/Bbtv95QVT+SDmggj7FGtPpKdUbHQw6g0NPkDILOfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWV/tnlY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyB6PIU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWV/tnlY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyB6PIU+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328d77m1249375
	for <phone-devel@vger.kernel.org>; Thu, 2 Apr 2026 09:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=; b=YWV/tnlYRJfUMLIy
	TtfMrPl/X9K4U9R2hhggX70fmeuj6hM48rj0ijQQ2B6Wq2K5SMtGijcEJukjAj8M
	lVuF/OIetpvHMnQ0Hhf5THmXOxvQE6nmf99mtqySBVKD/pKjmwDWU8mf/HPWEpob
	iHQ8f72tHMNybvcn9j6lfoA90SRSp2IjmvtxwO1Umz+udXJWJUMSsLebEr4V/NJI
	PmhSIlz+eEMHAdVOTSwqULAaAXwccXutUPY/gVS5gAY0skDcc3ja+dhCzK9TB647
	FCPunDFOkpJ52jdlYZaq+NETM8ePB5ZHo/MRACM2yfTyScRzLX4G9cYSaCp+Dlxm
	6aVKzw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t062p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 09:23:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cd541c0edso3086946d6.1
        for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775121789; x=1775726589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=;
        b=RyB6PIU+8Z75WmgIYMOW/t0EF/0/ulbziOBxFX5/0xI1AUFVEgZnUjurh0o+Nr2hjj
         5zk4XHDvC1k51q4EzSZY/s4ehOsVd9vjZULZVWD3E8GxKJ4YcvKuxZuUK7uM2Zyl2z2/
         dTpgXQQQqtoUZDYUhYWJ25x90z38ZVeYFAHlb6HxfPi7bjfI+oY6oifLFhVyF2uCzI8j
         Ym/FvKVRpVb3FoxK9THdF37BdtaCYuX6puCXlz+8fqVBY/D8ko7/NE7TGI+18PfITUMd
         uBoUiwZFqfRz9C+aNEtZOCe605I7xoDGkaeRtlxgtv/Nv4o4QfbVSlY1Jko+NpEHKH9G
         rHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121789; x=1775726589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=;
        b=FOGDbu68kLnucoebRNd4iY5LoYbkhPA0Bp+w6BOxe2hCkLmA/4qO9Fa4N9Db/K36D5
         kBMYDvEPBnwIsFTJpvrQoP1FYfxKM/u7afT0UdpQwbJk4rc+zvqpSydiVlqmPdl6gKxg
         LxdVfrYU8FRZWx5sOE/pA0tlmlfP5rCbWS7MHy7UrI//qbLPfn2Bd7iTzq25tYye3sAP
         +SRLNFeMKgudDfkFbMCn6TMbuhWeUmqfUtp5rCDNQ8hHtkJFxDCBsm8SnIaoQkPpl81u
         dfTOS3ZFoNf/ePrdOyK9mQ2+uct+izJ3OyoztJy7aEy/6rgVSdpQQHR+EXdJWtKjY+V6
         mN1A==
X-Forwarded-Encrypted: i=1; AJvYcCVVzyq7oMDoJGUdzTHpAqxAM9DNlgWEQ0S0VY8BXOu3ImFO2FGtER745c1F3pF/YC7+CWw1CuuTbtQVNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyiWKlFMsCCv6CcazBScnbaJ9K8A2hH66IeqaNbIiLf9HxnMOl
	Pk0oxAYzeNtU9B4nDKYNKKXk8RbqVgUuVeLb9WiHsMtE1tatkgtvCZmULK+ZAI5YwRUn3JtFT6X
	IDgIoXTbvTh30jqfN0W9uQBmIqI6TXCSXogLrkcDhujUpAtS2Wpj+YYgIVG6qxc0EDg==
X-Gm-Gg: ATEYQzzE8u8XoYp8xVNfBsGKDaXXlr7/8Y1uWq+x/J8t3uUsryyFy8lvyu7IaWSUjvn
	PTThCgZau6KfleagDq/UKe1NvskiOl2kpow60KnJnFZBhCZiSuqfWwUErbjSP1aqG+bxi9VSXSi
	K8bR0pCXm+NysXD/xT1kIxsV/rLWV3yu5MA4xRDigDuN1LcQ4ZH1+4xuoid9r2qHdOHQ4lTqS3N
	mk04GjRVrJQmMYYT67RhOK/JcFWX6u2AVnGxdVcHSk0I4MUc11oYEyAdyRpeOYelDYm4To9t+SR
	MsbsAYqjofStkqg7d4ZgcwqjdmkbBPy+wJ6IhF0v+/vVJFEIFYADcoRjQcmxcZRUklwVB9hDPAa
	uoiNSEocUpWkRI35vytq1BqbCC99e12f+fq4d/itkXq+IeyhWwKUque6aaTBrVgxgCC4KCsvgj3
	RMkKU=
X-Received: by 2002:a05:622a:1818:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50d3bd5723bmr73354241cf.6.1775121789017;
        Thu, 02 Apr 2026 02:23:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1818:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50d3bd5723bmr73354031cf.6.1775121788564;
        Thu, 02 Apr 2026 02:23:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6cc4sm65225266b.32.2026.04.02.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:23:07 -0700 (PDT)
Message-ID: <a5fbcb92-dedf-423c-8721-59838da60980@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:23:05 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 sdcard
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexander Martinz <amartinz@shiftphones.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz>
 <20260401-axolotl-misc-p1-v2-1-f3af384bbb50@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-axolotl-misc-p1-v2-1-f3af384bbb50@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gP5BMCiE0B1pomqFbupNWTwVe44-sPSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MyBTYWx0ZWRfXw7QkAnuXF4/J
 bbyshy9ozCNIt+y0jcx1R4jZv7cvjCD2JuFB6H/poREpwd/fS9aUHKuNryDuYqnTeA9AsQBZeUG
 SybDR/GfYrpDuD44Gb/AZB/YYMHEqfSxv/oWXk6PPA/FC2VHjD1yt7bGX6NNQCUOFPONU1onKLk
 AnKrlQD1pDwBH8pbgmJ1EzYL66MwD91iP/VNJVK79PrZXqKX0nrO7dK11teQJccjf0KLbKYrHF5
 RFoWDcXuPPnT8qieIvOk+91PJyh8bLljHnpRBNzD0FOSTpfEbJrraVnZbXtvy722YdkZ8c0akAk
 Lnj4Z1uTD7yQA7Zh6eMeUdun5L4EQ/Hrl/WU8Z3EKiNbCD4pPkgoOKYRkpU6NkVOHIR8i2gOV46
 AHioxOMxq8NPQhDy2p1Bit+Z9bfxSSYzZIWabt4lZI+3GckHCtaviywRaOQQdzwqj+S2QSVkqkH
 tSxSfcm4VEUUYSbr26g==
X-Proofpoint-GUID: gP5BMCiE0B1pomqFbupNWTwVe44-sPSa
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce357e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Mtb5h6N5A-RCbQxWbuYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020083

On 4/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The SHIFT6mq features an sdcard slot, add it.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 44 +++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 740eb22550724..c394350998c26 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -600,6 +600,24 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	status = "okay";

couple nits:

Status should be last, although the file is all over the place 

> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;

preferably in this order

xxx
xxx-names

[...]

> +	sdc2_default_state: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <16>;

All other pin definitions in this file have the bias property below
drive-strength (like the card_det_n node you're adding)

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
