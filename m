Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DEF337B81
	for <phone-devel@vger.kernel.org>; Mon,  8 Jun 2026 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912204; cv=none; b=QJDsuAmL3D1IGyi6cu1boX3cRYv1aMy3FpmPJs6wTPjO654KXJNgh6me5cpAKGI7+nce2XVrVUQJjjI5GcGRWdrpZKd0/6UQjdUu2ENGKX/sG/5XP1KciQbTIHNfFXywiSdCUuK+g9rGPR2sl+flntS7Epu1O7V7zXfm1FSVksE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912204; c=relaxed/simple;
	bh=WdGkYj1iMir25SymT1Zkxa2jedNiiwUmRZyq/YzJTKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fj2of+hHD+nQiY68W3TZmUJQSTRaESjFERyzmObLKU7ptytEb6knvRt+0HfmdUbJN0h5f10P2DIOuWaNYY5wFChhqv+GRt8HllbrhDoAm+t5kbIcAENxzK7IDRylUYvct8RPjfnMzER3zw0qaSgLiwh+E5Hb0k/ATacmyYLSkyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eP3/BhXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLEBJ1XO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eP3/BhXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLEBJ1XO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Olni2801823
	for <phone-devel@vger.kernel.org>; Mon, 8 Jun 2026 09:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=; b=eP3/BhXlTh1U/2Dk
	VYCfaccSUsrkdgAjLx7JC5cAfFWAn2OAJV9lsz89JAzS1jjpRgXuF+ao0Xb/WLTg
	6FQiW+Z5T2qW6pzayQbEWlNi6nuQxx4j3MyppO1Gw6zMZfplm864aDThMSPO9U9G
	iJGuL1/IZyBli1BOA6oeWR8YVURZQu410MqdmaZ3BulCaDNuKOp1kTLAYJE5LyWN
	mgQRy3Pxnd/2PrjBL5c7+g/jd/LOZ0OeWAnRBpO2b7Qm6/Nyu1nhuQXMaaHVqyQn
	U/KchKf0P/3IBM8xyzjy+hpQ8mH5qXSd4hJ3IUOspqeP58Ephc3chRF/y7orQiUY
	4e48+w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3qk4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 08 Jun 2026 09:50:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178a632a12so11672301cf.3
        for <phone-devel@vger.kernel.org>; Mon, 08 Jun 2026 02:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912201; x=1781517001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=;
        b=ZLEBJ1XOMuYQFzo2bCDgYwiI5vDJ+7kDHumjKJj5nGZQc9WDlFsrNMmtl+0nGnqhDa
         HjPlNEejn49s/H6VFOgquD9gK6IS7pUzz/dc4LfwptdMxpADsMM+PXy0tXxSEHiTSjdp
         OZ03YBuVd5lX3UPUr+4jW/ObcbT7VWfSPH9JeTBm1vKuSoH2MN1o88NDirNt3/Ls2Akp
         NxdAjG3tKi2rXiD3dmYsxArzTd6MncOzAsN/T6QEaEVY8b1sO2VG7C86Kl4vzGunMyRe
         dD4qkr/JJ5MaVp2VvSWR1uhV25BSpJaPdihJ47c0m+5jB+i6rBuAi0fkyxeNrjXWgams
         0FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912201; x=1781517001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=;
        b=OuRzFT/xczJqJGHSX2oT6tuKzANu5oL0GD01XZDEAUjjPQgiHGAWUIs5nW8yjaGq/y
         z3hcGV12nwEV8cstUUp/2MC6CwtvqtaxgCG/mZXWqm2MVoaN+NqyMsxElPJ++H7q8NYd
         klWfWWzAo2PX1d1iyQwokCujhui26Hpkc97uO24yzRUp3aqwXA0QEOOEUg2JIElhO1TK
         UqETxmxgEj2hSVMBNuXcHDqTHYke1SUNhqMcbVhpreLS441+K195wrHfJTv12CkyAyvn
         mMvQ8IGdbJwg5TivWny9Wsy3fOWhoVJbZcGDOyhSEQ/fQxW5WnJ78e+pY/9s0f/QI5xK
         Kkiw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ugm7NrSczV0c7fPf7EdOTD+pZvgpFgMD/lkDmxEqh0kYsPUsDJmdbImkj6whTS7XhnGX0+H0WYqOmdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXAWzKuulRtfmimwsolkKSnyl9+3+p1AQlKn0SSb6DqbFyioDx
	c5iKnMH+DCJAKdiuV71OIbDNv7Ranmrywhohishz7xyoKhY+7dAxQ8LBPsQS75OEXRM9ITUIg1L
	B8130X+I62gFuSVqYCtl++A2OO+NU2ytWT8sNM4DonRy1vXi/bOpUz2ImtlRdlcEjig==
X-Gm-Gg: Acq92OGR8iAvidAtLvRTm9D1RWtOFCZ8TGnwKfWFq+b5VKS0f8fnE3AI63zYNin8Qmq
	tEar7aglixe6Kevd6cKGQuqNjEhD5rrIWpkCn8B0Zd4qmfyo+2yLyYFERcJLa4IXLfBa2zU5PEy
	GM6Z33cj8ph1feY2it4YP8EB4uMKPIm9MjPTx99adcywy5AhxMeAHJrM7si/YmkaFfCluAzc8FG
	5Q/iU/1OprSWlcD2xxaUhobtrp/FYvu7uq0z626+rKihX8iG9c/acWF6SJcL/t/ENn69PZbMJXf
	S8ust7wCiFwuAFa4OcW2X470lqWlQuplgU9RIcF9uFt/nFg8waD19tAs3AosJgPtbjAGHwsAFg3
	A631OHdLh61FVuY2XbbXqtug7BbjNqzgC4oL481M+pjYYmmwjCzakFwYu
X-Received: by 2002:a05:620a:45a4:b0:915:2b2b:fbdc with SMTP id af79cd13be357-915a9c41cbemr1418291085a.2.1780912201601;
        Mon, 08 Jun 2026 02:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:45a4:b0:915:2b2b:fbdc with SMTP id af79cd13be357-915a9c41cbemr1418288385a.2.1780912201114;
        Mon, 08 Jun 2026 02:50:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e0280asm839231466b.33.2026.06.08.02.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:50:00 -0700 (PDT)
Message-ID: <cad0f559-8c1c-43ac-a923-e4d26143b572@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:49:58 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
 <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MSBTYWx0ZWRfX7aAK30jZ4ms8
 0DliKmfE/j+85LylzrOip9JfXVs4nXoZHdBehet5ywMsNyi+T5XJIs4egIuG09c6zWD2U+vmpFl
 UWbIkkuGVxv+OQtFJV/Dt5uwHfEpw3WQ2QDL91vBMGtIs38XPY0OjCXZdKrt9zYzfAM9ZREONvy
 En8bp/9pMxo2vPs0ZyDdTO2025+JOIO+/9gpyJy9E8qE3x/l/peoF51eHA1cG33Fdyyi6Z06M9p
 03ssACqkb3dYKfNMWFyynHXjmdsJhDVUl7xuNZisIajBco4bu0O9f1t1YlsNoE9fsBqE/Ia73ev
 o2FsXMmh+m00fwVYZu9AF1pG39RhBm74ZG0byZFqLiBBV7LGdG27v/Zt6Y1kX8X/UjdIi+qD5W3
 wTD9rw6STDgnwJM5ejAtHYc6x/vmJ2NI5AWOkag1qzTogQTcuWRgH0BhT8fYHZSYgzAoSI3ZIM8
 sNKBAvMmVYvlA975sJA==
X-Proofpoint-ORIG-GUID: 1_h9d85ywVk3YSY6nq82pidGTBuU42G2
X-Proofpoint-GUID: 1_h9d85ywVk3YSY6nq82pidGTBuU42G2
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26904a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CQAop9hJs7bg5q8h2RUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080091

On 6/3/26 5:48 PM, Erikas Bitovtas wrote:
> Add device tree for Sony Xperia M2 (sony-eagle) smartphone
> based on the Qualcomm MSM8926 SoC.
> 
> Initial features:
> - Framebuffer
> - GPIO buttons (Volume Down and Camera)
> - Regulators
> - Internal storage
> - SD card
> - Accelerometer
> - Magnetometer
> - Ambient Light/Proximity sensor
> - NFC
> - pm8226_resin (Volume Up)
> - USB/Charger
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

[...]

> +	gpio-keys {

You should define a pinctrl state for each button, to presumably
configure pull-ups as necessary

[...]


> +	accelerometer@f {
> +		compatible = "kionix,kxtj21009";
> +		reg = <0x0f>;
> +
> +		interrupts-extended = <&tlmm 49 IRQ_TYPE_EDGE_RISING>;
> +
> +		vdd-supply = <&pm8226_l19>;
> +		vddio-supply = <&pm8226_lvs1>;
> +
> +		mount-matrix = "0", "1", "0",
> +			      "-1", "0", "0",
> +			      "0", "0", "1";

nit: please align the "s

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
