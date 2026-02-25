Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08D3C196C
	for <phone-devel@vger.kernel.org>; Wed, 25 Feb 2026 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030905; cv=none; b=oLmzu91g2IIHRJ5+3jnbLh5ULU5deze5NsvgqYEZ9eGqc8TwiUxXyj1yz5TDeJzMyoxXDmoSVe0SbpepLqxjUy1P9Pr7SO+ystNKH8mmeUzhy/tUdmcxauLvxDLmptZTO+eaNhBq3qXY99ssFKem0IugABlswwxeqxBa/p6LP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030905; c=relaxed/simple;
	bh=xidOB+jX+4w0CUBEqt1PtSU26kes9riZzE4qVFrxmzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=encQ3dPGYSNn3O4aVN1xRD61V2dCtpuYOzhBaBwjqFA/ESdYEXtizSlbS6YhF+/OaQPogr0OOh+HSbs/JlA37Ek4o+RC9G3CDUNc1cmH22smfDrgig4JfFesg3Nc9Zb7HWMFxlkimbYMums99S9skeJm4EvkFXDOLFI/W1oL8Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDvQRzLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rf1vJgqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDvQRzLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rf1vJgqd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3Rv11512055
	for <phone-devel@vger.kernel.org>; Wed, 25 Feb 2026 14:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zADAch3Mm7UabY4EXg2OfU3UoQHMHTE2nopv33diB8=; b=dDvQRzLKfxytsAk4
	rGwK/IKh4wwSCLTn3WsclgXdAEXAramwI9zp/UugBclvjd+EOxqAJr8v9nsIVFyo
	nhMZjkEDGhqwfGAAVY45bs19sjPt9JBcX4xluYPkgdJXfEktQbczH9X9nwHPuTwS
	zjuRKM3hApk/AfkEoEV0AUP9Gx5nAKy4Xu8HHNkIIrtGKBKQGCD18g/4JlR0b/Ty
	+vLN+YqNfOj1PkXnAgS0CvP5lHAdt3EfYSPK9ik3smCGkhofjEjH5ltGGvED4UFN
	OvrxufYjWb7di4S2J6wqzRvdVlKpT8YveKYzX4TaOhMaO4e1Ui8Ztu9o91X9SqQN
	wd8+QQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf0jw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Feb 2026 14:48:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899bcf92decso2857576d6.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Feb 2026 06:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772030903; x=1772635703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zADAch3Mm7UabY4EXg2OfU3UoQHMHTE2nopv33diB8=;
        b=Rf1vJgqdBLXpNCBOW4FrTh2TkjXynJ/uewdemoM1Gviq6RSy9k+70mJRrM1uoLNNZ+
         0Tu6WJZBmCZnTRFa9/sqcG4v2aTgb4XdUc4zVOe0ttwRTVEj2CvuIc5dJFCkWrUv8bsz
         wsB84U4ho+dojr3/6TBs0Gi5cfdHjeGLvMLnXIwos1HFjxtlzdL2pp42nMv6OYA7SIR4
         pNW6jDa3LTHw7kXS7owdnYLOzBjLrQyunI3Aab+XiCLr8HLIjU8Cp5Cv14wa2QhQGqLy
         x6wDASCWpNJSOVS3O8S8iu7gdIZdcd7yYnFAqpYE+Faaalwc1oxJ2FCjB6m+Pj0MBK/P
         6nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030903; x=1772635703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zADAch3Mm7UabY4EXg2OfU3UoQHMHTE2nopv33diB8=;
        b=mOU0z0/B+abfD/oksd1HeIas7b6lLLAkDaaXg+hK4HXSN5wUnoZVDao7dLKZAQU9eI
         hSo+Q3xcHHEVW1KoNvK7kkJJYYd8W5c0BXfjtpUGPN+GxSYLtLcIw2ZCI9JYv/PwGfxp
         agzN0FTswhLzhITpIzYiKLf3Ssnc6cUzXGy65utehYRGiRzpnAECTVTcc9t+0OkSADWT
         s4BqRVBwQG1Gt50h2SO6koVsg23d0l14YlHL58qTUymXUeSL6EXBoxrAyZ3KNeMK7Kva
         amMAbGh31ARMUKXz4WgQvi+Mq9UaY6mmOltUOXS8MHmndhsEpMxHZK0UX9IepAXl+iGo
         lITQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTrhBz/JXldaJF3/1DqGmv6DjBH5bQY45tObr6EZWHAJFyjoSBHrIBNAfmJVNPBPmVCFQsSyQpxRLTQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz90I5NglR5WQKgqdx0Azw/gFYM1NEUp7zD3TMye5G2C6PVirhu
	tbRZuYq9qP2JqjX2DyLHO50XBnvqxsxKLW7sSzyBmI08fSfvswM36aWm38HYKXe9+h30curH5ic
	aIKCToY/bP9RiwWLO9gKNtW78/WnrLGEZw1iDa/NIgyVAETWSu/yaUQWqFfU70m0rLQ==
X-Gm-Gg: ATEYQzzkAdae48CTKQngZw4gRNJ4k+liWiL9Vr1twPQhXQVhla27C6sYaBnvcoYMBrj
	145zd1ruATSst64/jRZbT74veX9w36GGWr0EnRJ9lnM+Hy/vncHg5EeTjTJWSB3kddMLFfNZzcb
	h/YeXk3sb2UkG+e5HfnRFXvNsic/KwygyT8J059lSMKYCVdfavrg6tBRoDAs/XXIbnSWdCE0UaM
	GgY5xkycHqYPCMmTwawQ8YI5JSL74AAF3owq2hlvjvotwFg5nYOCawPU7TB+w83NzwEAJ0+Z088
	7V8er5VtQR8um+dAD4CGewSRU6VVUhjquBgYOfVvXTS9Lz3lebW0lPto7OpSuoSjKXDVlWhOH98
	AqifJWc2zDaCH7z11rTCp6htmGqf/X2b5qksBfaK5vSF6ZX5L11NPD7M1fhTCGmmK0JuZX0lFhU
	ONjHM=
X-Received: by 2002:a05:6214:4f04:b0:896:fd66:a084 with SMTP id 6a1803df08f44-89979e1ebe5mr155965716d6.8.1772030902720;
        Wed, 25 Feb 2026 06:48:22 -0800 (PST)
X-Received: by 2002:a05:6214:4f04:b0:896:fd66:a084 with SMTP id 6a1803df08f44-89979e1ebe5mr155965386d6.8.1772030902230;
        Wed, 25 Feb 2026 06:48:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm509759166b.67.2026.02.25.06.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:48:21 -0800 (PST)
Message-ID: <6e525b57-bab8-4549-8d33-bcdb1a474fea@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:48:19 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add ambient light
 and proximity sensor
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v4wqT0kZWe0LFZeRdwtcwQIH5gj8pG42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0MSBTYWx0ZWRfX0VHycmO6y0vu
 PsXnG3g1xcs8dKUEbRmZJXNmMmIHKt44d4wIDi3b8VvGbAERbHLPg9mseLkAf1+NBrFuykV8JlB
 +THO+t3xcnyVB4AIb2xLrjXk7uui54SXtwEtq6X9gUUOe1OtcTi2IA/X9Zf/zMXlyLBEexYUord
 Hx4gfG6kLNvfxpNpqLlqK6pX3bpwlleKVu6YLtB9sQlXYAu5HkHxgTwj9CD0JSVULOjhTqVYW4V
 GTOWZPGJetScwv3rIWCfx6TxTqfmqW6JH3dwnTkxhGW2086mDNo+iEx8HgCQZ1hdQokJjebX+Do
 l4/mtzzwNUWiAXdkKcvK5rO7zXKyyYYboeWc86veSj8+rBZpE91NrsdhKWJhESghHs7IaEdaXFl
 zJ4181qrsLbMtsOjypHYB2F36uRafwDW7yOuEHDItTQ2PxuIwyxkfn8Do8HnPD7EBi0Y196LNGU
 OCPEwelpxfZl5onD2FQ==
X-Proofpoint-GUID: v4wqT0kZWe0LFZeRdwtcwQIH5gj8pG42
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699f0bb7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=DldKRDGfgS33INwkZP4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250141

On 2/25/26 3:43 PM, Erikas Bitovtas wrote:
> This device uses Capella CM36686 as its ambient light and proximity
> sensor. It is fully compatible with Vishay VCNL4040. Downstream device
> tree reports Capella CM36283, but upon probe, a device ID for CM36686 is
> actually found. This commit adds support for Capella CM36686 ambient
> light and proximity sensor.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity
> sensor
> 
> This device uses Capella CM36686 as its ambient light and proximity
> sensor. Downstream device tree uses the compatible of CM36283, but upon
> probe, we can see that a device ID of CM36686 is actually read. Possibly
> a driver for CM36283 was adapted to be used on CM36686.
> This patch enables Capella CM36686 ambient light and proximity sensor on
> Asus ZenFone 2 Laser/Selfie.

Downstream using vaguely-related compatibles is ""standard practice"",
many vendor drivers don't really care about semantic correctness,
as you were able to find out via the chip ID register

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
