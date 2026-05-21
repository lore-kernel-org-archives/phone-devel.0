Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3953A6B86
	for <phone-devel@vger.kernel.org>; Thu, 21 May 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360125; cv=none; b=so5ezebLMvY+wyziz8XtUkm3jVrcepuZj7B/QkAE6UQIHJUXKxcTyF4JaHHtkLKGeOxkdEPYA3R0ywGYHnPARagCGq56Jk5QSIg7sOHJetMEHlKR4kQm+xqXcLBcI/wPvPsZaQftlkytDb7tFc8Nm+UT3kxufFw2yzwF8AZem1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360125; c=relaxed/simple;
	bh=OoG4A/nCjg1WGRfiXsW3OEJxdp06xTQX/WTx768OiUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyOPWuY988IWHQahpW/43pJb/ER5yXFnzJFBHF4cQVeW2RtcWEwSZsFPE272M7JVQG8N+bWB1YlnNBAkgsKqahLxyR3bbBN+NBu7SDFgBuYRLtODnPVU17mP9TY/zeYCJnS1j7Or2bCCSqgcciOwP0MhBoYB0mqmvLTrjRSoUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDxGAXEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6C4s72/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDxGAXEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6C4s72/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMo71731223
	for <phone-devel@vger.kernel.org>; Thu, 21 May 2026 10:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=; b=cDxGAXEGlCfUNI3P
	aRwNlqP+tB4kbW9UakvqPJNYMgSji/RS+EQEN1JApVu/K4ArR9yx6psHKUxY6QDE
	tihgbXOIvQgqDR+fqoMKMnqRGShIwLNxguMLXgK8b1dWBffpyY4z1EENWdVRJW0K
	sU1Z2NZVOOen1r7ZTM8e6gXHi2yrHQxFUbszz449NYFAwSPa2SMDCDmuFUbSvC/e
	PatLI1zpYDHHLs7cmVN32oecqbZ2Z8f5akQf+WHOdybc3Y6mpkKuxtcGxeIeE2Kb
	Lv2XiN9oLGC02ALr4PUE5jcKriA96rTEFw9sYjkTVRd03elxOIsnCRArN6AwmREy
	RMMllw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4yfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 21 May 2026 10:42:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-910552aaff2so103952585a.2
        for <phone-devel@vger.kernel.org>; Thu, 21 May 2026 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779360120; x=1779964920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=;
        b=D6C4s72/8Ke8m9SXvpPMe3heC9naNsiWB2ef82WdIvMb/YmTJM+rTPB7QkZ4dU0cj+
         yUOAQbyu8WdjU0q/cng6/L2z9I9oMfBEHZT5SFs6CXtV3g+5JA5sqQXH41b31oX9dm6c
         RxEcTFRhbljRk6qU3hFoFgo9TFE7d7NrK30atmBPUeYbwcqklslPyw+ZcWBK5hwcs582
         UNsv29UMz5y+vslOljUOGeZR8E9VQ+0PgrqIBD/WRODE1Rm8BBjntjNbhAl58ctt39+h
         Zn9p9hUV8zbo9jvrn+oBxHT7JYIqlFuxB+L+z4W1Kd49wFiaS7wgWpn2EolYfb6W41G2
         w5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360120; x=1779964920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=;
        b=bQgK0fMxFIh45qfR8SL9aN/uruF/ToiLyqPBovKMjRJAFpGEykz4e+iZ/1r9Pck9BJ
         60p/t12xDhU+WZGd73PqfhRTeb2lMyQnSYAYhfqsFTJcRpgSyH6X4IOZwKTuvxxxxtLe
         tm8hbpLwRvXzwrFSCVRDb4JBAuxTlHeDnNEB1RGci+sSwuQyW1EBDlzcBg7LZz4GOuZL
         YLjPp0zYUhzmTFHgDK1/vkVsIoXOQU3jAyynFtFHnIKhoDpC4Fisinw+W6PE+vmYEHPl
         VFF9gsvk+7A8wqTFXUOEQvqgFpiCvQbE+ZTo9eLoZyGcoUa5CBUaK3whipPpfJXsSSgj
         ofjA==
X-Forwarded-Encrypted: i=1; AFNElJ91HNKz/lfH5rnOIq29jliJFjrnINug6r6s7vZmNrBoOJkoRrcwJlpidjj2MOIMSThSAD9WQG8D3GbiEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+n3teb5Jbhqunp89AqmMzxKulUmw2adiqi713ORL02rBjvs1V
	OJDdZnkix2Lwb/z4XjZj59M8yxAXWtjCYNBeqNRXJGnNvZwJpZjVQVw1cMmTTaepsu0mHAQMp2a
	65QiJq2L2to+xpQ/JvX1VGfSbfzF/CPdXOKRyek4OK40KiX+wqk0P3i2ZA8C3AnB/+A==
X-Gm-Gg: Acq92OExw86FO1I2jpqPBoNsnDPLsAQq6O91jNHRy2Qv9PkDZCEK+Q3/HdbxA7NmKxD
	EO2tn5IAfI/ZbEq3D0l3omVuxlcVeFKvD2jAK9IchhqkZkhsz8jVUCeFFRZDf+dfTVZNiZ0OT/C
	xvYFv43ofjmwPyzcZxCI0tp+N3L7enHr1rMzHonba0c6MSYWC0+NQoZotifQ8ZB3qRBU8WTVHo+
	Q8UdizeoH+lH6XQQJluK9aJo3tOXYnFpl/AvzOp205oi1K5Q4HDfM8bgR2aXjdLPw+cFYFs46Ew
	/vkd5Ei9jXHK34yq0rEz6EeeSqvG6xHNKBiY7DwfLUNcKrNT/X8KpKQjYH9rxOwmdPGvzAe4Rqo
	YsB9DZR2NV6nP61y46vcJIt6DevDKhmETd1iWl654ID/WFVKlA8koQisHAQ7Omlgq4Jm2ab2n1W
	oPIszdBNSKsvxoeQ==
X-Received: by 2002:a05:620a:c45:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-914a2cccdd1mr195785385a.4.1779360120575;
        Thu, 21 May 2026 03:42:00 -0700 (PDT)
X-Received: by 2002:a05:620a:c45:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-914a2cccdd1mr195781785a.4.1779360120084;
        Thu, 21 May 2026 03:42:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670e02sm8737368a12.22.2026.05.21.03.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:41:58 -0700 (PDT)
Message-ID: <406514ab-bb74-4e5c-9348-64ededafa6f4@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ee179 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3BB4LYrPl4bHvSfQcI4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JgEWQDRr-L762YjRQ8WMWtfCoTHb_agK
X-Proofpoint-ORIG-GUID: JgEWQDRr-L762YjRQ8WMWtfCoTHb_agK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwNSBTYWx0ZWRfX2fFFbbqSz5vs
 l3oV3ODLofnjhFmNxEgnieuU9UbS1yk0SBUrb0H/sdxt3sLNOmQNwgTR3TnYspFj/3pZEnoCE4A
 XT85y2fzEmfqiS3gVLiayZKsjyAVf8lbLtbuJaieXVDZNgYn0L/U72jzj0iU0rIsdc1X4ziPcGI
 HRr2uoJhwH6ya8RvHOic26DjfNv+EHj3J1jR891J0ucg19FEqnWuJk509aezIgWgNS8QP2zF9r0
 P0Cz1syUMTduOg1yfCHt+KAvY60VPukqwGg/nGdFcV0HDXKJWsFBdiKiVHlaBGW+82H8kbcvPtA
 yiA5Muphcv6GHWFrIOjTqlSjOywzTdvCmH7CONIDukC3Kbu80EONM7t001txEh348pp3XgA/Jdh
 8YAPuR5SHNsFjIvxlPFgKFf3ZgPRNWVgXAc+B7kt7Gqh9J5EbLB26HVhRYWu8ZhHwPe/m9o4yke
 08XJLDpIg6zwSOryEuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210105

On 5/19/26 9:16 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
