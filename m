Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656504;
	b=eZI6JXJirJlb3JuXjvC0SK9FKSgwyfWPB0ZpbxAS/YVmXZAKSLRBxZ5t+emONPPndqhy
	 kZbxnOWim82NcfcS4eY1uN8tXCPkmN1KnBpFGVVJ6zw49kJm+Qmk4aV3nppPehyCTdK37
	 UUrr8SDUILv3bDl75H//9QU/obsm71l+og2+/dN8MxKy2xJue4Kd/2GpMcmnT+Ctt6wAZ
	 H/i37f/Ee2V1v8oXDO9GqEvIpiJ/8JtIHzMoghSdiu3WgkwoOEyTRz+gaa9l+J4hqZw6o
	 SGI66VkYaSVaNO++YxHh+jc67MLBnNE46JGqdmx1TW0UIvhvGVDec1TuSgYml1wSrAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
	b=mLEtrniQqVMXwONJLcqBSssSJOIDm75L+n9J4JUlulaDWbTym5R3PfKhJKwz5UvTpjuA
	 yEZSP22uMNfCJica8bttgoHFKkpn8fm6/GAG2uJGxLxvfOj45JT8u/jj5VKj5OW9rpvaF
	 Jk0qTdGfKIO5BkPOCaGtRjhp0v9lRBLWiHGJl3I7c1uF+3jUSlN3UNNyzen3YKOv2OFxR
	 8USCGWk0jFMNzGlYwDXnT2P1aPFUvj8jqrx1i3BaJ1MUqt/4wQaGiPm1frDiXgVTF+N+B
	 P9B4FrOxz8WNez2xIykaowgFiMdhLUruahp3OS4nbNRbZda+AxNVGK7HUv0yZNAeS4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwBZnlj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kj0xNvvq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDF8606A31D
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDF8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwBZnlj5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kj0xNvvq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xr882171938
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=; b=cwBZnlj5GU+HwE9E
	4jLJAB5g69Kn9u+bz8XrvLss4OfO1m3giEycZoDqEeGvr7ZUf2oo6cWXpSPvaC1H
	vygNgPXU3Twxo1W3u8AWZiyHiUpCZwlOmeenufKnbEfJjxwdUlwrShwVbD5QY+GJ
	hakWlGZ/+VUIlMoLFkP5lo/J7oXBbqVbNbOdNqt5DQz8q2c3sxjuslwNXLKPa/2o
	pfefa9Xau+Cxx25EgoGnbAvcAy1mV7AqbsbXO1KEI41b4Qr63tw/2Fc9FF3kDO4b
	RCAB84UkGeOZxPFVEY+ncfX+g4wp5zjh83i+y8erI5njadqq68h6wlY0N3+ID1bZ
	eP2Ddw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahbv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so3271836d6.3
        for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656502; x=1793261302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
        b=kj0xNvvqwzksAwfwVxssk9dxUkm2FIKO3BRGKGmmSf5zofslZFI7ElNXsNHcR/c+dp
         xNs+yMTTJFD8oa9AJh+5Bgwq9omuRWeaZTiC4SDgG4NLYW0//FzqIDC5sfHNKGkeir5F
         uOfmJ/JgJUi3wXHuKKjpiOMeIh6/m8KPafXAoKX+aZ7+qslf7mFu9sUkVHyw+mgzx1bv
         XtWudRRTqhDXUniEkpCoC2Lcq4AslJxG5TRuBrr4CoSnpRtITR535uIO52379qolFN/h
         2JyI35n6KSzTWtB3ut9/SVAE8ahKthbxci1+jLxbBFQrWrYYYMOiNybUAgcvp418bgHR
         vGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656502; x=1793261302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
        b=0jUUqilxku92E+DznHAOIhMUZ7nEsU06Ve4DC2oKmAwKdkqsyf2nNK52WH4p/T6cvC
         uXiruLetRkJJMllqIDUxkfYcF3W22vfHWDjiGgBABveUQygkTDVVTbBQ7PdZyDvJmb1p
         jL9IKd6RBHaaMQH7Bib7H8jrfCuL4I1BEKNV3LGiKFAEcTbNClvgFpfc1i8Y91/sArjG
         yt/HrCNYnSDngd2RdIufTWn9qxP7c55eXl+fhy1pftzqyF1fjTy/hVYjSv392huFPDNi
         okzSbTgpEEHGImKvy/0cOu3qpOMn8axPUlJJkXgixjcqU6yc9AEDiG6QNyE8Ccoqetdf
         Jd5A==
X-Forwarded-Encrypted: i=1; AKwUvBxTbnOTRX0d3ztv2YwDo90PlR+Q9MLLTqb8F2w+3C6+dC4OJShdyaUXWMEhqAZnpGqJ074GEqK4IF8Alw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLrFzG5h+aQlaPgl8AMzhtOea73Lm2QxMwXyQSutmZzvTzoGBIF
	eUCLNbuc91ws3DLy1rIif3efkR84XC5v6NLsLocy8nZYLLIayFwEwJIILk/6Jp5NKUWpSrzpIUP
	shs1co3sokcwSAvvKaGKF05+KpNAZHdwU8hH3/IINc6iw1ADzO64MhHBQrZ04mQpqqg==
X-Gm-Gg: AYBFou0XhKN4hfri+QNlajhziRqS7IAUyGyQNAqACXKdqqr6Kdw8TCTQAJP8ykUxZXA
	d9Z3OR0QS2L8nTmcUO8L9LhUworYsnmHQ7HcFYfHR1QoKO1+4mnoQqAe1+cfhMqr16MpCT4q5Zi
	uJNfNP+vXPXOz+N39Q6k3tWm3Abf7eitYIfN6NQOG5uVSTF4CzRb8TSBrmVEBNj+AMiNmX3Llam
	Or+t5UiJOxVkRNBvcGPN7SyVXIdFjCwIMhxDyNaXvwvK4IKm3t874WIw+SpDWGP582A+vUJyJ19
	ALMgDfWcbaWVNwkKSCqV9xCEMAvXoA/b22S13PXN6G9gyLJf+FL1tJmqPNla8CR+EL2ZjxwIHLR
	O4T1LqBgK334P44X2Uy4ztw==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1009350285a.1.1792656502102;
        Thu, 22 Oct 2026 01:08:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1009346585a.1.1792656501661;
        Thu, 22 Oct 2026 01:08:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f0b46sm79569966b.8.2026.10.22.01.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:08:20 -0700 (PDT)
Message-ID: <29d55c6c-5565-417b-8252-7f346f07a035@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:08:17 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
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
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
 <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
 <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hkGbpSyzl-5-y7yJ0Ktna_984sHdevZL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX/nSb+EW5+co1
 zgrd2WZZfcEkz1T/yLkpyIFX4H0trfbfkbKZ1XSQbYi1r15wqCMZSL/qDefLDK1mJMBjOeVq/eR
 kOeJZzu1na0x9NVR0UsaevOuHJcZeTo=
X-Proofpoint-ORIG-GUID: hkGbpSyzl-5-y7yJ0Ktna_984sHdevZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXyUitffBM12Kv
 JJl6/HRojTKIbVxy4rihJVwpVV2dAwGpk2H2uYnzhlMmwNwrl9DPxByHEK/IepnyChJr/137Nqr
 C9lyT2lntTKjigp7p1FQJBeAu9Is7LOp8u+TMRQ8BWM9lr31Jdr5XNBBZYFxubrjjlrbk8nseQQ
 ZVXALAAkd5EJdS84RI78UFgHQo/1m0NWYviix3htEs+AJ8iV9I4pnBg+B0+/L8MGsU80cWY6M4I
 ZvUVwRpO7jXp20pyy5IC7aXZSr/yOiC/xT3Qdo4KtZ8RjoTzVX5yG21KKgWegSwxxNEG+Dh/Nyo
 jPkXjgLcTjsHGCWdE28hUOeBN97mpM9+aaOPFbqTVwdZ/CXWyxVWa4M5bnV6O/T5K6QjvpOPFSJ
 2uY6gkbEIfy3D1qMuc8qX1NRsEsVeH5AWrut/A6j4ecRETZ9QUlkXX36VYuoWmETJa0c8xWsTgq
 icsf5bFCc79aNWm3TFA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9c477 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=C8oghTkgAAAA:8 a=aE2qjto-PEiQifxUPIUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=BFEk1I1Cc5IuqT1TcHpZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032

On 10/21/26 5:00 PM, Erikas Bitovtas wrote:
>>>> Have you tried using the bus through the normal QUP driver path?
>>>>
>>> No, I haven't. GPI DMA support for this platform is not yet upstream.
>>
>> It's a copy-paste job, try it out please.
>>
> 
> The pinctrl driver for SC7180 has no QUPv3 mux for 51 and 52 GPIOs. I
> also tried checking devcfg.mbn of my device using qc-devcfg-parser, but
> it printed limited information:
> https://bpa.st/PEZED3BN3JGND6HS6BOGNHQG7I>>>> +&usb_1 {

I checked the hw spec and indeed there's no QUP routed there.

Konrad
