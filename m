Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9FE3B0AEE
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861568; cv=none; b=BYjLR9+TqKwn5Y3gN+5kUqE9SeD15ZhtjsDN84czZnL3hSu1mZUtIxfxvuJMQKTWyzX55hjQknqla6xQcOGkgs4qGfaV5ndHeeid6uoZv+YiAh8+W9o5HNk0QbOxAeDUky+yHZ77uFV2c/KqSmerYwy0pFV3u9lYOeB/a5HcVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861568; c=relaxed/simple;
	bh=Obo8urS0LbfTKU+HQ/PJDwdmWRXP9ejwer+HCyf8Bn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ueEOlIxzEEw/wHBJzZnDw0RfVj0ey+MHqLt2NX33zkJG7ziQ8cwo3ZdKv2MaVpu6Z4+1iNVjFOVBleMi8qOhSVqnIaFcjm4tj6MQr5ZIS4jUtDZ1ebmXH5Gj/DbprTlh2uDdWlYrU38Tajtc9eI+OhsX0uN3VGX/riKD0bAKmz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5RNbTQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVG+Mf7O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5RNbTQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVG+Mf7O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7AoMk2055784
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 09:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=; b=m5RNbTQGoa9Nd29D
	Fx3ROKtAcu37AjwKpZanidVgaZPI7qTYTuI7tsr4gaz2cdRlDDBhW2ur+Dq6p9Go
	1PkwLonY49XT+lSuUuzSWPWUifFywf+KfDvXkv5SW/D9ngWuynRNAuJpPzqRKqLH
	tgn3bFyVxWDAnkIav4/oWxQMHZah0SXMUL4LkxDJmePKdcnYId5KlptE3SXXs0Qq
	xapB9Uh5bICthJNIRAsycdSoRKoHWppSWP9PooJq3VUjNnOT4ph37wfubNlXWrqF
	j1YTTR66tR5/pUwV9vvpftvIQzmqJI3bNyEgXdITCgePqK2SkardYBmNZ/8Ghh57
	LH2TpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7dc44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 09:06:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d1a5661ff1so7681185a.0
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861564; x=1775466364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=;
        b=PVG+Mf7OcjIo/46K3+orAmqeHoQ/RHVv4uSryJhTofyjZ5E85Ls/zTw2Gs0QzCC9WH
         AwhJ/1lL8cxdYsC5Si8alkEYfMzRTjAoO7CpCy2FBW/GoXQifLsuHuzlCX3f+B01WRru
         OoHVFdPWWKYZ05TsBgXhgkUYsWzj8KY29of+s7rMYzY68N6Vj98LljoCaQf9ityBfbvN
         wQap7drAM7T4L3sA2pDAJDDxeHBZ95MEF4EM7IgtN2LAmD+0HYbGLg1ein+/Nmcb7OoA
         0roMroZJXzFc5TKpUC12tgS3qiwXPSlsU4gm40OcITjN65r+XuZKrvfcrl4w21TGANrv
         yd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861564; x=1775466364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=;
        b=sWMQcIjWNeZ/jIVgvMiqoacJIeGHDvjhOU7TAFL2j+rhRSX9rtmG7kX8Ghbe+Rvnq5
         UgK426fBZn98l++zP0mkLm9aA8CaaB8w3KcPdldc4yd5hpLOGVxwpsDN5M2vohCg0AdS
         24I7nNE9w7VICeCfcyV6lAoWStyxM+zrTOcGTtbNqJ6dH3+8cf3CyLU/Vdr0LySBXPh7
         /1vwx8b57sqBJe4ekvwlz+ppQ0fe+YDHZLKLhBmE5Ob4AoT/TLlQ4V2r36nuk949hxhT
         0u0p5TQYY38G3YLq8mVuvnfks6rS8C4Hxho8flyVkmpiWWeVEvYBODiDNsmzCqC6HCf7
         0irg==
X-Forwarded-Encrypted: i=1; AJvYcCWGvo9Y6jkkMib/lGJHI4zlUpncerVwKC7e/NFMqSACLLY+tFr7+p2jDGh37TD+m5Hzh93/5b1HxzrAVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCNbYnUT4S3sTWqtZSTTQQTm9/h5v587oOrjXSasjZuDYYoxFP
	WuzvbTbcYMVfeSQ4l9oWBjjnlBqBVB4k1Cy/IDv0d6c2J3S2/vscMCK7qb+mu4RSdy2Xi5Zm3hn
	MvzlFoQOQQ1tSyzzHxqkwldrFBzx/PIOD/yWZxQLbCLYuKlTWQDPE/NI3nen1+gCT2w==
X-Gm-Gg: ATEYQzyQmq6EAr60sh5QO/JiLovdvmr8Tl6+iDqPMtXmPp6bOXODlcWmjtR9nGDAK6e
	6X8RmpRlVMf9ROn199QtTICIipwf31BCPqp8l+SI+jdC/nexN2QRh/tkjPj+WDcpKEBfOi+4R7f
	3qfc5Y8oBSpNsGEsby59o2FFm2ZAZATxeS35+aLJ7x6PUhrOTagtbirU3Bgth89DOO+mwGqcR7C
	34Sul0AMbY7cwpWzeieaacNslBj//En/VvlGZcJGq+pM3BBbF/hBdB+3Zj427CPYMj6gz7KPsM5
	e4uQitOD351Au0FpLIPuhXGPendvVg8ejZ+2T0vi0hJu/zl7y+GX2VgJdHiEWlQBbptujkfWobR
	NI/tA9k6hHfKsVxx4sKfb3IRUXPhQqFcYuENMlkTI5slBYEWbQTA50XKmoGorIuMGgb+s0lPrZQ
	40yIU=
X-Received: by 2002:a05:620a:17a1:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8d01c5c3eb2mr1047716985a.2.1774861564562;
        Mon, 30 Mar 2026 02:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8d01c5c3eb2mr1047713185a.2.1774861563989;
        Mon, 30 Mar 2026 02:06:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c07ab1634sm208039a12.16.2026.03.30.02.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:06:02 -0700 (PDT)
Message-ID: <90d8fa65-a05d-4514-931e-657451a31842@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:05:59 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add regulators for
 ambient light and proximity sensor
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69ca3cfd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0DFV3Fus7tF8Oymfmr8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: imxTcskKKZFV9qZX7p0_JASedZ_zoAhR
X-Proofpoint-ORIG-GUID: imxTcskKKZFV9qZX7p0_JASedZ_zoAhR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfXw9VuQzO3jmGD
 auWa/PSYZ9tzF+rEa7SSe2dZ+Wun1cez9FpfIOCpqJnn7KesHLjsawimHyUr9uiZCwmkTM8UqKQ
 xHya8E3kwC96H3pqt11xUphYVhJfWEPf2ec7mukwtD7RpIj39qr8UYODT2Znt40kKc7Y1KWxv0V
 0RcS6T22kM3b2Uh9UbOSBuT9XqaShVcvCW38wzPxQwsaGUTIlhMw1VI0Pa+KcgQ1fylcAmYz5Z3
 uSUNmCxBKPs4uopu/+ctRLiZYrQGsWzz7lGdazAvTwbqs59Tj4eCkaM2c5sdVYIjDWhfKMPDLBP
 RcqHnpx3ZKh7peJ2E4GF5VN9GHEpm+6XbnjaHAH66X6Qe2VY3txWIQ2q6IKp1/VSoeoGZYE/4Ky
 T4QBWEXpZi0ZR1zFJ2mGJf+GjHgQ+xzlzaDe6qTEfzrbhQ8pa5NMxiBJWaB7O65LgwKnO7Qc6s0
 BqM043cHhLBgcBoWPqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300070

On 3/30/26 1:37 AM, Erikas Bitovtas wrote:
> VCNL4000 includes support for regulators. Add regulators listed in the
> downstream device tree so they can be powered in during initialization.
> VLED supply is missing downstream, so it will be powered on by a dummy.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light
> and proximity sensor.
> 
> This patch series describes regulators needed for the ambient light and
> proximity sensor.
> 
> In the patch series which added the ambient light and proximity sensor
> for this device, regulators were missing, as they were not yet supported
> by the sensor's device tree binding. Missing regulators for the ambient
> light and proximity sensor resulted in it not powering on when a
> regulator supplied only the ambient light and proximity sensor. In Asus
> ZenFone 2 Laser case, the regulators were shared with the panel and
> magnetometer, so it was not affected by this bug. However, for the sake
> of completeness of the binding, we add the neccessary regulators anyway.
> 
> The mainline binding for the sensor also includes vled-supply, however,
> in downstream, it is missing, and we have no datasheet for the device,
> so for now, we'll have it being supplied by a dummy.
> ---

In case this isn't AI-generated, you don't need a novel-length cover
letter for such a simple patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
