Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A638F2BFC74
	for <phone-devel@vger.kernel.org>; Tue, 24 Jun 2025 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771556; cv=none; b=W3aIpsp2x3u0CBU957HUWcAgWEfk8qwN0TYON2Wlg9qnkqx+gkYqqsjuiiYiQKZVsEg9GOCPCG5zIBGXLQY4G4dUVFcAA9U+8Yh0hmwlsIeOfHNOMURB3S0O1GHXo9Y07gu5qXbuovlumvMhf/6AHsz3iyWlpcZwCVs65lBinBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771556; c=relaxed/simple;
	bh=PA9hvTAzLsA+usJ2+Mj9NJkIcp3aM0mxLM2JBOJeV7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwM8pFZrprXSmg6wnpy1Ub3YQSBsck2xKA86fSfdJcDrYBCnf4L+isfdt1+Tsj0PTgpPImTsM7RCm3qZ5rnFUC0DGgcTMnZG7NFUM+3RHmJj+WxDwPiq6KDFcy8zK/ikBXyjvs19+5zBknfkREugZJEXFnEzuh1opbDaQ041BVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SegW1WwK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SegW1WwK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8kqja020873
	for <phone-devel@vger.kernel.org>; Tue, 24 Jun 2025 13:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aX0gtlsQln8GIpy3r5I1Qit6u7+/jH2GtkFLZXw6FzA=; b=SegW1WwKU9Kssmxr
	AxAzIAxHfAatYoHopqw50DZKx/SKXVX08/OIzIXOvFH83bedTMWuDm4OWxYyxXjT
	um9eZ6D5jjzearI9IN0x6AtH2E5dgqOcrT9zrGZTm+a8+XwcFIWEgUT6aNjP8FBj
	ZvLQGXC7B1izxwNaPCed8dzeaTGKp/tSvg2ALhMfUrcxkwm3MH2ndeiFUAAq8Y7x
	MzBf1vRZOG45r1aa7VWTIGLAM7BKhwkyjnD633zDniPYvZ02MRPiLQS19BI1kM5P
	dzWWh1VwFAM+qGHYOdZIPcfhHrnJyyYSuteGnk3f+j/WshOtV621ROYN6pSwxeMY
	nYxZHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwtehd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Jun 2025 13:25:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so151360385a.0
        for <phone-devel@vger.kernel.org>; Tue, 24 Jun 2025 06:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771553; x=1751376353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aX0gtlsQln8GIpy3r5I1Qit6u7+/jH2GtkFLZXw6FzA=;
        b=l1G1k4eetYZ54P4QDXMpXk+v3G2okjHWr5X6+FDtjq1gb9F1E3lHH8MI/ed/ngVa4g
         nE0QH+j0e6iusTupqsWbEAo2c8T67XfkQQKJTj9eDf+AfTYtDoM5i9xFQ1qHb/ewkLxS
         794bUkKoIvm18vKkcOXXgPKTch94mAZAxCcmls0Zodg/lQ8wJAdDDssJuv9p7DK3pdBf
         X0yfmKw1QhX4dBAimCvpv+lhxBUDIiF1FCbK/ZOvApKB9WCX+78Y4k0sswtMLUXCMi4I
         ljNHee+dZRKeeMnKfj+7GSbjzZWgj1vnM5StytwS3OoWN4jNhMuJ2bPVrAhzWBinoBEi
         xI9w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5rCfSKZOzKIdAfjck4rBeJa5XedjhTBEbwpkjrFTX+/284fp9zXooVVS2j1NZKZ/MUFMZsOsAYayJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy982u+ZHc/+fvQ0C9jLze0HnCvh8xMbBgdIQwDmrkFSSL1ITwS
	NynatulRMBhx4E9ua9zkf+9ZLAiIIN2FLnKc6v0NGYHJ4x427XXU5FYzpOPFlsTLgCuo76d7PIX
	k+/soM3qS0M/3I4zimbBPVSx6AnG16zI5I50OpgOyRbcjU3QjYfGQuEtN9E8lJTSxoQ==
X-Gm-Gg: ASbGncvDB9bMP2wtu4Q6RCsCU0aN/IYUNgxhO2f2bY7x3MmSWC8u8QYG+dF5PA4fmrq
	OzbHSCUARCMTnh7iZIZtUk47yX6/VY0n0r0nbnU+6kAtzLeaH/GQnbYe/8ywtnveU5YFK28V7oQ
	l1PROPp3YokODRJITnU+r1NsoiM1ihvwHpDzGjJXjtvbr4JFIfAZFGTskCqzo6tQvJEemAvJGRt
	C5nq7GDmzfu8mw3rfRdWZmvpgtx8xEzMjuVaOWT3F0nJEnEdy/A5r0QFRglmf5iuZXjIA42Yfvl
	OakcfIwTcAVtEzmO7JmC/BTXzLDqRoEcjEMBZJIDtF6hpxxYPqzpxrAVDyIEPDJANuVqQKfZSXS
	yzeg=
X-Received: by 2002:a05:620a:4594:b0:7c3:d752:f256 with SMTP id af79cd13be357-7d3f98e73d3mr833914085a.7.1750771552535;
        Tue, 24 Jun 2025 06:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtmqJgy1cNQYlHf9rNiieXLLQW3l8oeZCtsM+x77D8zUcwYzl97X4xxSiLnDezlRaz0qJg2w==
X-Received: by 2002:a05:620a:4594:b0:7c3:d752:f256 with SMTP id af79cd13be357-7d3f98e73d3mr833912685a.7.1750771551856;
        Tue, 24 Jun 2025 06:25:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm889931666b.148.2025.06.24.06.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:25:51 -0700 (PDT)
Message-ID: <874d57c0-a124-4767-acac-05e1a491b7da@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 15:25:49 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
 <20250624-rimob-initial-devicetree-v2-3-34f6045ebc30@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-rimob-initial-devicetree-v2-3-34f6045ebc30@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A_v44i99hbSLsObw929HsYjJCuXZnmUr
X-Proofpoint-ORIG-GUID: A_v44i99hbSLsObw929HsYjJCuXZnmUr
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685aa761 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=n_RBVNUhXirTSVEQBK0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfX1VzGmCFXo5Ky
 Eam79kiH//ivloNbcfWhS1HiUHHpaJnvtkoIu++Gm7fz7rDjcTaY/1nVtqmDRiLWXr7iBikr8ue
 PkNCXAxE0NS23WzqVgaydE+OlHxKsmQn8tAs8FfI3WhT4Q18NhCieFapXHN4c4mH+AjdHH2jozQ
 z18FfA1reWOc6zWY/1Tm1k4A/D/uQEsgR410dkkDpzuSv17vUA/KikFTPkKk3sp69/JBQ6OThj2
 85c8SHITmDPVlzmm1JTvBJYPTmMTwJOe+KEuMx6biIVyxySa4KI7GQo1Wp3m9sspdRF379K7S4G
 tonnChrERgJ0bN0/GcGC3ge6XpnBo6dAufTBnpon6owLjKJrqxvy7NzhWswviAlKiiyIXPbBYZC
 Lo+IFw5wcI8OrC1uxOX9YpQeEXWlwoQHgSNHCfwqurnmxcLiGGe5ZrVNrXOEn69n53ubwb0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=687 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240113

On 6/24/25 3:20 AM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
> on Snapdragon 625 (MSM8953) SoC.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
