Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AB321C190
	for <phone-devel@vger.kernel.org>; Tue, 22 Apr 2025 23:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745366134; cv=none; b=pXE5eO+eeV1ZHTE4oXSiWWSvJG+HgpMQBHpl9hVd+XUh2i1yL5OKy7ygNUcR8S4O+arncmCr3JEFH5DEEtqObLFyi/GMrvCjMBAPCtJHbHc8NruXfxD9Mw72IL3Ie9pPq6NjCiUp6a0i23R/cBzaUDGC8YT4rsrBpuyF/qzJ58U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745366134; c=relaxed/simple;
	bh=1uXwF1nWfvBIYeAK4gSOok5hMVJKS76PKakAup+bCLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+DHZZzMueIpT3lPN8h+sQSoFtGeXVmO9z7fGR0h/BSj7z6+aJgQswBQQ1Ohgccfzd2NGTb+UCsvIdRSwMa84KUIjeJVDmtqYHtZX4J2/S4APFEaH4hTcld3/3plRPOg7zvVho8HbGLm/o3WjfFW9gCwYLQKNNcqsmOApXl7/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC8qoxc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC8qoxc7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKpbQC017040
	for <phone-devel@vger.kernel.org>; Tue, 22 Apr 2025 23:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SibCIoJLPofORnNhgtOkaJm+Ip5k/Pjt+gz3fvgMRA=; b=ZC8qoxc7CQdP2CNZ
	gjEvDtH4JxQAupCMm8zmFo0A9OnDxqQcN9EQhmxlNjq18u8eyl+1FLs9JVM2tTnW
	1Ed5xjXSFE11Hee/kETgt/S+iE+HKbjv7y4C0AF8fnPf0cHPaNxBhDiVOMUZZXOR
	YdN6sJAm5Ar3H2hNPXztuj6BCd52JFYdZXZP4pS/+mTG9cNtuyrVHVUCum7f5Fgm
	4qLouDg3BhBDzZycpLRgEIxHv/b7lpHAAR1gjJdhTEwzujwyP1JIDLJ8+C9KXAil
	/RnX/8LAIKXK+zVr4nXBEbw6XmQrd3w+IiaOcb8fAhiR9dhaX+oc1vyCt4UZy0VG
	JuU/cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh58aep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 22 Apr 2025 23:55:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476786e50d9so14159221cf.1
        for <phone-devel@vger.kernel.org>; Tue, 22 Apr 2025 16:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745366131; x=1745970931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SibCIoJLPofORnNhgtOkaJm+Ip5k/Pjt+gz3fvgMRA=;
        b=Up5566yv6pE6CRYn4IO7L1tM7kYTypnWr03suXfI3Ola5kv2qo6n02LNBz1Z2kflif
         2+6yHKmbCaqghrIbbJiOYy0bu8waA/yUmWfh70DGGLFdhrudXbF6PF0Trtsbq71FWffB
         +DcgkRir/QVSiqyUf50Mag/hYKlmXgYuOVbmatHuHdjyc5vM2CEsRDCLG57h/2epAhwh
         LbVdtoRFfgMCx8tkPMkhttyia8aEAMVsVP0GjqdPS7B/GhQ/fGpBDp/tuWfJ4Pdy4tZJ
         MI/2LoUHj6JjJJb5sDzGeNETIWHl+xDyPF3cex6jOQo4CeSogzd4s4VjBC+oG78BLgR9
         XLvw==
X-Forwarded-Encrypted: i=1; AJvYcCW1ho/b8YDwvQrdSb9Lhh0b/icdg/pwxwDeBith/Ortv57i2uNZYLaaFqBkO2TKR+52jYE1KLLMC71iPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRZ6cN0Ebz6qpBecQcXLeTFH5ghziIOdN0FNstqaQ1WcRYuTP
	h9q6CsikBBKfY9nfVb1geb0xG6881UlK5vpdKLcbtZSiTMxrZisP8fEe3jIEF2lZ99bBrU0ZZXT
	EhefKlBkkv+e5n+ZnDVlUIStOTeVsOvnc88jZPGp3TNgsz1bysNvOvKzG/s5eZtPlgkanKg==
X-Gm-Gg: ASbGnctnWuPMv8LnFM24FEWANHIss///Zw884xZEdfs2GtOCOwF9FiV7YwCjbMO1HRK
	27yvuQr9NWobpZeK4blxw/NjZxAjuGMNuBqZxAPLORGynYh8cf97S6Q9HChhvUgkKSIySw6MTUv
	njBe6OXK2Vzxb+dRSMBstg1PPYhRLt0L+rkJ5MFJVTvBDCR5NA/G5ROZLYoDkJZUxr1Ur+HMRD5
	v4L190BjORZbwLZm5nk2y03nWkB8CSeECZ487G7acAiKB5M5rbj2psivlhfcPaPmaz3xULQ3Ltz
	E8U271OcqNxapwc2qsDCXoa4j4J9CrmUi6EK0UavlcUtJCWHc8usJNPODL+3k0BEBVk=
X-Received: by 2002:ac8:7dc5:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47d1d9cd5cfmr5273071cf.12.1745366130619;
        Tue, 22 Apr 2025 16:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR8WOuTeaBqmC8HY7gKGm3GRXoWCrCxlpeSTPYTgdFKgYeceHJhp2S7nDIq6tfwkx7ivcQ5Q==
X-Received: by 2002:ac8:7dc5:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47d1d9cd5cfmr5272961cf.12.1745366130332;
        Tue, 22 Apr 2025 16:55:30 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6258342fbsm6701884a12.49.2025.04.22.16.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 16:55:29 -0700 (PDT)
Message-ID: <8c0c0740-3f75-47dd-8f11-c03fbf8b1583@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 01:55:26 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add support for Sony Xperia Z Ultra (togari)
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE3OSBTYWx0ZWRfX5U+7E6N+9Q3U uGE6kwdXCRKAtLYI/9KOukL3Y5PXzr3nocl90mqLiqK34Rq0I0iWqfDU2KKHM/3PtSssi8a/iPJ 2xI2bHf8PrFkjz74XHo7fhcStvVA1k6+zict0xTRrKAYBjwqM+rmnFsYXoUuBd5Q9m90L5N1Yj7
 VSlN8HwwcBNtqfalSG56nGFvQ4heEyNKqJ46PGk8xsbda/ijuH7uPKpnFN+vVXsxRIM6rzUr7NC Us0EEZs+e5v5hvUVkxs5Jp9KYPB/XMoy0ebYKoDi3M2O3GRFgPPQxWpXHi5hq9x+tT7NLhrb1Mj ionsoHwKWfmI7szyOJlvuddMhH9jBlwA69Qsq0y5x+UZ9r1rwtl6AWe7NkNf41wq9R1g0MBp6vI
 aH6VHJ5nNtfnyJEjYGxvIu0Rv/xD0idRIMwfAcR+0P/VADuACsNKzzznB4sfBYFWXBcy0XCR
X-Proofpoint-GUID: ol8RkrNoJAGFBJwcPweeOYFCr3rMN6tQ
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=68082c73 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=dlmhaOwlAAAA:8 a=Kb3nHg1V0brCK_6dO4AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: ol8RkrNoJAGFBJwcPweeOYFCr3rMN6tQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220179

On 4/19/25 11:00 AM, Luca Weiss wrote:
> Do some tweaks to the common file for the devices in the 'rhine' family
> of Sony devices, and add a dts for togari.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

I don't really know for sure, but maybe this driver could be suitable
for its touchscreen

drivers/input/touchscreen/atmel_mxt_ts.c

Konrad
