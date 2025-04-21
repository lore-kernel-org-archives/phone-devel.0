Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E41CA4B
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745264154; cv=none; b=NXRO7QT+mg3enzMdG7JYpkQ9rHTjYbB68oisX6AWLRaJT+rvMDGLErMreNIGXs3ANNuGY0GTLNXEb1hfa3iaYDbENErjmdhJ08IogBMi3EXjnMXlIgyh70g1zBkqidYXQeS7LaSeUheN/ksxKxajNDi5vXRgjz7TZ4qifpiQuTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745264154; c=relaxed/simple;
	bh=SbKiprvdu+s+l54ghqSeEGtwo1OssftIDBCVOa72pt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkE6GT+muXZ7m6yNhWhVeBGCkh/EiMKGsdTC0u6SJQOxobtSZPmBAze2G9wpcrVs7/yBdsY7lzXVZIzfHnHKCosGTg0DdMmxYChnfoJQRJ3Bv8uFL/iVfaaY9IDGqhjIhMrn2Kzd8C+VLEW7uE3Iz6p7LVyFqhvgv4QrluSKRhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSJ6VfM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSJ6VfM5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgYcF030745
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=om+egLePgGfYseSunmGqN3yI
	bby3rY1UOjx6vajoAVk=; b=MSJ6VfM5DF2XFLi1QwD9htczC6TH9TQU3UvnpGTP
	F5fhKRUjNhpj625imdzHjH1YA4jL7iH28ol3pRLgu7boSMBFWdDoLpiXTv6jM1P3
	YDUxo3XFk+lEm9UDR2t5LYTL/gAweRpopggXwLYpNE98fUUZdwgveJ4dzBKUWRJ6
	U54kisUW59YCrHk2SisJ0fPnWN1h6Tl+ShfetXk9VYUef0K3XbEiPBtb2e6Juhqs
	JkZv7onSVRfxb9ythaMZCutYkBwLbAFux4H+J2wBIjOgWEgA0uIjO7Uq3qboWbaP
	770BDq18oTiHNmWBX6q4qE/OFBi4W8kbKq3I29v1tFUteQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jd578-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:35:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8feea216aso89491606d6.0
        for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 12:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745264151; x=1745868951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om+egLePgGfYseSunmGqN3yIbby3rY1UOjx6vajoAVk=;
        b=FEHajYsGBeTG3XSClVJLfsR3lbXlF0PtR6aIw1w72W5AhNT9/ikYBAE5Sbzjif41pB
         cDdi9AHFwvvZjokq9sZ72wKk6AnVX8cLF2WzNsWg0CFWTO1oDenE9m51H0qwuYuIpW2c
         aZEBCcI5mogXA0Tl8yGJNJ66uKloCx+FAOiV+g1POF0VVSw06GJQe5LAhH6buKO312Rs
         j9ApFZ1x4owo6CN5OILkKxhCUUBmc2p+mqoZTqH+cljKdqRIMTCzqjI0xw9k/Y1Pl2EM
         evki4n7qnCwLlTQTbh05z+r9XlFEqReehbkabwY5PLx66SsIc7W1pR05cWnvR3sFDvwD
         pwkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiW37ZYdEs9uU2qadfcSLSLYxlvXsxTJzxqle9KZmZCH1pWnlD8lamNtRgZel9cjByavLkAsWVYajrBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf3tHx/pgECQuJJZS49VihWVSxhDau91t0os637EdkAzwXNd+x
	hVvHmZbugn9e3rFl+LdY+syjb8NYGW+X+mebhLCKufehR27eEcFyaJEeJw8WBSu2mrFKcS5m9+h
	oU18TP6bwabJe3J6qFdrrION0X6E71KQRtReFlLNLZDKk//OH0gl9S+K5HqEGGw==
X-Gm-Gg: ASbGncumQ94P3D14zez9uOPUPf5akR8hQyQ7BKdzSAaT5bBMNsqGbcRmGPwNePeRtfa
	nI8v+1mPXlp79rnmj0eTBC6TJiXAVg9P1gHCw8NqYrMMGA5PBVVLJHKp+O91NGWPIfEDIMqnsXo
	r5KacPKsWyWv0ZOrIaKnfCUyHrNLk/iljC09sVrmafu5vSmJqtmJOXzLB4Twm1+ePhs3l8enqCj
	Frtq88ykz9PxabbOhjUfkqr9MCgb6r+5mJDjme6oA7eO4h6UVqV4Rh3wRZHAy1+Cz61V4D80r5e
	QDw9VenPe3g1QdPMdbkmimC5lbvH9JeEBKn4QVY6eVpZG0RdvDEsHWSFqJGp87W9/evAGWKJ3Ig
	=
X-Received: by 2002:ad4:5762:0:b0:6e4:540b:5352 with SMTP id 6a1803df08f44-6f2c27b2031mr229557916d6.16.1745264150799;
        Mon, 21 Apr 2025 12:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxNzS2YaVJyYpzz1s37ReU986z6Z+/tz7FCIXXRT5d5zk4FBxJfdb9F9EQ96XJ15BWNYcBhQ==
X-Received: by 2002:ad4:5762:0:b0:6e4:540b:5352 with SMTP id 6a1803df08f44-6f2c27b2031mr229557636d6.16.1745264150384;
        Mon, 21 Apr 2025 12:35:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f4e20sm1009454e87.217.2025.04.21.12.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:35:49 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:35:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: qcom: sony-xperia-rhine: Enable USB
 charging
Message-ID: <svhbckb63yga4eqp3vvlhrns5aj37cuwyv6ctrhn5snzkt27ze@zxi3zlglbi6s>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
 <20250419-togari-v1-1-45840c677364@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-togari-v1-1-45840c677364@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=68069e17 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=YFT1mlhl2oHJEvFVBf4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: uTGTGcNgFSWdyq46wqD-aQwGGSzWz04_
X-Proofpoint-ORIG-GUID: uTGTGcNgFSWdyq46wqD-aQwGGSzWz04_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=974 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210153

On Sat, Apr 19, 2025 at 11:00:38AM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> Set usb-charge-current-limit to enable charging over USB for all
> sony-rhine devices.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> index d34659ebac22e65a511994ef201fe04f12089781..915221e00ff348309b62bd9b637ae9771d213f1e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> @@ -449,6 +449,7 @@ &smbb {
>  	qcom,fast-charge-safe-current = <1500000>;
>  	qcom,fast-charge-current-limit = <1500000>;
>  	qcom,dc-current-limit = <1800000>;
> +	usb-charge-current-limit = <1800000>;
>  	qcom,fast-charge-safe-voltage = <4400000>;
>  	qcom,fast-charge-high-threshold-voltage = <4350000>;
>  	qcom,fast-charge-low-threshold-voltage = <3400000>;

I'd say it's a strange placement of the property. Usually generic
properties come before vendor-specific props.

> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
