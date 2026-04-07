Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD783A7F6D
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557363; cv=none; b=iek8/XhxpRXKEikv38II305PHIqsSKiVcBuAy05TI7gNhZlUfyvwNYR6b065phorFqbyKMmCmxVmPfud/2oe43w4dbajHyZ2mrlzgZObSOXMz4qLQyWx+xqS56064MNY02nLZiWfcQL0IW7+2pAhoMnpKmeS34Y3zmbuH5f4nQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557363; c=relaxed/simple;
	bh=3tkcCMkbL7f7CzwQ4dRdoV0cOFj3dvD69MI1Gp49SdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtXbbfAalP8z7e4/LhRHvwTJ9+ZZv/xDv2Pg8yyn5xz/wv1fd6FosHD028CLXBCqa6lDMub2KG61VP+lI6pTTzhVyNmFexzUOK5oPbRdYumxIl44jMJ399JUzURWVbwImF6pEC0b4KG743b4tz5RQfHDhmtvKzUzqTpbhf09ajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzj/N58M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZXRtoGG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzj/N58M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZXRtoGG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63765Ts0492506
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=; b=pzj/N58MQB/HDos9
	kcdyH4GCyrILdYTIiEpM2SiOffVT03RZYIGwTC1/kPZWttKjzCrzgj40GHxloO2c
	uhKd920gHoZQxKnNJmH9FUek9THHHTIQkjGRaj9u2XnyWDX5xUtu7bdO03T2GDfx
	N2vCT8HoTg6xQHpbUmnJs+gxWFLUf7O4lpjJPTgr9vLo9XcR+I+QAdoWyZHywAdw
	/YTl/K2tsZj4kN/baEiq5KDttBbF/qFn/iVAhOmE0JWxzf1etopWJyT84SGYYaUE
	Jfz/vYZK9avSyL32MJ8CnDuUXpPY71LfRrBjb/MTTGtq+jYY6gWFV/t7AaCVkQcs
	V6y1/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t7t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:22:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d63aeaaedaso82193485a.2
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557361; x=1776162161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=;
        b=OZXRtoGGmnW9FTuPUJ8texOwPwYbYmDPCuXGxfsIDAxTHbZMn9aaZIbBqMRtdSf/C7
         odUJZR/F8+Ne1DL/SqLvHjIXhpscfxJeTsTNtwnNJ4jvcsmE1lEzBpwt8o2d9Jn52l2r
         C8shLEFGGHIjSsrJBgESBxvUfoWwD05KMKXsOZ1ueQn0IUvb4OcOnbOxXKFU+busDVc5
         1n0miScxL38Jv/cysEPdC/KZ6zUEVVf2MWbc5CJNydnVI40TgeDpZqh0x7SA/noF1/h8
         B+iCGfSod7JeB84WLbZ4a/StzQOsZ9Fxa0SYGVamihm1jqE5G/3vXXVzDf3blp7IFtQJ
         Kzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557361; x=1776162161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=;
        b=k0MGIAZz+EBwm8VZIg/JPdLJd/LXz2MK3LyeYKGqE/FV6fZs+aKRlP3y87KzV9quHn
         4o5gfYbnXYJ2+oiggCW5rFV0uX6LwCZx7gH82tkAHwUzOkXI6gh+DqM03mrXZFsYd/9T
         YLh48e/ObX6d3Ob5asW77q4JJ/Jduydehs+bJ11lPeHIdCQQaVe/kqV0fWjiFSiEI4iR
         6YVtljA0wb0ooKdVm1Ry2GEf2XV/8ViqyblKsIJhxrFH/yvfC4YKgBIrMw27p1DU7cZW
         WOGb6MqK/jb+gdMfpQ/pzUiUrraHPROaAe9G9vyKaSlEgREGV2bIgglXpHBOpQggSLVh
         sXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ35Sfbn8NPnDFTe7F9oyqafzkRLtYFioo8PmuXBlh5Ep2FC5NkkXPtISrhTVe7IB012GaRUmBolXltQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoat7HCSdaaSmnqsXaAtzvU9GY921q47pIDTf8YWRs5yGYOXbo
	eQN3f6jWdRwYmOL2YKWwMrST7W1VfWYlX7pxyV7HaGuEgk194J2YIWiXquyYkyykfIZtBP66MTY
	RhsMJbCL1rGgQiNSuUNqxyqQpo2rp+s4iXbL4yXN31BVbuhNdj4yu+zRPuIQTNYUnbQ==
X-Gm-Gg: AeBDietAnjatNuHjSbctIk83r59Y5Iv5SYIq3OgAtKDxTLWS59lIB5/h4g9Mg09ZqQB
	qEYIk5mehDkfwswiIkeKCyjhSHsYDOk3C9eg9RHbWBYSpL5xcGSRM4UJpF35a9KP1fSixbUNGq3
	ie0L9GiMTMue6yI9W9nl040lWyGTv1h29QLpE39VUArkufv4dnmQevwfjzrH22DIspO07BobGSs
	fFnVUxONIm3wxoQ+1YMkxClDndIj7dT+2y2aMgUGpVLhkhOsVb3cdbKmV1Ca1eX8vfiuTd+4N4S
	0rp6RFm4WMpZhRRcu+pGIqNW+G29XEjMwp7yTGanYHulx5817H0fQzsSXx1+aFTGQ6BDWDqlyvW
	3gdQPQWCURAxigBlTPKeiUIuVKMm3UmZ2ugial8gf0mofC6QD66LU48oyUg2CW3zSxqfUATE6py
	jPcFA=
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr4543961cf.1.1775557360615;
        Tue, 07 Apr 2026 03:22:40 -0700 (PDT)
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr4543631cf.1.1775557360128;
        Tue, 07 Apr 2026 03:22:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99fc09sm545037766b.17.2026.04.07.03.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:22:39 -0700 (PDT)
Message-ID: <f6791bcf-f90f-48d5-a104-89988c2fb8a6@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:22:35 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] arm64: dts: qcom: sdm845-lg: Improve hardware
 support in devicetree
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <177541802142.2061229.9094394728986735362.b4-ty@kernel.org>
 <f63f25751b5db2ee5420ec4c12e36271ca22a864@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f63f25751b5db2ee5420ec4c12e36271ca22a864@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qiB5qv0EGFac9sZh2HO5yM8SSRIdnhMi
X-Proofpoint-ORIG-GUID: qiB5qv0EGFac9sZh2HO5yM8SSRIdnhMi
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4daf1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=y76pSr6RzozYTy0f4XYA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfX3PUSVgSD7PAs
 hsDhcfz2quFYXKg7so1SfIcKX8MC84zYKgx+3sEyXgoyhCir1ZEUlFktEKM8hpAEgi33wS4MSUQ
 hC117275i0evCoulEif0lpZASPkoMcv4TMKD2GY6JEwLtcgB+YSbk2S997SgmtV7ZqrgPng36u2
 3sJLmKjXkLhWKVCODal5dGfGftOGe3Vp0aIuIBfYRCiGEQc0UA1FrdF6w6CZ+JFlU3bjLEq+PDt
 fLyJsvhBZLaJMsZFiCsrXe5IrP7Vn+kXX2pdz/hPtyjAb673D9fGwWj0WDttrXx0R91L92IeJug
 2CAiOG/9B/mhB70/bkPKRW/trfS2fp72Ix1OGM74WrUXLM0ZArlXqtBXkMUlOn1Oubw7zx7Lk44
 7Gv5D1sdvqasT25v9gjwp8ZManjOxGevlY8kVqCc/r3ekobEbboKaUCuhDpwZQskLzPE2sym9h8
 fQu9VvSfvmIOQp+finQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096

On 4/6/26 5:30 PM, Paul Sajna wrote:
> April 5, 2026 at 7:40 PM, "Bjorn Andersson" <andersson@kernel.org mailto:andersson@kernel.org?to=%22Bjorn%20Andersson%22%20%3Candersson%40kernel.org%3E > wrote:
> 
>> Applied, thanks!
>>
>> [01/15] arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
>>  commit: 6a9e8df732014c1c758bd3cd6254b5b4cb273c7f
>> [02/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
>>  commit: b9afe8581c0e14b7b56e2314dc7f9597bf23ef67
>> [03/15] arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for judyp
>>  commit: 8f4c53ae286bd6a113245ad53ce957e623374cf0
>> [04/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
>>  commit: e9f611de7ab51540c0cf246df6b7d4d99f4cec64
>> [05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma controllers
>>  commit: 4ec3045c969a326c458c53ca65bde5749e575d52
>> [06/15] arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
>>  commit: e746ed5af3084e9534135679c55e69eced0c657f
>> [07/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger
>>  commit: 995c258982429db93db103fc26fcb3a0acd6a5ee
>> [08/15] arm64: dts: qcom: sdm845-lg-common: Add LEDs
>>  commit: b49722c8a18cdd11f49357f3b8be23549f76a506
>> [09/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
>>  commit: 2e7cdd400b6a4e67c27fc3e839342824b51d01ff
>> [10/15] arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>>  commit: c6c66aa3ef33dc3076c6dac64003b29bd9515b58
>> [11/15] arm64: dts: qcom: sdm845-lg: Add wifi nodes
>>  commit: eb8fa32085261a07d763e9d616b3c206d0be82ff
>> [12/15] arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>>  commit: a5a5ad9848980e1019ca841fe057afb83debecfa
>>
>> Best regards,
>> -- 
>> Bjorn Andersson <andersson@kernel.org>
>>
> 
> Please apply 13-15. 15 is the only change in v8, so what you've pulled here from v7 is fine.

Please send incremental changes on top of -next if you feel they're
valuable

Konrad
