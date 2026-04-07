Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF7339B96B
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557825; cv=none; b=UNcE6tbJ8UkXZnT3FctR+0ErgExbMi2fvWAQHRUO83FFuQ4BtMTLd4lY7e6QI5Yud21oyK1Rg9R/wKTD9Q70Ca48BbhiJGwecjxliAI5JMcvSuvNJ12zUFqEJZ5s5O+HAIAlZp8i1jX9zvFqxJK7gCaAo998ydWlHeJDrpvY+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557825; c=relaxed/simple;
	bh=kfFx7m0Kla4Oibk5jdaHYReFM8hCk3zhSmSJxrtCcHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Orn0vu7BZ0BUVoCl3irMUWedcsSs42l6i/bSLRlR2nNvyxjmP1nsH9vk7l4aiBP15Ls1TXQqjwu87wWsM8nv12XGqNqTLz8o42pEfKXt0ciFiEulveqTz2xVlekctyfZkjHK6gBRRan/OgUopXu0ZRWE3SNd6G1XVOkTrT6qy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXS8Wm+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTVYR1O7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXS8Wm+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTVYR1O7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Bn4Q2550794
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=; b=lXS8Wm+/sHuYTbr2
	fUqPTFB7C3j4FBWch5Llgs8xNJuJJYrCNg7YOtmT7ptcFOkjJw+ccSw6GGEetUWA
	NmcvLOBQfrclKzZvB2yeVhaejt5P/duE2mCawpkgXS/N9f6OVu7xO5nIOG2xHma4
	yyaIgtpQ9AnrtBvp2kIUYJvkuseEJ6Bg8KiHinvJx2sg/AMvuKDmFkLT1RIUGD+n
	OlBk0cJNWTywB/6VWkVSPSM7wE6wGs34z7698N7ViBWr6pw2krIlr94Bb1NGt/NY
	RBfCTeYjtEuN3DT5e9hh7PEJkC90tISQVUVaJtLgjorh3WGre0/iPbCqyhQO6ET2
	EL041g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea9yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:30:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfd003bfe2so131127685a.0
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557822; x=1776162622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=;
        b=CTVYR1O73IVZAI8xtynf6UaLBP6t867+i1O9xoL2JqN3/TE5kdo/u9+V/M5hW1g03S
         K34UfxF7P+Whayh1rZrzBl0nCD2pxdYghlXxH7FR3GT964ca0blhC8VoWlobfMDTMax0
         7mMvWW9QTY/2xMQpYg2PVl2mTWT30jYIVXVCfVGlgMoNnpz1cGh4MwWF/TsiZf71yaCX
         rRIxyxmhn1EhbWHvnkHyONSlBasBP/xWofVWpWJbebiTUTh1EpC1gcZUupnMQ/zxZlQj
         fgznqRyaYp89QVWQuh9BMIRjf8pupdLjp9CzpYR+Z+X3FdiGn97jmFc1vrLpWFOFCrRU
         gxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557822; x=1776162622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=;
        b=qW9UIabvVPN+aQjIvBMlvvWW4OUJzYV3reGJ4I3V2iwJKuIbT9HB7OQoxcsqXX/N7z
         xxwkqU0+eRuiqogF+UZM/aktRnT7Z+alqoAZ2DENQLKWgXG6qRbKO2uK2Vf1qYidAoen
         GGbZ5cvPnlwSvYqkAwf6WG3Yy1dh0xbnZOypy5Hn1Ajlx6ApRHz9Dq8FoEePyaRUHvIl
         vFMMoTC9qf1tbZKYcVrLnYFE3LerFhRKjWOMgkqAc4NJr+I8BLfNtOCYZE6iWW/A5kMF
         p37QBLs5pEDTAyaYK1S7hTGbuL7F6qRUG/lSGi4+u3rsHCBtL3OI9EseRg/tQ5onRnkX
         ghcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBdzlMcwosGixVzh5MQnERGlTVapLSAc6qvQd0wnKW29ggxQYjtLjiIG9J5GTEIm2SN2+9cmyVTOuxvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJF+OMdHb/pL1Q6dKwvqeIMQpVgOq5PhiqvskFx/D9btDraqvV
	k+ybZAEjq2aNRMFcLb7tNwx9rI7o6+N0C1MUE6Ng/SfbjpbgUWBXzVdmu5uxrAEEY7o5VnAIj0t
	xqfYz1r/mAb+odYGB68RahEJl06scqkDap6MoxnZcPFwqz1scgKS5qJFV0z6S+P2FtQ==
X-Gm-Gg: AeBDieuAGdXTMBpVqSBBwsjpKYWQqarg1/LBJUJb12eIN92xWBcbBpMDLw6JqC4fpJn
	tat1lulUYXK+mepakduBoGfrNJXOFD3EH52FHYKe9GTvrqflu74JXmZOl0bW0p6cBJNxcXcq76x
	KB4ynKZoEjco3YcfEPYYLuHv7G/lem9f/oOz8gj64rs4tHQ2tm2tPY4yy4Wh7WvWCkcP9oMHoRq
	QNVYclf7Dv1Fi91VOusDa8hKb3xSPmSV+7pgHXYH86h3dZZmal2h1UXqAbwoJr6hVTp8rXXu16B
	h8vJJarMu1U+4hSZrlSf3hkgnYFWcG1gYYCaGw5UJwlVR/93qHccZOGyuQGpi3hXtWmcH+CKHa4
	runXIeuu+UaEb8RxxIX67eKcJwri4xBW8iZfdo7tTWC/YZ/lfHQ0mK8vHWoElkOSL0iGm2QPFRa
	roF2A=
X-Received: by 2002:a05:620a:199d:b0:8cf:c757:f1e8 with SMTP id af79cd13be357-8d41e81fe78mr1565718985a.7.1775557821879;
        Tue, 07 Apr 2026 03:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:8cf:c757:f1e8 with SMTP id af79cd13be357-8d41e81fe78mr1565714485a.7.1775557821327;
        Tue, 07 Apr 2026 03:30:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4185135a12.16.2026.04.07.03.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:30:20 -0700 (PDT)
Message-ID: <9788748f-fd4b-474e-9378-8ffdb9b18527@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:30:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add IPA node
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4dcbf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=apJo_pz1HnjGAtgFfvkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ycbSlZGHwSZSLi5ZrmrhZCeBA8BvaSJ0
X-Proofpoint-ORIG-GUID: ycbSlZGHwSZSLi5ZrmrhZCeBA8BvaSJ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX5wW/zW6y5X4h
 oPSt2qGVOLgcz2UAuiXfdZHx0rglujR9pskOzUsKjsEnSBowZdgpyh55tookbo4sCVmlpi5icPH
 nrGgHxgJamKyk1fT3QBbd9NWItL4mbTAMfVMZiChzpHg73wfP6ttqyXRmFiCx201veZ++fe2hUR
 ugy99GmX0IAdQ93oz9HtwovyPoU+sYpB+1N66AOdPP0b/iMaddVDOvCH4JpspQCoEPtGyK0NdEa
 piOpdKrU4fvWX/MgEPP7QEiR54COXJLiOi/zJ4Pjw//FGjJYSJhciKVb62Glihi0oy9DmSbRuoi
 a6qYsqCu4Ggi9m3SuIM4uesxuMUuXXNGubrm9GOFmbDYmuf1LFWOwZligLhLevDYyBIOfZjXDkw
 6dQBpQvhqrZbu6/yjJBEa/X35SjPntGoMfO9IobNpwrRv4ITEA0TPlZJJISekmXFePHh7zHKmib
 qaS7/cLDgs2Eb5LatBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097

On 4/3/26 6:43 PM, Luca Weiss wrote:
> Add the description of the IPA block in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


> +			iommus = <&apps_smmu 0x4a0 0x0>,
> +				 <&apps_smmu 0x4a2 0x0>;

P.S.

I don't know what's the scope of upstream IPA today, but it seems like
there's two additional SIDs: 0x4a1 attached to an "ipa_smmu_wlan"
subnode and another one (0x4a4) called ipa_smmu_11ad, perhaps for
some tighter integration with ath1xk_ahb?

But again, I don't know much.

Konrad
