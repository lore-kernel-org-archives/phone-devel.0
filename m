Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B49339845
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969925; cv=none; b=kDRpR4LCU38HTzTcecky/VNNY/GzK2b78FnN8D/0c88nNzPnBZTl3OFFSTP6YXetchPnEHNr1tOi31nVZxZkE5ta9ltwj8jkbEErZbdiu4xwWnmP+k3RagXtN+3qMQj5849hqmR3peNamm2JhubgqaFE4GcMb0o0Q3o5w5CIGds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969925; c=relaxed/simple;
	bh=LlLV/28sCuOmANe66iWLGqjRd1+cBIwqNMnc0KOSZzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yci1iumWzeW2B4os6Yo/4nUZIhX1y0Ik9UPsBt5TslFWm/8nwVUUMKVU84mQcD/M3v8BTp/C5ZfCD7uwIPcQGP2TVGBdkDukBo0WwpPafvWHqBQ+RsKWwxxV9QwszdskV61qGzg6xx3o6e1r/LNMS70kJQg2y1FmRy/6cm5aRbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmDOEgOl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDZepw5n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmDOEgOl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDZepw5n"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9fgG5870095
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 11:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExQR+krKvze2GEv0/P9bT8ECaGN87QaML9Aoy0DR1u0=; b=nmDOEgOlGPMbrxcc
	NhejsmTGCT9ztEuXfHGXWzLPbIOzuNdD1YsjE59l0biRvC9gmCBGJOpadhjfqsx0
	87MQFZVpqYTm35ypycjxjggQa/F7x+1Ui8CWSXee+7Wa9FdIFyCiDQ9WwSgiDmfi
	oNvDDBcSI9PEBTh92YGWrtYJkeTroGPVGfgzMbmD2cXdOz95c1x47uQA/Cd9v+Qx
	qtZUxBGWpGgys/bvlvRHTIxTUxULW6N/D0qgv5ZB6x1i2ikPgmhCnT3l8IIp1VN1
	fSdv0Ihr/b2EQD0SsWBRUomiT1UOPWijjn5fY+1GzezncZMJ6DPcCyym3ZWMAAH7
	q2VXHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1t6gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 11:12:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bbb6031cfdso100037285a.1
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765969922; x=1766574722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExQR+krKvze2GEv0/P9bT8ECaGN87QaML9Aoy0DR1u0=;
        b=jDZepw5nBzp8v863LSGyPzfS+GqC3av+sN4pZaPZHui/dw2LZo/iNiuPFRk8+TW3e2
         nAhnOxHXzIBk8bz0dZY0hP/0Q6Veok/bVvSy4DgTDucZ6HiGgtTMvYJqaTtRp8QPmw6b
         5RldjVwW7c+6rPmZLjTc5rHmShvCz4U1qK0F+15mfKikF/YUbUp7xouKbbXV51+bzyXC
         h4/P0M9v5zAccm2jynx3FSZCfcCY3fP8XMcjv20JscCMRVkwagNw7VF/G+c4AvsCWwbl
         KbLpsLkH0WmMhimyitrcCL9aKq83gO1nVdIcpDnEhB2GD5h39OOLAkAFUDQuWzy9qhgS
         pBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969922; x=1766574722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExQR+krKvze2GEv0/P9bT8ECaGN87QaML9Aoy0DR1u0=;
        b=LX3pOWAn8HQiV+ambJJfWTugpTVgErnawU8KEvbljxUY10uz7aMbeRanwHj6oApjxi
         V6fu7+I/6OTdKf/gvu56077SGIcOZKYYUWhfUlASy32haz1UmpqHoLNDqrzC4INaevnQ
         acVmyrt0uc2LB0a/uOQ4C5VIAIsyqcOgZn74nGALNy5CNneJJYhUh9aNlerM46tZn4ez
         CPUuwMirPxmB16vUKgrhlyVYCyeXmgKzf7i0GV9qLGprSbRkppH4rik0jIEaE2OpYKQo
         pc1MlRHxtF6nllHETSvBja3Hf17jhHFcYiL9c83N12belLJi6tiABUQo6wcUID+SLbVm
         Ekjw==
X-Forwarded-Encrypted: i=1; AJvYcCUfsiRm1Xqgyg+npEG/ikEUga1VqAIywnIZhXJOW2SPHjwFRaFQHGkQwaQG2md4HtStIUtdvoBW78v2ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKtDYlqGrGuDoao+cksr4DgPiAV5iZ8UjoeX6idHsiw5I9p1Ie
	2fxHa0epYZK86iKPK45gkP+OZkuDf7NU/ubXShvwEVOsXAvbg7tCHsxPS7EHEDctDb9X1MG5JBp
	+OTBjIkOTpXMho+e6kl7/WmXu0ctbpThghVhSV0CoyDbmpAqGPjJV+/Qw5okc2r8wew==
X-Gm-Gg: AY/fxX4bLdKlcNsotLyiO1bEyFO7fIyGCAmLSKb2W6+dqxlOdzjzk0TdmZmhleg5A1g
	wfM1ewyMJGpc01Bb/jjSPpqTAJtVR40b22D/H/u3PbNKz9fSpFglyzyaKCqdn99XjPytZD1safP
	O8r6j2suoKxr+2UAxT8/oE02kARsP4Pv99rnlodvP7fgqhxWoKYKMt995TDNfK7lWbD892jF2Zz
	ay9cWF5md9sCsoU5gae6aG6CebVjhHl6RPY6N2+w6Xa2zwLzmKfSSngHVBd2fQO4+Ybu+NKPdbs
	dqfCSjaAxMvIIW9TPBfeW6MhYRZhquOZiQYP9dxoEeZnEU2+eC0qN8/Shprvs6DIHpHjGAcFSLq
	nIZPu7UEU1RwPhk4nuuqEXVh1qOehPxPS2uoucfRmkHtE0+6qLGXkjtPe2s/aTv6ctQ==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f1d04e6df9mr189186321cf.3.1765969921743;
        Wed, 17 Dec 2025 03:12:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcEboJ4RWIQ5i7FJOk17RlbPNdYOC1Mx5pq5R91V+jM8OWrxAZUta37GzEFS30iRcgXnxB2g==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f1d04e6df9mr189185991cf.3.1765969921320;
        Wed, 17 Dec 2025 03:12:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa570174sm1901860566b.55.2025.12.17.03.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:12:00 -0800 (PST)
Message-ID: <d87d69a9-ad52-46ed-a47a-ddc74bc3d4d6@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:11:58 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: qcom: sdm845: Introduce camera master clock
 pinctrl
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
 <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfXzp+MiKTF3vhD
 KJgbyJOrDvW7Gs7TK64/W0o0dGERjxzAGWgTRWnIlj99n8N6v8NeMfNsBkQuQBBKcqNwq4TAjcK
 rzRW4+IBQK6Jvj/LmbN/CyOaFqlUzTiDZP+oLYMbwdNYYSw3ObgZTKXtKIfkVfcEVZqoC6WWhIq
 xspcH3B1GyJ/l9rdc/Woq3jW/1oV77eYMB+8ctDRR2XVprWrtL6QD5nPlW5SQB9C+6ZBflbxor/
 j0n2uhXCcgKiQW1cWGGZNRlvH2MItbab/Nkd5+zY+ag81ewQZ+5I9kfm/DUO5MAG8sdKXjgkfqx
 OjKB7QNM4troXNCYA2rGjAxitDPzMCJUD9kkhQQsuxfKPecMOiGj2K+uas+ZLez9D44Az/sVxG1
 mkFv0pcSWSQq3w9OcnlHQa72bVi/0A==
X-Proofpoint-ORIG-GUID: 6YKNFxtRGD_G3R7NCQMcfVoNoapefQin
X-Proofpoint-GUID: 6YKNFxtRGD_G3R7NCQMcfVoNoapefQin
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=69429002 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r4GYhBLE_ilKjY4j7I4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170089

On 12/13/25 1:00 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> There are shared for the whole architecture, so let's define these in
> proper place.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

In addition to Vlad's comments, please add the missing "dts: " to
the commit title

Konrad
