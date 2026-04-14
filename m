Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB63C9EE7
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159510; cv=none; b=ZvIs3qgUxr0Zh4PYBzbaL0txC20Al7TmSXR33u2C+fwfmZIljjgSg9QkGUEaZWGodV/GPpughbaihKtOGakmIC1Kg/IV2wN0RODzrkqZ6+cqFUF4CaYUEPP7IIiEv4uDIxfxlF0EHI240ItLzzt9ZMkk2prt+9/0Ga+CuERYxM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159510; c=relaxed/simple;
	bh=KTvBSKVfut/C+3RayjBd5rK9yMr6kzjkGYNXJVsrWJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxzBLmZH1hgA7ixRHOOeUQkpZwQ5v+lER651pFZRuS6Y1kRqH9FG4VZ9LrKGrdv2HNsEfjEUFhi9vZ4TGP6VQNovL7R89dAzFCkYL3SLoV9d4UAsoEult3Lr+sOZeWKjLMbsgLrk44Yv84jK4vwus17nqpC5R8VSUjV9eRk0Hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S22rCgdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zj7T+BTS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S22rCgdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zj7T+BTS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6ZQEd3505309
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=; b=S22rCgdyk0Ksxxmb
	Ew9Th1pxGW7YLVdkyeHP8gH0X3S4KZI7lfVccM7bmNxkK6ziB9upigv2Adjhb7O5
	MOVqpaEKleG+wCZXgqH8ZYeDYn6TRtKFFVnmAwuOEawzdeqkbGzxYuI2zClAag1k
	YwprDNjzsSYZkqLf1sOupW7EQ4dShtdetCHJbswvDkkHdn7LWh5w00jq9bbjgF5h
	WZamGRJe12Daq2EtZsU6+wdlOuFF2ZLZ5ERrnAsZEJhSiZ1AGKCHV2ZYh/oshCoo
	aNjZ6RFDi4JmsOKu9qFZwel3OCVwVz2hYsVE5ai9KOHnR2i2QAZkwPYp3UvOsu4A
	gW/tig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870j5p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:38:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f548d0872so17677256d6.3
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159508; x=1776764308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=;
        b=Zj7T+BTSct4DnXL6Rw99RB1l9JgduJxRteyi/C3DKWODDo/Fkc1tPVd56bqtODQfvN
         EjmYAa3VFeEY6HM5De5PIirY3oJXv+lFTJkOAW5KX+jWymG294MI5s0RAtcNKpUe0RCm
         xiUdTTsfUHpyLwR7OSesTPbZYVExcWajsstf1UN6E1oQKDSR7t986S4mkK6xqqYLT9mO
         25GhtTDZqXNy5l8/kxm61RPKRNsf01edFEaDcFPa3aTJRbR0dLmIz/DKjhnXZv1IQJTl
         5AXAM6BSP0w6vIe20yFbPX+APBeuRh3lrdB3VOCmYJZwwGGJL0aJe0JHVT+dhEP/fiWk
         fTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159508; x=1776764308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=;
        b=NyI4TtamWrkGyieL3on63l//28bTJAwZE2RSEmRk7hlyx8vBnefoZGiWgZA5cVl01i
         6t3ht/H2/nDe0/r3MipZmCrtIFWU+NJB6KyH8IvK5yYXeCyHwuQ0oeUoNFPjbyEmrlJ2
         jhyLu8DwljG6rsLSQXWkXzV4+r6EQyDvScYGHS5XZooe4Dr9u73I3VnkCVyxpcowMfbd
         VgcXnfg2INRio5Si2TdpGyqv3KDE5BrPO3fBTbXT3zlicu5E4kyHQ0G/loHTxe1nn4qB
         m4k1vQU+PboZTWKPVzVW+O7zXFClsBxoIbBiwpJ5YMx1f0EMpx9pYXJON5jA3y/pKxfY
         l95Q==
X-Forwarded-Encrypted: i=1; AFNElJ+qCH788jPYchphZEiv0va7Z29CxgfmfAnb7TbNCn1PBg/JItoZ5VoM4uAUFnZ7ROV6D2SCScNQXoDRdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEyHj3Jdj9/NDAKVjHDl3xZq2cEf6pqD1BtasNX5CpZP9XLp8o
	1Fb7Mj4LGNq21kuTSabDI6wx98zHLcjEzi43pKgFZ/9VlXX1Eq4sZRag3sFH1ylAqziDkbhaBI6
	V95jpWXY51tAdHQveYMkvw6NYNPUjbKN9Ez7nLrJQ6t96fCIVbmSw/plcjLU0QgGpuQ==
X-Gm-Gg: AeBDieuRHE7ERUTa/ksmke2TBObo+QPtYbkwZSGLzaK+j/dpj19nwyu0lWEYFf5U3yI
	u5fJG/cIp2e1Rf5ZZw1kMtPvfwCBsfEd2vENSLw95TIxoxaqTWsAIL4ziSsCZDgqD4kHgykQcWR
	2G2OB9kJaCxrKGdArXDz/pJ/WfhFVhLp4tfaT5GbPVSuLOPwmNoPuHr3W1aqFdKye4gt/98MCP0
	0w9AM7FYB0ub6524vsyj6zUubdBNpUlOLp1AMD8UR66Dssh4fqgWsGBOafq8RRcrxaBNbYMebaR
	84et9Z7sE2IIH7VwNYNx7266T99PUJt9Z369RUx+STBRzU2N9baOLgbpBpsKxpNWKkvWSZdn8uv
	MXK+styullsw3mOlWKVAeu7OZnKQMfllPFLRpels4cBhBNeWGMz+kIETXTRBjdGZio8isKV/C83
	UBBr9N86ynEEpWpA==
X-Received: by 2002:a05:6214:260f:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8ac86ea9d23mr177075036d6.0.1776159507683;
        Tue, 14 Apr 2026 02:38:27 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8ac86ea9d23mr177074966d6.0.1776159507325;
        Tue, 14 Apr 2026 02:38:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1810sm379610666b.55.2026.04.14.02.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:38:26 -0700 (PDT)
Message-ID: <5d3190c1-e09c-40c2-9ba1-df332d9f7aed@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:38:23 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfX/6ustCnnEs4P
 6Ubmf5RfMwGyuMxdYcpOAH6kTTo5pWAOl12XdFPfccT87BMGi5B6wUk/IURlFjwo/MbeMF52ph9
 SoLKbpED0JbovUovS2uz8Lffy2/5xMEotv+UniKL30I5IZfqHg1ciZ/o1oaCb448kHCupuqWCbe
 wUiEut3nma+6w+7WgX0NQLN12bakdao1XUerguv1c7IMiHYaT8LGqRGYA4i/6STYPBXLPqNZREN
 AEevq468mUlBXkiN8YIVJ2h/mX1F3OWJa4BdikK2JpIIlkG1xXzAXvjOomU6WuqupOhi38jSsxo
 a17OpgwuSR7oSVwQjDIkbzwVDbBW2RhWsKop3lT+n8n6lHZ4uvDW0poPfrDWIC39fT9SyX+OZd3
 uC1y8PbR+aSnF+FQJla/70VwZIZkkoyB3iPEiICRT3pV/HeQDlqgmZehEpw83M21AX7JwBuMQu0
 y/B/7MFw0LOeZsWxPnw==
X-Proofpoint-ORIG-GUID: -mi6jm1QfmkQZOJnbr13Y2z9ptHp3ct1
X-Proofpoint-GUID: -mi6jm1QfmkQZOJnbr13Y2z9ptHp3ct1
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de0b14 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6Xm4nHdHo4a8rT5D54oA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140088

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Enable shared memory communication and add the SFPB mutex for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
