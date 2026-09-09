Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2120652ED55
	for <phone-devel@vger.kernel.org>; Wed,  9 Sep 2026 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951640; cv=none; b=ZqP1wkP7PESn/ywccKDNMhLxifN/3hKZ57mK+OaXVcmUgQ2ck1W/BFJR7SGBLqjB1TXoHKGAT457nXkcCj4FD/7I1fYKKkdOCw7vgtzNop5JwAA+eg+NZjTRQEdrSIv9SFwxIX+TSlnuWRMPUTV5IJbFJJwCWV+sOzzNcAMvK74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951640; c=relaxed/simple;
	bh=BpZU+Csbr6XAi4Uya3364FwpsUxyX/Gtm2FuGJ0r0Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSltZwlva1O4kAWeo7Pngw7O8yU9bs21C8WAF+h3M7LhjrmBgcOBCc9Ix0MEVnNLVUfMM/Jw2Py0c3abUonKZF3k/kKGvNuvFu4P++RcgJlZGNR6BSPCgim8xe5KaWgjbP8+e7cTxfEEGIOblQrqzNZytq3T7uo5nstCZcVNrQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cH4zVMhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIpYTvQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cH4zVMhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIpYTvQ9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AppgQ1726120
	for <phone-devel@vger.kernel.org>; Wed, 9 Sep 2026 11:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=; b=cH4zVMhTMuyO21jy
	30UgnLlKC0zv279sZxMCK+xh5RiN5zRsalXPfLhUQ+C28JTBLAfQ8IvWaoWYV7PE
	UzPSVYD06CV+MImUo99tggF3kuSifr49YyTuOd9XVF48p73nU75E++tyKC0/apAK
	YdDb13iTcLzj1TgL9OAP/9oRLiuYdWw0s2UXEkiqcUoQzU8wYaBxUWfSYhMTPHTP
	Dq7s4CXX3VjbCnjO2mADXjruMYg4KHjYd6ez80ETI+UMCKmiVc7oBURqpGfxklyl
	4CVptdJ55cSeRHfpDxBUrHKRjXK/cBetZ+n/cQ11L+7ZdeznA02+DiJBvzARwaUq
	UZZFfg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0a8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 09 Sep 2026 11:00:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78ff33b2292so12791137.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Sep 2026 04:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951635; x=1789556435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=;
        b=bIpYTvQ97k2Zhj6iOBQHLmsVSlZMmYmNwvl8yt3BudN1YIa+ulj+iv7/5YIOZBFty2
         RBkgGC0pMxNEGXGoV91U8weipd7FrHwlMTGZz/SHiAQmnd0jvUNb15jpFpDZiclF9W/J
         BhvCqkYiZYF20mzeYte4z2/ptVm+WOZSKc/jqlrwrWB6Flc7UeM033xAwCgQ7mH/Tu4K
         medbj8LNjUXSL/vIj0KJMCODyBwQf6lb+hgvIEpK8qhKQMcaUICmJgQFX+AfoajXGcLR
         E4gyvtKrMIgkCMDcSL8YBmtzdvA3Nsn/iITOy3biCWZg6A0xpdSG2lDCxRCY7LPiTWV7
         NXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951635; x=1789556435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=;
        b=RSrSXnIo2U4mRxQi6l0sqsKAh2PGL4BuFjj/9hd37PxBI2kuoeslgKym1hCJlSwY0g
         PsWh7QKdqE3v6YSgZtzHhcw07Y+qqJzRLuJNuyqkMHaXrBLMwlirQVRwgNJF3JOmc4Ak
         o3XNUb6BcHx2UEVT0RWFg07ubzcvN4clcYc7yef9+gV0wIF7NlfRHts3a9rF+Jy0EoUR
         mcOSzJE46NuQ1S8LbDIk3dhSf1AWDeqebqv9GBRy+yjko2wuiU8nlig0Z0BYGIQdjikE
         PXPmRYfg7sGt5eRfvpll33s4Jt2uPXDKhQTAjr7kjc2bekdGC/l6Ao95B3QGMTJNKUrz
         +NNw==
X-Forwarded-Encrypted: i=1; AKwUvBzIoljFqF4MS8jRF6jnKt5lFD/l1p4uPJoRWPAGWOogrSrBbtydn0iWkCpFLMZJpEFAC4zozVt0nLC2Rg==@vger.kernel.org
X-Gm-Message-State: AFuF++kKHSfAPu45wE+6rettDVcCWgF9PTFpqugRNMoCPHW5wk7IaT++
	G4XGW/c8AMqGL9vpOUkfVeX2jhsY15d3clG4s7zhAhdeik979aVHNcp1ytNdTTiG09X3VJY3rsj
	juCEjnqDI3V3u3Br7xQ3CLsAU5Bxb2+7PQMj4dByzTPVjlp6z+BRup8VBtCUlCKtngQ==
X-Gm-Gg: AYBFou1JQubCNe6s6LvBhPSi8kiUi20GL6ACtuwcm44ONrvRTUpap3dPVN4+gM/ZBpW
	YD/OJQP4Vqb80ZOL7IFbRu8Zpq9J7H/9wmcZF0BAiGR1Ag7/TqBaq1wLabF6vtcl+HtBamd2iys
	aaqV4QSMy9yUpnk+Ph2BA5GJHxGZ7DPgzbxFPa4eWYg/8vhWBwrzdV15vPupXtpc+7vnb0gmm6C
	sy2hUnx4YztBxugZdNHyrj8FoNSLV0GwRYihxDay59Ae9rkQC0WHTrJwXFKYSC8wRcnb+CFGknc
	MiLeT4ZvaKokvD/NGsfTVgcktCjt7W+Rp7Dq4m9puEV+QhdKIqrWn/HHDlJdmEBsEWU27VQUlrP
	Vv9Qv5A5LlNdTnR/XrCY8qQ==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2465025137.1.1788951630514;
        Wed, 09 Sep 2026 04:00:30 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2465021137.1.1788951629956;
        Wed, 09 Sep 2026 04:00:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a49e959082sm3022831fa.20.2026.09.09.04.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:00:27 -0700 (PDT)
Message-ID: <0b999fca-7441-44c2-b6b6-a092c30cd65c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:00:24 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX7E5DZDIwuL+B
 7m+KryvfVLlu2F2vg+dRi55Oc2GYasXuziyMTh8YMuuxbp2a+j9ewRpjRbgJerbkzafiA4yOBP9
 cz3eHnlXAu7hcX788tbiTq4KLUlhPno=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa13c54 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: TQDKr7MdX4ZbOBF5YiBEcnNrcEnVIhjK
X-Proofpoint-GUID: TQDKr7MdX4ZbOBF5YiBEcnNrcEnVIhjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX2vPl3T/oFgaM
 jfLkJhujXPd3AyiKt1oXIZm5lBSc1jVA1z3IiirKbTsrZK3XPDLUuG6yePQVs7Hmd637USIyrQO
 JG/KU2rhKxhxvGz52ubm0Nzagyl0EO+OukL2Tv8yAMU+338+t/V6Bboavnp6oqyjtX0rQWM0Eu7
 q6fna5UMh4MjS1xfEwCdN7EM8iBObodouNzg99gGFwk6KoI82A2cXb7A53pbKyyGph/9v595ldA
 JLDb4PA9ojFhu8q7uZ7SdKLbPOyUhVk8NXrKbS5+iJWpAHK6KjgjtrfStgbneBvxShVTYBpCezP
 od+aQtn4DhopqggOFDq3zvG8Ud9Hu1mcmTJ8nrDsn0E/Z4pRSlmy72x7GQei34IOHgw6qtEBm4h
 pOm8R1qrtW/dYAl5ztaR7AiMM9+SoiE9HxTv/2PuMDOzU9bm73ZswUExNV2rp3l+qZtPg6lYTqj
 Q8l5T+bR9cIbUkz98Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090121

On 9/7/26 5:58 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
