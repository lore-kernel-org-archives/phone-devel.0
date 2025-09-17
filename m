Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080131BCBA
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117114; cv=none; b=B//N5dRXDnQ6rWG86I8pbb66AJ33gTc7J7sg39ZTlFdHncv5uc3wbX9lqpXiMWpmPn+1zWPNoMuRy37/qo7DuT7jGxW5Jm+kj78Xe97aPP3YsBAXcaE9Ct7GHCUudMthHq4VgNlsuGt/IwaQwGMSiaAHWRIfQX6B/cdzhOPPskk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117114; c=relaxed/simple;
	bh=wR1KKrdrNFpxEZ4xLE2CusGSA0Y1uaWQR4YSujvUvJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LdmS6Prd43Ykjz6oIYtHOsAsZJ2Pk6FTn68dFw3BwxcASHFMALhc6SbJjqEjHDjPvRYNEbg4FiWbxoqTaKvdtBIXYS91ftcy01g7wjZN36wrFSG8tUTBq8OPMmaP9KcC2l7Ni2HzUJlCmfw64rlzWZAIuXm3dWFSc/zovAFDK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJo4ThQW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJo4ThQW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZ24027214
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UiNZluozOEiEosmrVsvrTLkx+n+8c5m7jOfXnNrm9g=; b=nJo4ThQWWrPRlGNB
	AZONy7xqHJUy7oyVy3kQsfrPrHoOTND18WuR99jDhcc5hE5pYj8tP9wVDdZtO/Wi
	RJCue49eQApAsUcFNEhb7g38VcsSPicU592AMa7v+/feIm6/NdKm4P1g6X0BcwLo
	jcklEvP2IJ1MU0gIkwJhV14U+4Ua0aXnofrNOEH5Ptd8iTqwRixqHLh4qNqBodmE
	Mn+tZQbKC9rbwZQYSmXb0USrmaBRgqUYivcBLK96tvylebSlHH/w6t+ABwCCDYnf
	YmHAWifmHnVJgGyM4IwAzWWodHhjPE/x/Fp3ZR487eQqxLapSLoFFSy5tm55c7qN
	wJAbqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjk51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:51:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b77ed74e90so4736701cf.0
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 06:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117111; x=1758721911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UiNZluozOEiEosmrVsvrTLkx+n+8c5m7jOfXnNrm9g=;
        b=A7DzV861KPH9DLJKSl4Mo/39rGe49nE1I5+lw8Pd9qEqBIGYBJ4rRvXVm7xhxIR+PV
         3pxFID/YWB1smRCFEGX4bWbirvIfL9jBLh0735xDiTOjw5fNf3IGdWFM7BvWtclVeR+1
         8Lw/+5UaULxzpt1B+lysybLYOolwYepLXjrhLVO4zYoSjcuVTaZc981NACTlbofNaMYg
         q/X7J3fsEf1zZf70A9+IX/ygcX3Jqgl+wOvHJqapdzHCJYS1Q4bOPmP6lC0KdBm5zdEz
         T/OAhzVTK8X7l6DgT4zbOfavW7sfZuf+PYO7PCIXtS0I5o/QtFzHinMbh8hKkUKnJQxk
         sCtA==
X-Forwarded-Encrypted: i=1; AJvYcCUHV23xYBVxXd5Sod9o3zWmV4lY4piiYc66Xa2sf5wRmWczJZbgYIfwucvJkL48gG8vK+szTkJ/DTjqVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZuy2zrwmx5ZheV3AyWe/ryqghRSt0cG6OjFxLybyzQyJtrAvh
	DF6RQtIGm9fuCF4lAsHmR+8j/+huAyGG5MzfOJkSD+2aok6j8g0AbZRBuA4j9e02jkwWBwm9q1J
	I30FQl1kuFHstR5lxbz/TGTw+uT86WcwmStGV0qa8ZDNrpx6lxfUu85LrNRDqVk2k2g==
X-Gm-Gg: ASbGncsRUjR9uDGxUu/F4L+ODPR9ZK5aZ00JqRBtNHQeIQfGLpkBPVJgYwuNTXZ3QlD
	V3KKVTWeEEri+h6pYZYJtvPlvIXy/6vmTloKzRY1pHyq2sDaFMcn/xW8GgZ6MvEyQ8UbDvOslH0
	lhZmMydXRlaQTwBCmXVrXsJe/hFY+9LN5E/1a35RcIYDbuMqvRpt6tqL5Ol1sapJEK8tU6eFKoy
	P7lzyJWe8kHXqdFXeqYwCkZIWTtCHRYIhmI4G9WKE+/aoldaZm1OsJWreGxJxAXOj0cPF90dctA
	+xCeDQAIHPzKRRPS3CIO8E7IVRlaq7OIWUNK/uZi8lWr3EtDM4s4it4oTBDRxd++7kvvFishsHn
	M5hOm7rcKRTiIFNA6Tsqcxg==
X-Received: by 2002:a05:622a:14ca:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4ba67d75f2dmr16425041cf.7.1758117110648;
        Wed, 17 Sep 2025 06:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2G5c62XRIZqyHsIUg5OGdC5gKqoJEvaDX2GNTMYr+lfCFleDAA/kpmUx+1QVXmO+VMX0cOw==
X-Received: by 2002:a05:622a:14ca:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4ba67d75f2dmr16424771cf.7.1758117110111;
        Wed, 17 Sep 2025 06:51:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f2334sm1396605366b.78.2025.09.17.06.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:51:49 -0700 (PDT)
Message-ID: <003840ad-b5a7-40da-800f-1fd880b8f831@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:51:47 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-6-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-6-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyMGuz5PHXlqa
 sDdo3HeRsfx7KOpvNju/WWhzhO76RS4h0mxO/I8jjb3qTvuWN0UAG9yMi93pegg0B0ObLEMNmX9
 x3UBI6bFzwYQRMVWuKgkmM55SD8OhvKayRCJsdoit6VX1Nj2KOfoWkaEhArg9KTOod1opOjcXH6
 Kd5svqchP2AZ8iHQ2EainX5C5O/BUDeQ/6b+VSR1QwqO+E2CC3AZiQpAWbRKt9r9B0wPmv13U/U
 kIrc2QsrGhYDRtXUYsjx1dm35zHOHfXp9OSiUXZvl3/x9kmYS+juA5TLaAVqCjDBTvvlz9KcBtJ
 81D5im9ylTDsQz6QfCOxJKzl6U53whF73yDomePrHz7QtBoihuibV6hEWVx7Ho2h3SQdnya5B0P
 cceXbI0L
X-Proofpoint-GUID: K-N0Mtu2QDUZMD0y7ZBHDpZMe41c0dAi
X-Authority-Analysis: v=2.4 cv=ROezH5i+ c=1 sm=1 tr=0 ts=68cabcf7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=03C2xpsRYuwQbuPiX2cA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: K-N0Mtu2QDUZMD0y7ZBHDpZMe41c0dAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, bluetooth, venus, gpu
> 
> Enable adsp and cdsp nodes since their firmware is present

This commit message is a little out of sync with the patch content

[...]

>  &adsp_pas {
> -	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/adsp.mbn";
>  };
>  
>  &cdsp_pas {
> -	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/cdsp.mbn";
>  };
>  
>  &gpu {
>  	zap-shader {
> -		firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
> +		firmware-name = "qcom/sdm845/LG/judyln/a630_zap.mbn";
>  	};
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> @@ -101,7 +105,7 @@ &mdss_dsi0_out {
>  };
>  
>  &mss_pil {
> -	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";

You're changing all of these paths.. have the previous ones ever
been used, e.g. in pmOS, to the best of your knowledge?

Konrad
