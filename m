Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B926734DB4E
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599648; cv=none; b=tt050fwx5hP7JD0LiqqnKiC5rButcquBPvXBVFVhjtRwRYd5GSTzEYDHdHrz9WYE16A4/iAc88WMjQE+mzc127OxaCqBjkxko2x7u196LCx/VYKEB34GyzqVaCXu/XnxQJXlJeHjYK/ZWA3Rez2xpVplb393+9C7f5E9Ch0bGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599648; c=relaxed/simple;
	bh=EQD4R80s9K33p3vFtS/DW0zAFA0Ul6Ha7HL9EjSzIXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZjdV1KQomW1Op4V5vThj0kWaXbUdMUAe2EyNpeZbtWiDTcw0kNNSfM/4iylemD+nasxpnWx7SvqrxPXL2pJNxl+3SicG61hdfdxchrZWFx3H/vfDp9I6WemXNOiexsaRG/fBkbpT8ZadaSkKkBpsGQmdp3inrdrD4JN7kUZYsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bgLYnYwc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VO11wSR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bgLYnYwc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VO11wSR9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S928Y5320318
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 11:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZO0iU86Qu9T51d5N4vqKEcp/6QeK62PA7A1aNSWaQk=; b=bgLYnYwc8SUiweei
	hmNh+qViLg+vgvHMe1+hpIekOv2yN2PZ+uIIeM725Y6//8eOTCBVfWj/gqVOrnvC
	pX81LfUIEH3BYUQTKpMqOuhKjcza37UmEaTI2dQZ5Je+3m4cQjp0F3aR2QWeukxn
	9ucB722Coh3lZJphxPBBqdUUibDUS4cG8SpAGnaktuIuw+6kouR1EngPxWymiWFX
	+EMyq68JziGtuw3XISLG81sg83tLLJmiK+TuRFhulS2eVI0k8uD3lQ2UufY6XsoH
	bdpB3/Q92ki1IkLx5Rv0RmjZ/e9xJaVgXH4OZ7fSlU/4Qg2qYIJjPsC4/LwNgc5X
	kWy8YA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjtgwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 11:27:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a26989018so15304386d6.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 03:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769599645; x=1770204445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ZO0iU86Qu9T51d5N4vqKEcp/6QeK62PA7A1aNSWaQk=;
        b=VO11wSR9eVVYR4ovShLroSDwQCFs/Tx/FBpMJjTdRMnampGBVuvVpxZcPx0h45i4Ia
         wPmJWzhxeGv//W0+umuaB6Nyra+tbUxpBoljWTw2t2kPSeDcK4TBNqVWg/F4FFIhUlnY
         jw98K96O/FR9KPIqyKbFQ/0w4oRIcFVLVlJoYUh6axARLmOf1HARlaZNhAuCWilmjJny
         wsEC7uTjIPCPXz4xTKRZDRZ/WUToyS/Wla6uQAjNRGgrX+UVy3nMoVwVOq8saLwhP+zB
         SKJOGLG6B2JZ2gJHKhO6ez5b3WY2F04bMRLvPw0l7nPI5ayqgZ3QsIVaDXK/BKrT3oY0
         y/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599645; x=1770204445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZO0iU86Qu9T51d5N4vqKEcp/6QeK62PA7A1aNSWaQk=;
        b=MNB/o0h/7KaxBJ3JPN1SHnP5aYnrdvKfSF2HsA9I6QPaCHY3fBJ5Hzwg7mMAzbkuMV
         NQxXLl81sYBzImgQ05LhiHeblfN0MiV/IpDs1qcKlAbOdK9VlbpNOe9MXPyWwWTnUKxp
         LmbxZhoWQr6TKThYLWpDFLExKAGcNt4F+OA3uvAu7Q+Up36PZuOjT80Au/cv2Cb4A02e
         yMYWaO/Q9IYX+o5Eqwh2HHaZo1mvxpGxmCoT87V5YEysmzDZ+hgBYMeTg4v+ZR+h0yuN
         fmGRP4ps9VVyJyEd56GFZQ7hpSb6Oq0Gp/L2ZnQeclDe9/wfG3ZEyw1rBPmtlRjBQvw0
         2RDA==
X-Forwarded-Encrypted: i=1; AJvYcCUSGUoU/sZ+b4NOrst780u6d1LcY744BO5WDaHCCbsXPh3rPCIpdgoE57WY9/m7nVlsdFVzqUbl1wEkNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx89kcsfsKpRrgzWCiZ6xa0GgzDrkRY+mwqhsxSGsBi2ORU7InD
	JZOhF3FAbUUe9CjYHW3my6owBjxmXETXaltP8MEJiEKUfQCk3fJFOpb7IhiikZH+nBgI5xyJxVm
	1fjCupV4CCWbQnGS7AJkvy5rwIXebO/uX/5d2c4MmFEUa7GQ2xpgYAfVC9+/h454rPg==
X-Gm-Gg: AZuq6aKaDsqYYhewATTVLNKoCjmgH4hK7aceYeheyo0NF4l/MEVdju3u/DeUdUXvXik
	Ed4/bXvyWKrK9L/WzvY7AlAxfGMXqb6PN3vLpnB5jlAJdB8L7kfkRAHjISkTvJqILMXIxt2Jhs4
	/L7QPvYf+n4w5StCLFsWGQurkRbqBB36Oas//+OzkUKCII+ePZ3/KnLxcCpl/htbIVl5lD1qlEB
	nM4a9j/PBMhNvu6OxTGw6jXLXDMXVKWoGB5e6n+adZ4/L5k1vpdX2JloT/DAvdPDSLIuCz9UrX/
	G+i42KESxBZasSdiSUY9SrqxDL66J2n7JBP3oUdT+PmABXUNX6EgfFEdplUewVNlIY43OuP5TuZ
	Y/4EEZTJ5y2SIZ9HYPtRBtVrbMOfZGTKdeQ2Su/rzZwx3gbh4vVnhQysBH0T/wVJ1xQM=
X-Received: by 2002:a05:6214:4d05:b0:880:5cc1:693e with SMTP id 6a1803df08f44-894d7895ac8mr11074736d6.7.1769599644642;
        Wed, 28 Jan 2026 03:27:24 -0800 (PST)
X-Received: by 2002:a05:6214:4d05:b0:880:5cc1:693e with SMTP id 6a1803df08f44-894d7895ac8mr11074556d6.7.1769599644287;
        Wed, 28 Jan 2026 03:27:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4452d67sm1420904a12.8.2026.01.28.03.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:27:23 -0800 (PST)
Message-ID: <2b4568ee-1d0f-4bab-afbb-cbc3215d1cb5@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:27:21 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups
 definition
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MyBTYWx0ZWRfX2YLXEkS4sNiy
 idMoSJ6nb4X56ewuWOnMsZJa0ckm6PnM0t2kumNAs/Gk7w176h2+knmriNJafifXNfGCqwBT4es
 qlKipgTgnuegZe3jKbukWm+1ypQRQPPk/QlX/Rw5GkBszj2WLH+6t5C8srZHgRVIla7rZLbRkiS
 Kv8CpAfx1MjxSw0fcyEgO9aM9oRNjWyhGrZnz9DDdldShF+PEPW3eANIEw7zv4QESb/N1Aeq8Xd
 bHT7dNLnR3sohlx5zSoR6tcCq+I8Hf3t4kR8xvNYql1s/JlzevxRmoukm+3JX07vcTCawgHdvwi
 rNCPi5g8LQkhApdg+k2qCl6cChC3wBycgTh+fKRQwWNb+4CjAJSUHGBsEbJXJN5OiDU5uFTvaqD
 nIwx4dwSlz9LenR3akE6f/xFOXYoBNEADimL+B3a9kAlIv+rgfb7YSmEk4VocrdIOnyTosAmARR
 AbTkcDzuAPnzPwgVl4Q==
X-Proofpoint-ORIG-GUID: tkMynpN_bS1hNKMB07RACu5Xuyant7e5
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979f29d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=KqVGvLWFIAZGjLrJOEQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: tkMynpN_bS1hNKMB07RACu5Xuyant7e5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280093

On 1/28/26 12:22 PM, Luca Weiss wrote:
> The i2s2_data function is available on both gpio12 and gpio13. Fix the
> groups definition.
> 
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

docs agree

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
