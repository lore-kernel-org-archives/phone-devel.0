Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584762E972A
	for <phone-devel@vger.kernel.org>; Tue, 12 Aug 2025 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995888; cv=none; b=XONaFkAHaSNqK9OzwktkQe0tp0deOQAIrywp6Od94c6BjdvTW8iTeNzl2DD4cfEf66k6ChkZrpeMYPu69LCTLb5c+NYI9GlN87bm2IyIBmhvUzVZb32IJjIpLw8ybBnTEN+lwHThn277G7L6QxvP84NiIzU0ZOPSRyppO3JzgDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995888; c=relaxed/simple;
	bh=KgnjkLOYLkDSwC0GXwfOBN4C4F4nJHESxIsZ3ha4nMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeXn3+8beYEvg0Kil5YNfAzx+esCKoYLsAB5uCmB1wEOBPmiPjM6vFOMulyJzvSeVENu7quIH+y7Jyl3RatEmlR1b8VY4jGgXUFV0W5RSN5xraVplDIFPUR3PnImX91euyEgQ4L9EPCR7h825Ftp2jYcp6VWdqGHlbYi3wnAuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaCptQg8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaCptQg8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5XQWV029350
	for <phone-devel@vger.kernel.org>; Tue, 12 Aug 2025 10:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bhG7bDwD3mvvB+arfoW2xQRe
	XiSpPUNHdkakI97zRUg=; b=SaCptQg8OXr1fB+vzrIxE0gIdTuUI0OSlqiSVAo6
	hv4hYpHddXMK4iTZYGmZ8+1Lako3QGbjomeNsCXme4kAX/1sjY+F1/N1OF4jrRiP
	zOvg9fWQv92SawDa3fmv6U47AtfmwoItcptGQlG/kvI2rzkY09rivUwjxBNCqRzp
	kCs4TW6w4MrIveaRol49orOXOPs72DmRCL9wjyU8w/TlR+Unlv1UFybeROkf1bde
	uAjOehhWjcWN2le9Z11GKckLtSi9sY3tmD7JRlA2V5taolCJhDrdSW0w5/1oBDzO
	HvGs/J94Zqsp6Ceta8DBr8qUSRi324lFr8xQGgi0/CDetQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmfseg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 12 Aug 2025 10:51:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073d7fbfe6so94940296d6.3
        for <phone-devel@vger.kernel.org>; Tue, 12 Aug 2025 03:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995885; x=1755600685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhG7bDwD3mvvB+arfoW2xQReXiSpPUNHdkakI97zRUg=;
        b=v4BtYiYYR/It8GUpRNgpja6fhkWhyZt2D8ksfjuXhPVyJ7OYM3oj/AAyi8lcoKyCT/
         qP+Opcew+KfhEF6SQbaEVFkw4EEG2KpezYNW/k63ZZeHdOyYIctZX4+Vs/mLEDUDOP4Q
         z7QncMc2f6FLzittlo0cYLx/LVaK7Yt/6LN4jEGPmodyZPux+E7OFkHZStA3NpGzrYaV
         w3aF83ojhbTV5ayUdAGg1uQWndWl7vjPqIsL71VB0l378ePvhMlUL6iLA6RXA+FiR+xc
         TXFy9RYtIR9WLQMFtmIbF8OqbOZWAl2ohHGvnbLmPxrC12pKEDVWqbvTg2mctcE9sV0W
         q/vA==
X-Forwarded-Encrypted: i=1; AJvYcCXsu0Em7n+GsykAU7sNzMzCF+o6ANNmBQQAzflPu6rTIzGbz55P8R25bx1kyhnt1e/lIw/Sxjb8YUwTXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QCPupL62YKvQn2qFkc+CJNl2nYFCyNBuxQw0ZseglBaBTXn2
	OALOLo32kfZwqIajZo75r+azuFZlWtnE9EsfPtTdltT0szqhWOdY8DtUGGwxVhwKcFQXsvFhEEh
	tpj2gun9CWRz9fVhUz5/8Yd+VtlmwPGsz1CEZAlAHl74zOwJ+uixYNOZ0uGhONAOW0w==
X-Gm-Gg: ASbGncsjiZ1j2P+/xLQaG8pUf2YlP9/jUFw9qvkjcMNwHtVnpdCQMT9Hqa/ZzFQIEfp
	n3wMljyFWJxQ2W8izinO5LYIavImHiQOqwJAntOc1U55DlPR+WQuevOnQ+65aV1jmiRZZ7Eet0C
	hMpqD34xbdhkB17RZtf2rwPugYeAkGkd8hmxBTL7sEvRfRsOLd8oyCsSZTEvNLz5wEq1Vzi4Szb
	Ov5cvtlI1y5gevDBN7eVcn12rh4bduY0VMEE2+2NmAwiC4OeaBKPbt9hAva+ND2twqvAQChGMZy
	4koa6MN2sQJPPUlbaA/iY4PgeKY67atUo1ereWrLYfWp36ergVReqmWo05DBYJ89ntESSBjDIQo
	BMGViTDbmW8zbwzNP4TCwMofdLtWbYMajqc/O9U3qOv0ZaqGF/cHQ
X-Received: by 2002:ad4:5dea:0:b0:704:8db8:d3cd with SMTP id 6a1803df08f44-709d5c76484mr34563986d6.8.1754995885272;
        Tue, 12 Aug 2025 03:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDlfuS4Nwz3fIMIuFWUdbpX9cZH7Wuc6mH++YEeE7VTQQtOIc09mesMedO5BiAjMUO345wxg==
X-Received: by 2002:ad4:5dea:0:b0:704:8db8:d3cd with SMTP id 6a1803df08f44-709d5c76484mr34563536d6.8.1754995884789;
        Tue, 12 Aug 2025 03:51:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ac341sm4628423e87.60.2025.08.12.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:51:23 -0700 (PDT)
Date: Tue, 12 Aug 2025 13:51:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: msm8953: Add device tree
 for Billion Capture+
Message-ID: <b7qczborzhw7slea3mpmwp5lbcawurvgkdhioqener5ph3hbvg@kdvyoqqv6xy5>
References: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
 <20250811-rimob-initial-devicetree-v4-3-b3194f14aa33@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-rimob-initial-devicetree-v4-3-b3194f14aa33@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX1HAG97dD4+0a
 Tff46DsP5EpjFoQru0X2ghEARRwRLjtV+KdigUuNH1M3wL0E0/PQUoCs9EkCHD2YFMHtkKv5L13
 NU2BwIXAuYDr9B7Ws65NOjXzDOhz7KuoKIuAAw+DN4HyIi6qq0ubaZTNkuZW7+EW8XCorywyt1I
 mhzE7k/cb34a/8a6pdDr3rz78eHSCxiSKgRbbXq78oMieobOrKzS1Tw6cjkpGm0v+bKOxBG4zgS
 UhV8lxKbVm/0dHbx3rXxAZpWPv80WsrzblgI/3/RZ7JTCnCyz578FPwKHWymGbWs7T7cwxFPcQn
 H69/rRsOaov/bbijkkjlbIFZ8nCczHUa1K1bAxzZN5wbtoq1UGHwAtJseLQz9JuYnwUhxnB3fYN
 40t1WxF0
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689b1cae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=N6ARxV_FePN732dIbUEA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: 42GlfXpTcD1eqoOhyGwGh4QaHcseoon0
X-Proofpoint-ORIG-GUID: 42GlfXpTcD1eqoOhyGwGh4QaHcseoon0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Mon, Aug 11, 2025 at 11:08:11PM +0200, Cristian Cozzolino via B4 Relay wrote:
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
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 255 +++++++++++++++++++++
>  2 files changed, 256 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
