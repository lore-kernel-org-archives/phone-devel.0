Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E0265CC4
	for <phone-devel@vger.kernel.org>; Thu,  1 May 2025 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087865; cv=none; b=j//tOdJ95JXp7BTj1MHhGpoQs3bJ71lkpL+YAk/BwFjC+REe8NSozwvXdUtQjYwaDyXnKBW98WZjLB0xYbXOmwDCkYSEl3ARB0ZvYlZ3Jo/dZ3L9JzWCHJJr0waOyuQCLCaC1u0eQQrYZIBEP6EkUUrCp3vMVQuB2Qu2H6ddMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087865; c=relaxed/simple;
	bh=4SV0SWjjN6to74Ybm0U5EvYj7KZjdi/ydl2GGsa9zMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sz6z35XBkAWctWIIS3fyTtorhw+HmSSu8W9dXTbwqUpJMY1CHz71WgGqDbJNO4IyOygpFw28LMZyJZ1wThTTKFBCV/ZsqvOUU2PdHnwYDtA6brs+seGN5dn+HyvPxxoUCLmvA3Wq/Ur1EPM/X6q33VNwr7o7HTZQKVYcHY4mmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY2qu8m1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY2qu8m1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGxieW017583
	for <phone-devel@vger.kernel.org>; Thu, 1 May 2025 08:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ53eFcOacyOAm+jXnQpdZtxz9kOeIhYOC7j2kMJ+SY=; b=jY2qu8m1X6hSNi17
	CxNR0kONJEiMG3GE+/f20utQJaBfcdQ6dPTu4EIV5dGJb9dmyj0xR7TKJQ+cGoGH
	CUCiJxrzBOZvsqAPxq1namQ4s5YkG2oNh6PVJJmyTxO9YSD7tkbHrVGt+ijSXUn7
	NzXJfcTeHpmFG8IThOecK/i9YdXROO/8ke7hcNeQbBriutYHGldwnxgtQUHkXOrg
	lL2FVdt4waPQoBUsB0LRlg/rOd1KUPQm3Qzl3vCW2EhwRHwcY9C5wRO03bzBas++
	+teqycKSivS5McBZM/Lehbf0d6LM+QJAkYjti6YcPgs0c+pLyKmElQKlIN2bKmBt
	XEN5bA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3vq4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 01 May 2025 08:24:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae537a9d6so1554241cf.3
        for <phone-devel@vger.kernel.org>; Thu, 01 May 2025 01:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087860; x=1746692660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ53eFcOacyOAm+jXnQpdZtxz9kOeIhYOC7j2kMJ+SY=;
        b=dbjwBF2SM6eu8M1nSGBVf6weL0ypaYMjTLcV5OvksIFXGE8bIN+m47nFIHWLlfsq/m
         z8WfddFAlNXaXK/f/lxfPTFG/xnP6NBAP936cSVqUXGWdXCCyg1U+2VvfLO01ZYOE61R
         Hu3rzRTYuVKfVVDiPcwabKHraPB8WSOuRaQRSy6XrSA69o3X188VjNf7lvgFnpOJwTdl
         3nunLORrX2tekc7c/3P2x9S6x/itbyc7+oSt/uWim/O+y3YjlwdjGL7tCU+/MWWRUFyY
         ZQ8ZTv4gKbdwt8Ik1fkVYLNKFVQUYZDN+Im/msAnk2sfygQWcu8W5xwZp2ZHivzXeLOH
         Q++A==
X-Forwarded-Encrypted: i=1; AJvYcCX6zltmFVNY5Q5G6mv5Fm1YvC0wbG6n4QL92iBY0ZbVTIQPI1VomM4ijowr1AqsevNLQxAUqTRcPjpZXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtvSooae08w9VXBIXZ4ahDcF8jgkrJriVuLvUGghxgL+pb+dQU
	xDjjKFhijMF/JstYb+P2E82CMK+DgKxwCsgI5tX5quEd5hHJK2/uGBJQzf/3/h63ClnKbDVH79p
	+qNq69BNwzMhH09ZJaABVrys9fN7CDFz4dlSOFS28DwPNmXE+7Iftim5WjmJMCg==
X-Gm-Gg: ASbGncsf9R8/wNgXn7cgXE88hG3ZTfFlbxz6HTich4y6D86Wp5MsJyGyXhCrBHR3yDe
	1FDVTzs/FX2gFgJiJ2V/X6HBS+VkUzkt0AHt+p4wCEmG16ZL4W/QZQiUahuYR2zrcePIJY57huy
	epJ6TpeBlBxCRvhWzucFge/xHqcN7GgMQm5/+qy3rYE5DCr0fUiEtDJDfh2gSS8avEm0xfpApJB
	tWucSPjiEKj0K5/wLX/3RVaAdC7D6yRl4a2FLFTxxzc6nyoDpwsDiGjaKDSboWWW+JeAoykpEH6
	gYX43jYgcBziI86nBGIicKs+uicgAMppU3ieb4rNELylQ6uU9vOVnKdl6pK/BacwzeA=
X-Received: by 2002:a05:622a:13:b0:472:4c8:64c6 with SMTP id d75a77b69052e-489e4e6d39fmr33056561cf.9.1746087860197;
        Thu, 01 May 2025 01:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ46MXi0EjwqtJAjYukm21R5nakopvue7J6cRNX84FO6gEnUuzCCno+YAn+6cIgvTftra0vA==
X-Received: by 2002:a05:622a:13:b0:472:4c8:64c6 with SMTP id d75a77b69052e-489e4e6d39fmr33056451cf.9.1746087859869;
        Thu, 01 May 2025 01:24:19 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55afa1sm7690566b.131.2025.05.01.01.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:24:19 -0700 (PDT)
Message-ID: <f65228d7-fe5d-46ea-9331-2491cab778e6@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:24:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=68132fb4 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=HmAel4GXUpO_Sf_o3M4A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: WEIZP8H-tpfCQqBtU-Z43UQrAgGr9Mow
X-Proofpoint-ORIG-GUID: WEIZP8H-tpfCQqBtU-Z43UQrAgGr9Mow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfX7TfAnwbrgJhE CgbiKRPZaOpBZdCJumDIT9C+kaHXs42pN3Y3kRHzQMLhccuxu/RVr2xqECJJpNCyfRLcm59CnHv L4avu5+PWW/ePnKe5C7AN+id8+Hckl6fOJFaQe3zzzYqip2eUpyJvVlq+Fb/WeVjnnwc4lLD9ZH
 wncebNA8ab1Rg0mXdhmW5q1izwfFiVtM4HE3BNSeR3ds2IO/6GD6GQ4+CmylXP1WuQhTFYCZ4lu jsoJZueXJZ+NQjJAVLxnLguIcVBlr7ReK8QtaMYV6q7ChHwDpyBgdcWZVxy9EqbprYktT1/ryPf RWLhs6rMmhmLh+RpfH26i8R5cgDt0xQRsRwtQgghbRMaxUy1ojwFRNJNzClTuQnuebh1lGrUZbC
 tye31C/3jW1dOQNxSr25u5qJ5RhB5hKE/uYFBi30N8nXk/YIHQ8pEdvjOTg7Q6xKnRXh01e4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no xhci-hcd
> interrupts appear during playback, instead the ADSP will be handling the
> USB transfers.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
