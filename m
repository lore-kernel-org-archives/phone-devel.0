Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A825BEE8
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999903; cv=none; b=HRLOaE0VcWO/1ESbswKheuBBhRqOIxeGXMUV+x52UC9OCWOO+hEmW3QFg/y5NOK7cyV6OBljTvLmdG5/nl6vRti9i2U/aQkPyNkPBNg5oVrMK2MkFW3pno1KNws0NZoNsK/XOyUAUW2WppRqZf0hVULy32QTdSrx1CJZ6uYjPXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999903; c=relaxed/simple;
	bh=QX4v4DxhfkvVUvRBSvFp2IiBTV7+8gg+zeuRWNyVCe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=An067WM8RJK1hHvPTJJL9QFQgLJO86WBd4fGOeOVG/VzDS3z5OO4HvKb/4yug/ljQkyhdBV8Gi9btJRqUkgK1ktmXyEeDeBPNN80MP1fSqUowAnEC3K8cH286WGdZFNnkn/nK1KEG3QDEX45rmp+hFRyyQcwOEo5yGZL1EECHdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6asApzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6asApzf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EgvF022541
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 08:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rozNwP9rNVxJdTGVPBs6oK2WCT/2tAO/uW1pQSfTVxU=; b=g6asApzfeKmK3zLb
	wl//PB0rnxxAAX8m5sv+CLKGbSipro+ye5sHZr8Z5NIxdtKNP9/TDb9EFWeAz72m
	ejccBed6/GW/q8T72DY7ps+OE4IT8hICP+uHj3ZlapAZ291LsDX6SZTzXtWHIcWr
	H99zwm/DMUKXiIlE1NHBJMKebjumVwQknEGuup3lqjBaMoWuKt6SZEtqmxr9zJbu
	vyoNeFzLoNVXfXaO2sWYHxkN0s1iGDwgFsHpvZ4b68/iu2BCeGQmnfc6LFSZZpEw
	+6myKfy1NMuu7oGtUTB+icHtMBtOfOoW+ka7MKoGbNLvVbYKzt5dSiujbfwqOm1Q
	k7TlKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sj3th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 08:51:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87bbee3b92cso333106d6.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 01:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999894; x=1760604694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rozNwP9rNVxJdTGVPBs6oK2WCT/2tAO/uW1pQSfTVxU=;
        b=wBAkdoEqHpGKmwZAYkfSEVTN0JDljqVbL7yz3EewpH7tDPFyDO53dwOI6uM56SNqA1
         2EsfMOKS8LxzDCSHRRLnMJB0lBYCzlvKqIJAavoMoeKjfg6LZMLKhMajWOCmQ04lN4vW
         o6k7V6ODSt5F+WatwKi6q4rzah6Cn+j0C4PbuR1iu5Aj91YyrUUOUsXOJ+fscpqVB45B
         W4tIXmFENKKRNCkLDDd1RNgGVipPYGCtrrtj81crtg61KkXQlAMc9xl8VQH6mrZ3FhE+
         0dvQsi/3Z3EZezlkxYElNWDeHU5IM97e9HB3gpnBzISY5p/uYk+gsjMuBu5D4BpTzdbF
         Np1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZWiBBJgpTkSLW+HY/Kzh9riCT+xTOvycHfcY6g3t2Cr/WoI3RE9Qjj6xfTmWy0CLtjOKsC/PvIwwGNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZaRKpsDjP4XDgt87iRUzeeOGn6EivXhmG7s++b8F0xIb+c49
	ZOvCftNHNxanlsZdKrOEvuC95C0spI25eveMoL0W8tUHoNKPwxsjLTxp2VQbva0/vJdNM7/zTVj
	Ojq4p2/CoUKH+x/er5vatEJ7CCmVha7LB+6wan08ESC+5n9CvTLNHvWl1NwKVDClDdg==
X-Gm-Gg: ASbGncvf4+jJPrsQTkMQHNTopa1YiTEOdJusMKJt64geVRY7z4a+EHcxjZBakgo7dad
	ttHhd7xaEfotgzPrJmKHs87PvZ2pKHzrlL9mJM7OE5AzLXMBT6E+ALfdRVOprn16Gmj+QJ62XIL
	WenfzqxrHw5AHSLwzMAHMi5jiBORp4yg6gEVMCbIEFgHM/nIUP0jsepjIyUQ+x5Ytalo/k2k8K7
	xZp4kF9f20xkXreIoHITOSj0uSnMB9MzfPvZBAqpKjlxP3XT/U1IoGmyn1EcowLb5yF9XpxdKjF
	ne5PDX1zdrnDNp3pXhr9gzSQMI15mwpA2fn9QFzyto4Lgzke2NCfnl+PEsupLwAHAHZG50o/zuD
	GdSzOmYRA6IYS7GmizbZIMsiMgo0=
X-Received: by 2002:ad4:576d:0:b0:87a:a954:4073 with SMTP id 6a1803df08f44-87b21027da1mr56827776d6.2.1759999894511;
        Thu, 09 Oct 2025 01:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdr0m1qJjPCGx95tl5+kQQ8Lc5k1Lvq51C86DjFACuanr/UCQghW1BHHi6401yO2k5MyRZFA==
X-Received: by 2002:ad4:576d:0:b0:87a:a954:4073 with SMTP id 6a1803df08f44-87b21027da1mr56827646d6.2.1759999894039;
        Thu, 09 Oct 2025 01:51:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f40f23f2sm1850757a12.38.2025.10.09.01.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:51:33 -0700 (PDT)
Message-ID: <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:51:31 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r2DGJUPabxfTe9hnXjeB2Poc8_OUu0-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX02rj3Wc7K/Rl
 339zCtGMKzT5dWnaOB1zyVreFOGBpShXTdwxhEjwO16mpIww7eeGdRC6gXj6zn6AF2GMVUL8s4j
 F4ZYzo6ISfk64bjBA5+6Bvi3zDnHLS5odTAhgb/X9RyAnurqX7vo9abIO1tHaDSw2QA3xR6zU6S
 L3iUHROPDVWJkjE6l6E0Gj0aMHHLMMQMiUTIk01C8bf8HhUf9WaJubz8fQPwFkP4cNghzpLmBfK
 gywWRL1E5fr2rd2b6mev5qedJLk4uyO/XZlJXlKfuGDDJqBCbIwBUj+UFp0mRyngNR/ZfF2/oDW
 RwWUeUQgpbt9weQ0Mn5Yb/n59F9TScPqARLuT1plP7COPQdrvRCvlKZidrqozvOPOm0HrPrNSWZ
 GhbH4Z4LbE0veFBx5pWdxoMAdyf+KQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e77797 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=LME89Ewccn7mWiF1t2gA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: r2DGJUPabxfTe9hnXjeB2Poc8_OUu0-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
>>
>> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  5 ++
>>  2 files changed, 83 insertions(+)
>>
> 
> Please also describe, why it's not enough to use defined compatible,
> samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> panel-simple-dsi.yaml

panel-simple works for 'dumb' (perhaps a harsh word for 'made with
just the in-spec DCS commands in mind') panels, but Samsungs are
widely known to require a ton of vendor magic

Perhaps the original change was made with an "oh it just works
surely there's no drawbacks possible" attitude, as the panel
was left initialized by the bootloader

Konrad
