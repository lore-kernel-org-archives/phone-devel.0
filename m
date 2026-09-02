Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724BF455606
	for <phone-devel@vger.kernel.org>; Wed,  2 Sep 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345431; cv=none; b=BGX6OmB6xWsLlFDb7kB+f2hk+36laP4HRKovvxCSGNc5SGhQ9VnTg8ANsGbVF0OqsTGFBwjVKzeNuoJqQ1RaV5i2X6rfMfe/PZ4tHY2sdCOkPXTFc89u9w7NdEKlsSpeA1Ei1/NMCwkJX+a9gGlGcpY+eXO1BP+4fqTA4VuTCa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345431; c=relaxed/simple;
	bh=d4/NsPaTI3caLZnCww4br3Gt5hf40dmy9YvA9NdaCvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oy84rmciiMpgiQ4i8F8glPRkxwN7FEhs4I3oYuSaNJ9RmEVpiGOEiUxeQKPeAMBPxgzA5ZW7eLeFCDZ35efyPVyy1MJAf9qqKsAf/lnJkI96JLA23Z/GMsZtU8o7ZuyBZy8ddzdEHBRLSbQsMeLqJTaKTztMOnQoqHzmahAELmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRdDjXmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+yZ51SE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRdDjXmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+yZ51SE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NCv1975002
	for <phone-devel@vger.kernel.org>; Wed, 2 Sep 2026 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=; b=XRdDjXmxNs72I6N0
	XJhJDOdqRdyQ5Zcb/MVLlzU0hLpM9BNBZgH0cJE5iuMMZ5EXOhvjnl2uGlFiMDfy
	RtKLfqWrURQhDDvSkUt4qhWA1EBUON+zPZoEPGMVYRyXSFrN8VP4588wOGApEMlU
	VNqvBOCnNBHUVaRiTW91HVqU/qSCXJqP6Bt82r1P67lG+obJr7extaPLN2emOpBa
	aJkM5CdpMqy9ECu1xBobCOOqdnMYr8Ghx77/l/dAGneAnpzWYdGRxPNPfC+rn2Gx
	/LM5dt0E8WW/Ztfeq6rC3U83MHwmdmKBnbdfdXuoxOhAKE7S3WFk1v+c5ohyymNR
	02z5IA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435u6cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 10:37:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390890ae83so24669785a.3
        for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345428; x=1788950228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=;
        b=I+yZ51SENHgMqUkuBNs2++zAiT+AiLhvL4LGR/v9HYGWHxraCoDaaWl5wDNbZBPyTI
         3ulZCyTX9MActTfJFXZF2gnb3mGzKaRYRZ7CW3/jN84NmVx+j5tbjiNBiYz3mfz/wpw1
         tWpwVeW8CTSJQlqdI2M1RU70aPJJ+8UndsLoYr2HfFBVrK4nPOniHN554PK0+iz6N6KJ
         cH426qe5Ph+G+4ijw4vCYlQjC+h83WlmKTxcA8JNeLadRr2cWAPD+HfK1YkuRUF6iDQw
         NNIAvfZu0P0zlTQ+f9ECd5WxDdbMTK/A8dMMcaD5sGzpzZtdGDVRKvS43Xt3ZjBhCDVZ
         zijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345428; x=1788950228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=;
        b=Qw5RUqnYs9qSiXuG+oDFB2TFZN/XIihTjaV7PTUTevQm7j1J5fPpl45wmJEW9447dS
         6i0zSNUGGG4duS1rC8FAqr/lJBTrxddpRAAH4vM96Mq8SpuZ9/0Yh2ewZIXhY1jOTrY7
         uAbq2E/EO/ZCEVHiKY5s6p8FI3+2lyZo8G1RrRmJS0CoIrMec8HXYTdNozZ8lhT+xqFL
         //S5SwD1qfjdPspS+ZaK8BSkoHLuhRtl3FEdtasZKwyXcEGHiEoCIi8t3Q+1MUuDukpq
         AQb97KxYsbWl5RWoMsqB29riwmIDbvgt/2UsPdNOypoMghzEZcnmn3Z9GBZJ4Xilg1Te
         eu9A==
X-Forwarded-Encrypted: i=1; AHgh+RqChP/yRujWTepZ/rkI5qdq/S0PHurtwbhz0umncksmrfIS4Rw3L5BxKlZMAaWJDw0cxWudWVLL+N+JMg==@vger.kernel.org
X-Gm-Message-State: AFuF++mLC8Oia/uHj4xhVMNiGpPK6kakSS2roXHP8jbHUs38T3c9XX2E
	E3ojmMb4WAc5I5LbiQbxXdQh1vRirQU0lluy10pV4jyjI/pFpMyoIBA191p1FeY9CvnxTTI7j64
	DOP+VWCdmr2MH37FF4ULGfi+lNiBfce92V7Rwfk/KkSGPw56njyVbddAyZ5Kt/80hmg==
X-Gm-Gg: AR+sD11nlLIAkcJWR6qz6cX4M25FEFmqyED8FUGoDsW8saZPztTAPuVMKzvIkVq4rpM
	/uHxNawaHrFY32+tykByURfyAp4NyipF/lnpMw1yGIO7LBNYGkendSy6YL93DEksOyn7ggOT4Wa
	fhlgJIV+j/vgyfpdJi+Ti+dy5dZ4kQ7NZfBxShjPi/7w7HLTnUznKlfRXbayEtZlY4/kNE2m5Yl
	lS9Kas79ShZQKO07x2ciikrnRIAYVWnKL0iO4Xv/IDJ1XQaVfo/tDu3hORxQJKoTDNmmZsHjLGF
	KEZqlw863iym3QJuJ9nyJ9Ky0hWNvZ1TxTwhS+qf01vjdM4ymPhMvzkdb80syJ8yaBRMr9db2mu
	EJQ7bpW4wHn/JUezY7g2QDw==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr236835485a.4.1788345427695;
        Wed, 02 Sep 2026 03:37:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr236832785a.4.1788345427214;
        Wed, 02 Sep 2026 03:37:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5d85sm109338866b.1.2026.09.02.03.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:37:06 -0700 (PDT)
Message-ID: <f80683a2-40fc-4c1c-b66e-bcdf90869dfe@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:37:04 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sdm845/670: Raise CSIPHY timer clock
 limit
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX965Vzg4fL0bC
 fpJv7LAK4qRG51ICTuQnmIhLr0OKmRUziDpAds6kwKen2VJdPdoOX4W0eGk6af0yM2O6wcdbGbA
 GLXBI2rbci8SghSrhEUI0wNQSUd4p4HbO0hYf0ghizdxaWm7bYNcPrpHSLvBafCcKXoEuRYdtG3
 DvhT54qu5LJ5WMrEGIsFlFH42+09oTD2eRZb+XH5Zj69EllDJi2+CmDUCYZeWmmqfR8l/TFO/UK
 lKlCSFWBT9tzMm3N61VBCLRTgL0i8vT0tr8sCF5r0M3oQAzsVev2t3QmwJJ5i52B/gOdCMPhY5g
 19M+6ECgIBvCju2yFxMcZK3zPECII0sB0mkN8HRH5wgUVhMLJXKz1eCltCDX29XRI02ab8yCbKE
 eEtF/OZ5zt4qoQASmO1/9VNGium8cPBZEEohjnQpk30S+daPkVIwqpPCK8i/Upccl7THbZZteWx
 oRO/noGPavvq8zQ89Lg==
X-Proofpoint-GUID: _MnpwaBGOeArFuPMP-w-oh4E0lhnoC3X
X-Proofpoint-ORIG-GUID: _MnpwaBGOeArFuPMP-w-oh4E0lhnoC3X
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97fc54 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9zb2tplEqV-KQ8uyg_IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfXxrpKsCApLmiN
 OGyN6OS46/ND5STysWG6N5/NBhtgMz5rTOtt94t79a2ShnXmOVeJkXkiYyouBEKXDh51ZvlLlHi
 ATJyjGQxGeucq4bjQ7PcoZ28OTNfXro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020093

On 8/22/26 4:25 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The sdm845 CSIPHY timer clock only listed up to 269.33 MHz, capping the
> supported CSI link frequency at roughly 1.07 GHz
> (CSIPHY timer = link_freq / 4). The Samsung S5K2X7SP camera runs at a
> 1.15 GHz link frequency, so camss rejected powering up the
> pipeline with 'Pixel clock is too high for CSIPHY'.
> 
> Add a 288 MHz entry to the shared camcc CSIPHY timer frequency table
> (PLL1 VCO 1152 MHz, well within range) and add a 400 MHz entry to the
> sdm845 CSIPHY timer clock_rate tables. The camss min_rate check now
> passes and the timer clock rounds to 288 MHz, matching the ~287.5 MHz
> required by the 1.15 GHz link.
> 
> Assisted-by: tencent:hy3
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Tested on SHIFT 6MQ with next-20260820.

Is that what happens on downstream for this device too? Is there a
chance the sensor link frequency can be lowered?

Generally the latest clock plan for SDM845 says that 269.333 MHz is
a maximum, with the RPMHPD running at TURBO.. I would assume that
while the PLL rate stays the same, the downstream branches and RCGs
may not have been validated to properly function at these freqs

Konrad
