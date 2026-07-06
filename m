Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CD3318146
	for <phone-devel@vger.kernel.org>; Mon,  6 Jul 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345130; cv=none; b=QPeABqcVZazKYtoez0ihXcMs7Sa+0O2Yjugsy/SkWwRAbAmwchPXrvTo3Kvv7cY1rPQTMNWVSbG3OtNaxlovcIZTjFTfyM/3dS7Eyl0PcXthRBqVQ7itUHbyGaXIgJYd1laYaFS7VYJrZdiD/BlC9/KhN0r+EGWxieOoSyaeihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345130; c=relaxed/simple;
	bh=xAO8W64tER2blYKJ1bCUGeCt9pGYu9JHqw0HBiSEd8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmZLSEq6dS7bPxa7bgWTmq6kBBYrqkW1ZV76rEPpmpizBINs+WSWdHJy5j+pKbHhg+JMp04jK/Ty5qEXTrTQG7Z/03DX74kW17NRf9uiDSh9Y7vCRimyFmuc0f0O9VfvmUZm75n8uURYdPFwaK4aywBwgs6dP03/hbe41zIrZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8HCX4A7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJILlPke; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8HCX4A7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJILlPke"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJZw387475
	for <phone-devel@vger.kernel.org>; Mon, 6 Jul 2026 13:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZAtX2EVRHJ+6lsa4UnNLwpRz9laRCH4Ykn7Xi3B21M=; b=V8HCX4A790F3LZyc
	vv8eotDI86MX4qwja0XNjWuso8K7l4dOpyxTnpwoE5Zu3SoWAJgIroF9Ybo6XZYY
	hUtg5FHUflcJZXJP384Ih78WpbULzqPwTTVRG1i3EBO9H0pDUpTGUYfQzmI7m5R3
	g6ouZttO8WsCBRmXqxl4MQiA4Mg4J/4CCgKKLY0UB3+uJaJRHf8Whcv+hUn1EOss
	gF9EpJKSqLrMSt+xcHICqV+V61wNfuV0/hPIJBcn9ob1E+vq353MJgLysZzGrcII
	lu3F2DtOnD6YnZhr/+A1E7/9l2gn+S2X0FvIDIcyWhUClcuGvjcsRgYq2o4xbf37
	6VJ2SQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0v0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 13:38:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso10028261cf.3
        for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 06:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345127; x=1783949927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZAtX2EVRHJ+6lsa4UnNLwpRz9laRCH4Ykn7Xi3B21M=;
        b=FJILlPke5Cerzvbslfw3f57xJgIKYmpMtTfRElSrghXyv/R6N5XtMe6j0JH4etXUYK
         8wJykOid1/c64hhFcPrDySuq3ViZN0sA2RtLMoZDcg9AbVT4phQT3IO5z0QeAnXGMgnA
         zXCcVnxKeZQQVJDWujTO6dTkwU9R/NLCStsRjbb/BUaT8mG0UMTwlMDRu+tcbpxtq5Ux
         /smGpEqYpm9g1mPE+BE0Zu/FBmpvKt1odV5/Mk2tU2FWFmsbXTPlBKlxyijLIJBr/Fhf
         Ch7/M40yZeH0nRBAKGMYIJ/ksThVttk0f16RVnOEwxE3LXrhraFUSEH5ypZPNOz+yYts
         w+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345127; x=1783949927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZAtX2EVRHJ+6lsa4UnNLwpRz9laRCH4Ykn7Xi3B21M=;
        b=oV0r2dQDhMieyoifj+IkdrkPnXF1YNLYlXYG+wewx1NC8jI6BpxV5JbA4EXIHXKO8M
         3JbBXZibB4Q+8is1H0FoIGSKl85OcOP9yiTfDVILlE7N7f8cBXVqqFAZFUjliGKTSaJT
         pz8DQNLSE3QuG6APawsZsKQ3sNz2Z1cpjF0D1PGvPPqDamPdoVNyeTSNfls8NSWxYCEn
         yYry7a+co/vqG+rg3uvo3+jPo00Uq88BvoOBWd/7t4PRB5d6BRt0A59/+PYJSfxfmrld
         xYyNwLBk7KiWN6doV1vDTawz+VVrzg89gFPBf8mCtANVu9mr+6Un/bPG7rlvoR5FJ+ZM
         rjYg==
X-Forwarded-Encrypted: i=1; AHgh+RoOlGJTAHgAT9M+AhKh6E9DxGPTKcIqxhTjtGFm1r/0w7/bC46/xpXC+w0XP6E6/6UrCICZh/hfkpIMBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDyni4ILkilp7ZBGGa3K64V0RdeZoIOib7+ZPCrcDK9dMPD4/8
	1uaXWwncS8ufpUA4tZtCvgWq4dKz/iKt7Tqk61DVEScRUoDbyfR9rfIFhgxdddllrZMKqMkTrjY
	IfBhoH7+URQAr0WJMoLaHGAECi6kbn9IA7NZB4seaZ1P+vgVaPRkF3O8wiVBVCzNlSA==
X-Gm-Gg: AfdE7cnOcpnSyWDafJAVMb/2u/XO8C074SNFx7QGnoB/5iG0W6egNermd/hSUFzwTIW
	LFosNxwTVWOFHwHlVInUurRDy+K0UcVNdNeiLofTnTAFrUlr1xuIpeL1QJZK7w/pKE0zPRbayLg
	hu1gIiVuysmktrnc7q8+gNQv/DJwhDmif9Ai0+yGRveu3+94AJyk2SEdshHNiDGsKzaTh/gug5V
	vGNPTkqILKyIem7YGQgXB1OlFvVpfP+9O3jkvJu/j0fsK+eXCkL8fqZM8g/61T3dyxBOBv1Ub3y
	6yr3Bcx9YYnQ5Wyplah4Y70nKFcNE3vIrKEGMT0r1k9DittRA+5/iQNNRSRP41G6z/3UNlrnT4g
	IF4PTsjYC7ZtA6Pyna2GzzToexq6dFexD3cM=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr93124131cf.8.1783345127079;
        Mon, 06 Jul 2026 06:38:47 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr93123841cf.8.1783345126554;
        Mon, 06 Jul 2026 06:38:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm746544066b.0.2026.07.06.06.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:38:45 -0700 (PDT)
Message-ID: <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:38:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
 <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzOSBTYWx0ZWRfX8TUzzik1P4gU
 qpaA77y/y06Sif4UlWKjARznS/hUdC35+1/aIBJBEkzX9AqMw+skETSBISQPse9cqVDp0IAH65H
 nbqQPogTe9VN+RsaNKgesHJGAgC+nWCTySRwophm89YvN5LiwLa9UROYUXscm8lUVSxhhZ8UevI
 VW4ZERtU3aCfOZRPOrgcn9DStjdPdu0QdutUG4NiXugZlL9+Rr22/yVfrbaalz7skMVoIypImsU
 hFIUN1XX5b+AfekXeKHNDhxzg2UcN7Jvw31i2j94qAg4iJTZaIjEE7rD+QytPM9Hrb5b+o6RM55
 Ygccey/ZL6BWt+yH3KJzxqBDfJGdYQ37V7+yyo41EOBE7Tvlv3KLFGjepUS9UKyF58ukC+SY6lP
 4U7MoH6Ul46zK3z8XxNzDfCokA81qRUybS6bl/bgAY/0ioW83X28Bez9gt/qYSj9GEgjFoIfNTm
 Ag1cCmSd4f15rac6oIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzOSBTYWx0ZWRfXyeBkWsxrQ7qM
 78LPD3qoNCbne0Vyq1qChnSh0xhOlY793+yDxBzbxmhbZlN+Kx2uKl+nqu1t3LwMSKgSxRC0SuR
 CHXHot5o56YgJYHd8g+MF+lfOqTsT7Y=
X-Proofpoint-GUID: yEwfk_aNRAYbq2cUWjB0AFfF_v437A2Z
X-Proofpoint-ORIG-GUID: yEwfk_aNRAYbq2cUWjB0AFfF_v437A2Z
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bafe7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KqYH7--bGGNAKF--rM0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060139

On 7/4/26 10:55 AM, Erikas Bitovtas wrote:
>>> +&usb_1_dwc3 {
>>> +	dr_mode = "peripheral";
>>> +	maximum-speed = "high-speed";
>>
>> Does super-speed not work (if you also remove the qcom,select... above)?
>>
>> Konrad
> 
> I can make a file transfer over scp, but the speed is inconsistent and
> slower than with high-speed. Must be because this device does not
> support USB 3.0 (super-speed).

I'm asking whether it enumerates as super-speed if you make the changes
I referred to and use a super-speed cable.

Some devices wouldn't, because not all manufacturers connect the
necessary TX/RX lines on the Type-C port.

Konrad
