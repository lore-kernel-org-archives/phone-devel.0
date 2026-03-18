Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6063976AF
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834402; cv=none; b=JS1hwXgC6L1oYgHXzueP3Nmpl9k4qCshABIHDz/CMg8I9tnIOKx8O7nFgOtpoeqjniitci0GM/Tui2fGtaYpAmx93F85DQKpu2VpqveLqUuDRurIf7tGvByAUVdgwM5aePtXChN1rUhsHOf9W/Hr3nOg8z/RtG4QDCQCjfR4BNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834402; c=relaxed/simple;
	bh=C4VMR2ZS2kCbi4/xv6c6uP3I7B2nHwSrgd3D/xwi8Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4FXarZc7HJ2wbbPwZvjXbjvTYDaO/13FLCcRaUcVnOsM7HLh8WW7sehVQROFo+sJKKugDtvV1be6LqhjN3sQSRmwCHFyjeXfCqpFD68+8XqM6kLlqCpyZnkR9iievRL6bZZuKsKqIupLjHFrDNdEUxz4DbHT67Jv7kk2t+jwD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVfmqAjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzyRxJwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVfmqAjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UzyRxJwl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I7i84v2790044
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 11:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfkIvEf2S9KYaduDgSIvZHP++vk152IwD0k/as2H3Y8=; b=lVfmqAjydeF1JZQC
	49LGem4DUP7aBKBo7sG+rT/z0x+J5M3wH4GDXXso5CUtdDVu7/uMDOGQlCLKWEQd
	ks0pHEW4xIKCBK2l+0GimuDSSkh/OQWJbBEA3kehTXxAOmau0eql7BlPIr9DymZt
	Vc6c0YoO+SF/nCCiem/9RRaiBaDEFKH40u4cJbYT6WzF6VwfGmL/na3EYRIJ3Uhn
	UAaUb0ETNw/3l59GFlAcD8XXfaWnDBKWNyuY0jxi2xj3mY2DXDPkl7dLrbNfmCCM
	EI+C71NAwid7x/Nb94f7sRJG5oYplKLs+nrd9RgImOHtXeJ+L6tpMTsK5CjjfhHB
	HUz8ZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g2bwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 11:46:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50910ca6ccaso87971231cf.3
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834398; x=1774439198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfkIvEf2S9KYaduDgSIvZHP++vk152IwD0k/as2H3Y8=;
        b=UzyRxJwlTFUwzi9xBEk0LLaLVk6E5meLZ/DMbkpE47t/fZs/JF5+XygPIpG42X5UD6
         mKebmcSOOYLLKobcYVacsz+O1JAZvrmeHyUx803+HXxd/AqoFj7dXUIPs44/gugIdx8v
         h1YmVAFIFNAFJUGF/aNSSSXTHeckXHr3TBIHXd4BxyDlcOy/HkWg5Et9IR9fpMlxFIJj
         uANuMzI03B5Xilfc34wBE7MH+rH1RvaMJ3XVEyrQ4fyYmYzHZcqXHoRWtmVn4L0WxXa3
         XAkgKnSekQBkQSbNHBwL2FlTR/HfZnXJSQBXlPFjRXEBxGuGhB/iieNYaOSvCeoWTn4/
         C7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834398; x=1774439198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfkIvEf2S9KYaduDgSIvZHP++vk152IwD0k/as2H3Y8=;
        b=BawPTHW7pfqUcNkY/fzTWVD+y3Q0W4tXy0AR4Ul7Kl+Njhc9VD9sxPoVDEdIPs8AXj
         wKWwBqIwpFS4ln0anuMOLa3hc6+HQhLgUG26q8P4p+xQsE1TsRTTmoY/S9osfKr7FTtA
         ygEGM4FbYtwTv0pXJ0WbHLYRdUJZLZzLua2NsILh4bBSJEXZE1M610Tv71WWTqqbuTPt
         PcIxza12h6pZnunCPM7EGJ5LwoJNRECsFNuzvAIwy+TkALAvq3JBBaK3SAK75hGXSZl0
         rDvDXqwYhI3mjBzNszJ6KPb4LK0m47m4klipoJqul5CuIums3uMiorwbBViPqxh6psbK
         C2bg==
X-Forwarded-Encrypted: i=1; AJvYcCUZeJZEM0Tyl08q6o1Sbx9KK63yUBCfODw5XWn1m6BRQMUGWyIYE0cedMVrfPRGT7VaB9Im0CHoIsUStw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxltJpqQ5Dmj+qhkg6C0ooDSpRRRUjh6ji7PuTb0Saal0KDu7P5
	zXO8BMIZSVqQFS3Cug8I5XCWIck/kC83sCpNcj6c1QoIAE9nmUbet/BMS35cNEPKJWW2GYxqaa4
	+I+nKiC9BgJFV+Q91GiWjCwEaHZsmi+CLY/x75n6BYEhnAtAVWaCHXJc/1BBRWndJUQ==
X-Gm-Gg: ATEYQzzyW/iKKmEqvxklxug+oFlpwgIgLm97b5NRNwc3rLlVZhwK43BWEH9bGpc6Yg8
	O/5Ro3V0W7Uh9zKO7GcV+MzUbX4JMutecOQ3lytzW6guStHox5OEPlGhHL4xJROwop0fCTgu2Ay
	Blg/RrEYMikpsOqr44sIpATn7Lkog3kUK9eKidgSZ4Mer+j0W1zaQGLJ813HqrtCV6xTdQ/Gdfk
	S/vPwBwnEuaRJhkUvote8K8INQqekpASjvhyKUCYMegHPw4/fBxWx2dPg3n2+558tcta3sT+hUL
	XmGoOfKE4/dGenlP5mm2ppUZnakqYJYYbQPU8rUMSfCsw160+iCDLqz6bsPaea5ZHSU9wdM65Pu
	pF1FRur5+O+BaisA+inu32vJfEv776vwyeIFZ5i8U6QKaXlC0/rLHm+DFH/26Jk7UFqY/nCbD6j
	6m+Us=
X-Received: by 2002:ac8:7d88:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b1490a4d5mr26569811cf.9.1773834398364;
        Wed, 18 Mar 2026 04:46:38 -0700 (PDT)
X-Received: by 2002:ac8:7d88:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b1490a4d5mr26569581cf.9.1773834397962;
        Wed, 18 Mar 2026 04:46:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1689d2dsm184500566b.35.2026.03.18.04.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:46:37 -0700 (PDT)
Message-ID: <e5dcf0b9-3a46-4432-bd74-4c509bbf49d7@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:46:34 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69ba909f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sfOm8-O8AAAA:8 a=Zz-eXXhDp20MwffFlEUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: 4dS5BZGjw2NZXzxorUd0hLaDnUorRyLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX9mh8ek8FU2cj
 6rzUcUz93T2cXs7JJJz+9yma3cyEHjSgW1NAJCkMZKWk3EcG1DnWECXxBE9Prny9ho8tcdagBZO
 y5bCLPEhdNxPESsAFDhIEYx10J0sUtzK13AUKW/rIQu9Q2mGL94yR7xnn/2vxED2iDPICahcojV
 SeqmiXsuUO2gqH5QxHTXGUTHD7nZnQwjogN4RLnz34EHxN/Sx+D7rFMuLPRcF4vyPGsIHB5qTRF
 cwNQPRrmD0Rx2l3QyW0R5efJkOgYWXauy+SsceiFg8fI/8zkec6wroDL+q7ISIevdxrmmsatYTa
 HqDXH8GixKwCAerLCcoGDHt+SABz9a1vGAjB5RuTbKlusV1PZIxNRu+/Dz01MpwDTQaUxhbCH8y
 xJoAu8htlWrgY7d0qWbt17/jr30u5nti6WS16eHyFcJMM/d/5YQCJHN+CvHR6P0ubgX5scopRCl
 zl8rEpigi60C7nKONgw==
X-Proofpoint-GUID: 4dS5BZGjw2NZXzxorUd0hLaDnUorRyLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099

On 3/17/26 11:12 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 01b570d0880d6..b928100f6464b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -39,6 +39,22 @@ aliases {
>  		serial1 = &uart6;
>  	};
>  
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer-0 {

If you don't expect more framebuffers in the future, just 'framebuffer'
for the name is OK

Konrad
