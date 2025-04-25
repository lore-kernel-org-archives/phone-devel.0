Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA66020298D
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607773; cv=none; b=Qt2vMnFYECGrZMjqCVL84NpKi54n3/OCSD7j14brickZE/oS8HvR3H/vqsB8993eGi8mFYbTKhOoAALYMKc4IPKYDg6VeNr8mKApoNoAbF5r+2QnXnJGSYtNI/MZQ/Q2/uApA/s7eXKtzDams1snkqUzuAIrJ7W02UWliJogi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607773; c=relaxed/simple;
	bh=pYCkWUjNE3NuFqcQEgnTKGicdGzX1if1k7WgCb8+6Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qta/f5q9npi/rzKyn98ZyZzZZmsKAqz3dkXEcaxU/X24PSRl+KWW6lblS2HPH2mC5Gosm4oTKJV/+/BMIKnle1FpsvOWpol3v5G0gugXjVdkfk6YXDqg9IUAQ9v7NV2y3A3ocKSq3gp/3udLnn3nMxRlxi7LKEbZ+Vh6ydhzNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0MPwPKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0MPwPKf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK2Ze021950
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nkUUiT3ss6IH9EIAP3uPnI28
	FMp0pQeC3xvyjBzjGrE=; b=A0MPwPKfawqBaD6ROdG6oY3SGx5ZePkWdkE3TOJ+
	6va1AZ8QH/ZtqM+hQXghYzF4Z2Q7sPaxEehgHwvpulGN7AIwHQxsWLnEoXxB+MP6
	FZ4Ia3W9hKe61mUxgbWFGA0Cr5+3QPlZcZmuufEMf0VOE0Du5iPpA95QKmBDJxLG
	w9RYOeck4ixQuldhuL7Q0oxM/giaE423/PyFxK64LL7axYrSZbC9H3QG1NzBtcnF
	pd0yNRAcPMNjvLqf2xCMDjkzelIzveOqxqcuy8sHet3xIyUvO9tADWbOSf0ZI0hu
	XefuWasLyULaY8k5IPIWA1SdXqbHe18ajF9rdRjOfvcjcA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5j3md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so29071375ab.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 12:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607769; x=1746212569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkUUiT3ss6IH9EIAP3uPnI28FMp0pQeC3xvyjBzjGrE=;
        b=hMP5ftiSU2IoaPcOebg7WGcmrfnMM2kxpwvJJgiMfpL8LM1kRG2iyBq/9nGUWV1jbR
         QkWd+XKhvUs0ctVcd9ADzhBOisRXhtLU8F1SYwQpwmmfd7Klj/Me5E0Xto82c+FVTtpd
         OCDoMpKlyDmF+qT9cxHz1CLbvWxslmhZgb6AXJCT31l8vK0YhfQY0c3k2RL3TAnSTqZU
         +fIWfk9sGUK4f3U6i4k1S1s+I8hDdwfQsFNnTzZw06duEBz8hkcynQfC/BVz56j/dm5e
         rjsd1sdjrqXVSl5wOS24yyZHH4CQov90k0SWcgmr71S+uZg1YpSJDA5ABJ9uH+zyBzI2
         6TRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/AhoNFhOR1yVR25XwCd8he7W6VptQ+zaUbeN9aLaq2KMZHl9qk6rsWutAbBYSn11F6w6aJ0xYNWKrbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbCfRj6EFFaOtXFYBWhm22A7Lf86o9DpPHZ8kchiCYD7vyqYTc
	+I/a4dBl/Y/gtwXK/j4uoDWQAn7JKebFaeOgrbN+ga9uUyrH/goJwraZ1cKzgqg5spdEItQJuT6
	1YIW1y0u6tPfnJx4jcOADhWg9+TdB8DtfC6W1Z/hquOIdJsUYYaKiOUecEnj+cA==
X-Gm-Gg: ASbGncseqy5Tv1Ovyj5N1mOJcEqfhTcBw8Y3RYwG/tUWO3gajT2/skb5O2MIUSFGPzN
	Dhh/elW/Z/78yXwdcx37pBO6o1YJbbVgHd+1ofJNuXw9GBWGaLPWm5S8KQdNODdd8i2AA9DXQ2Y
	aJTIk9qv7/ZaHfk4UicWYpURV7Lj0xJNy/OdZvw0mc+DEWWyJaIzhbmIQNwxJKB2ZaYCje3an28
	gkMVS4CdNbm6oefetEjTeAzbTCyz02p9ThvGp6ztbh7md7D0FNIpwtCHpVWptCWFUkno4dKnOU0
	Hwf1TnSJkpYiTgtuw/TyjLVjhZjMJ2Y0lhg2myk8XB+GL4FofzV/U89CjTp+i+6PwrB5LFf8qb8
	=
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39269285ab.12.1745607769325;
        Fri, 25 Apr 2025 12:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhuXvdR/qmg7RMT82loQhMhHkY1RAz50Xasf3Q8QcQs/adSctEEm2ILPuO8VBKeb6d+RFAAw==
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39268695ab.12.1745607768937;
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206b703sm8497861fa.114.2025.04.25.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:02:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/6] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Message-ID: <rhfklvynn27x2lwyygk5rpjwvx7p6bhbkmc5jehuy54ilhnzbz@wuhcndngavbp>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX678r40Gpu47u D/bTOMqsBSPQiytQwnfNsLPsjj2rVvYGB2s40yPSCfnnE8xI1vgj4yaFPrWvEKrmdfmIJfYk0/K xF+uoOIm0qoGmw5DxySeKwVlEyg+WBanaIpqzl5h1ksmMwJeKw4z4D7WwE9fJofsfI/gEnsEuvt
 U3gOAge8/d5mIjjP5c7JyfkY1l/4ixV1+y30LnM+4kYkpuN0XlmHUEwoa02ka8UffFZMEJvfGK0 xnFCr6Y2VSjzHNDNkQjYL4s9m7c6iospcbP/tgCTZthZeRt5bP7J9Lg2SHpeMJ+ENLH/+urVRIV BQwrZkS8gMIUQgEuBPL19y7lM/Mo+C6pxc5eDsLxaqYtE5niSsTYqLle/ohBhpkLaAefGSoN/S/
 3qtJPTNh608DoTEkQNfJZPxhpBFJPLfo4FvkDya5bqBrwhG4YL6b0jH/hcG2X8NYv03F5lPS
X-Proofpoint-GUID: -TNDVS2aJk32h-vdqKx_UIFC7Pb8DEoj
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680bdc5a cx=c_pps a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=GtLuwp1ogO1-ZJmtaBoA:9 a=CjuIK1q_8ugA:10
 a=8vIIu0IPYQVSORyX1RVL:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: -TNDVS2aJk32h-vdqKx_UIFC7Pb8DEoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=918
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:54PM +0200, Luca Weiss wrote:
> Add a compatible for the SM7225-based Fairphone 4 which can use this
> machine driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
