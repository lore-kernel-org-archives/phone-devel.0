Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFAD418353
	for <phone-devel@vger.kernel.org>; Mon, 12 Oct 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814817; cv=none; b=lfZDtud4BlsCfcSHQ4SSZ4eARiczUyU8VQALjxGZj809D7dg/bK21wiB82uLu/fcYVs9IPLlVhtBNadsyXjH+pGnwUh/dKKGE8TmG4NVDuZx1gga2/zEgts22xkJ/h1GbabJcX/5Q4vRykBndPAYaEx19Y3x7ZGL81g8TmzRAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814817; c=relaxed/simple;
	bh=vGRDJl7kyRoobjtQdlgk+yLGBbR5Hgt/PTr9zi/5TuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAiqgeLStPs9rHyZoRfipXLOdspvSwGKmfRE3u9SdbHbvDwkbcBMxpHegsIYn32Dh1RSRnk11J660bWcU69yOGUYlXg8MBW2D6gk2q1VE23X82bOW1z9YuPArUP1R6PuLe5+dynTAejSJb86N5Zmccp4bfohcHYy2kaaLu1HDew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxeHOCiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLrpWO8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxeHOCiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLrpWO8m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0WC02252742
	for <phone-devel@vger.kernel.org>; Mon, 12 Oct 2026 14:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=; b=LxeHOCiV+2KSo/Qa
	/QrIJiuAwRpQMW6LoLY1q6sLOwspiD3PuSd9WKVXm69JWIcOm1iQimp1bYIPWQLo
	3dj5kTWLttUk/LmXtLlKr+BgUSpjcg84eTOmIl3Npo2NmXfynxL5XZlGz3Cg4L0M
	Mp95zBa8GlM3mtRkm7td6QS7rjOVYE0nn8l6TclKM2k3PPKxyMCuFr/Vn1SjiHOt
	VX4DmODDXgYTuxmLcWwhPEl9/RPX52xRmOeYt6dPAvqvRm/dtEupswae8L2QIl1S
	+XfokUHKj5KUkXndkd52T3+FTDv+N/6e11itNGba9v+TkZtgSjvf/o9mPfbmw9Jb
	hkzhXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j713d4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 12 Oct 2026 14:20:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso6166185a.1
        for <phone-devel@vger.kernel.org>; Mon, 12 Oct 2026 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814814; x=1792419614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=;
        b=XLrpWO8ml5PNxDG6GH1ikBe3bVXw/4hycA5aGJXgMHv2xtBYFT3sfjrFmbkN2HnwR3
         /Ir9BVlINteYzObM4UPQvT7H/0X5Rb/KdLWF7/NDFxKAe8gidr6+nIQfMCUanDPDtpYN
         0Kk+IxpTKMlLc8Xil3FH8SqLYG39CNMUN/0k37x4xCSx+NmBdmylpt4xr23EwkTrsYFg
         pca7dOmAvs6tfapsUGcySUNLh5KIn0XdQXABqeCBtFE8BNs11odQTVMiY2IHPBtIQwVU
         2LGwJVrritRNHbcndBl3vWmQCL0wseg0HFIt/Ss5qckXXGTo09Mj+KLYUKuV/OfFGNja
         CciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814814; x=1792419614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=;
        b=GJeWSldcqQ0aBihKSIZH6OfG77oJC/G5IvExKp8P3pWpaDMcTc39EjqGM3Lby1FOxP
         hrBPcWfbghguLsGbJY+JP7JQm80gN4vaWH1hUPAYBftkKBkwE6HTV7DTvvM+/Hi/6U2A
         goNeAFnA4XthIR9EyFXWQAL/e0Sqqg1UgH8dOu2XKE3cr/bD4lFysE8hqww1y/cnR3+A
         sb5V+2jNo9y15MikS73d0AfgSl13OjIlWzE8/GMwJA4BX7EMpOQUTvJ86fWvr7sCgZie
         TxuGHVXFfxOh2hNWzmLiyB02PVDztBqtJPiS2DEnA2ZQuku6/xIC42YB6XrvwlnU+nx+
         yHTQ==
X-Forwarded-Encrypted: i=1; AKwUvByoox+BG3RPjuZjfGgiDNIuxk7qZ7LzHy7Z/zkIZYajWHdjT4SABZAUVIICiD49nP0yGU8MLJZKIUmKFA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgEWquaBINFHZKdLpcqzqiWc7m5d6Fq6Rwof9aLFBJB73zclxq
	EZFzA6NXmGqA3ndJSW1qJzypZPmeR1RcJUMPfygEqBmYiydLR6lM6nxIgOfuCsC5uThJxqm22gH
	PQBdDJ9SVy+4u6tLXikIkwMTwakAge8RRsaorjGX0yqfviAxTq/lomsbDeBj65w4C6Fq+8NQrIw
	==
X-Gm-Gg: AYBFou3jucqGgS9gi+ttf9an4SCbqbQPMVqlCFQb8kgM3A/aPa9OWu5rB5qV/K1ZKdz
	yNh9J7Op5myxf+F2A5aS4kl30EbVA+bHcKfMPAY18bB+7jhMo0uanLkLTafr/LBh3Eb4UAwyAXy
	g4JZWO6268A54QBAUKR8bLbGmSL+tSAzGX57jgU+pKjrjrH56gQEGB+BLVwj6GTabkj1Du9iMWl
	RKTk+wBycEPeuysel6RHrr7zXDD/1P9TxKWadLrCpC+iPm/yB9rF+nuyF76unJQjbL9xs39qHd7
	KpEFF3bhddBj5hNwLTVzaHPkXPgAXgmLx5m9xpLqMdvsGhVYag9DJmNm68yzzRUTB6FBqQ3fFrD
	31zMYt8K1hKHptGFw0sQ2Rw==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr1904419785a.3.1791814813987;
        Mon, 12 Oct 2026 07:20:13 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr1904413485a.3.1791814813429;
        Mon, 12 Oct 2026 07:20:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1aaec1b9dsm2257054a12.0.2026.10.12.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:20:12 -0700 (PDT)
Message-ID: <351225fe-4698-416a-be97-df68b9297224@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:20:10 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5-mss: Fix memory banks count for
 SDM660
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NyBTYWx0ZWRfXyODmHHAdRRdw
 TJdAGGEHo4QZPM6qxgsZWFIHbOn7PqKtwM+cpEJ8d1JwtQBwRsWUdvJ91XPB8b6tOKAtqCLHiH2
 qZ2nZ1N1vFFDnUmNoL5hB0GFRxrf2Zg=
X-Proofpoint-GUID: fZ0nB4BAXHVM04KDv5qMSe7C0U_kN6-j
X-Proofpoint-ORIG-GUID: fZ0nB4BAXHVM04KDv5qMSe7C0U_kN6-j
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accec9e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=ZEkBDfZtAAAA:8 a=EUspDBNiAAAA:8 a=BNY3paFinK7L0Tc9HpMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
 a=IqjDwHP2KxQYjTbYCZGP:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NyBTYWx0ZWRfX60yITmeE+/YX
 Ss5rIIvcLOXFDh2sRBvq6yGwAdRiq0wKA1tMrZAQwZ1qZvCXU7jmntGw4vF/j7a7h2kj8zKp3dY
 TXTrPgTWQhHqEI+e89XZdOytf/HShKpPIZ+Ftfq6fvhvOgNEJfRXnTYg8ocnV7urVStnSD+dP0x
 g8h0aIga84C5W/BhY0/q50/0Y9aAutirRMHM09HK1h4v+m3U6SjkyMSHrHcryzUFB7j0G2QVgaD
 0dmbe+ifoJmlU89ISRUO0vskvCxIaIOiWU28xXolovscHyV6Y5ac01J8oJ5qMwQwbi4mMp5rjqR
 BR+fNQLN0uWvN8gCreVpohhriI1TfZz58MMWEpmPMRuq87awRW4gWNvYZp2UEvS4hDbRWkqrwSN
 pzNjD1zUkpTkHC/kQQuW4gezHphlrvqCfPEupQyDRB9fhSvpf1uW65vSIN+gBJykhKmRtR+wPta
 fjoyTukjjse4XLBmi+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120057

On 10/11/26 2:56 PM, Alexey Minnekhanov wrote:
> As per downstream driver [1], SDM660's MSS version QDSP6v62 1.5 has 29
> banks, not 28. Leaving something unpowered sounds bad and can potentially
> cause unexpected crashes. This was missed during addition of the initial
> support for SDM660 modem remoteproc, fix it.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/
>     LA.UM.7.2.c25-11600-sdm660.0/drivers/soc/qcom/pil-q6v5.c#L508

The linebreak here makes the link unclickable

> 
> Fixes: 10b6fec2c8c99 ("remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660")
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
