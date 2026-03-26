Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101563F1649
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526887; cv=none; b=ugOtyUhAptHSJws+hoNJFjdgfxAEpO2VVRHnNNckBceagZ3at87fBT0IXXl28ZUPiWde+pjwOP9o+FOW52Ej5WFNvsU2JlYgXkFdZ2kwenyrO7y/CgeZzGXvswuEdK3m7eqo2PHWbrRsPTzSiyFUIqvpz1LGIbmIkt6Ph9guHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526887; c=relaxed/simple;
	bh=i2zi6xbw1pTNY5Ec0sGiL5Nc1FhJJCGnnb4LozNE8vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbtwuVA/4BuGZgeVtjaXDgnRzN1CiLb+uS+0n5dcjqXIz0272bj8f/8LnpuOaXrED57FupbBMhMTXXetW2JowHsDcuVUgMjx49B5x/XbQBdbnC1PxBZ6Mx8CtDVgKOhAjNKpJjZM1XJi2NH6Cq/eZ/TYhtjOPyGc3Ax6rR6x2qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bv7GV5Po; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8zJ+C0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bv7GV5Po";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8zJ+C0H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QArONv220315
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 12:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3uXmHavq943V2Js6d0I1kkJb88a2umuDyIJzCSdvhE=; b=bv7GV5PoYzpk5G4S
	r0TTc4P4eahiRFwNYoQy+tt5/i21VruN+rw6OCgO8MW50pC20QYxZnAY4yKClXAn
	Lml7IIWGBeqiNrSZ+35nf6RgW5Wrg5Bs01yg1ErilqDksTR76792C2Nh80sf2Zpl
	FaZcTOLUvz6fsAuf2lFFyAuK6hpYdt2i/Od3jmaBPrNXdYva0TlkZhBRIvSnKVLb
	yeY3WV8g6Er987McRDhNvnsElc+EHUd4eNH6n1ejGOwBCuB1Mrh8ekXNaVawO3ic
	91TrASsyCr94DEmyZeMs1ma7NL3KlggF1XJLGxwixgnjPs1UPvl6tB4yv3U8jAK+
	TuIFJw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqg76h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 12:08:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so3868831cf.3
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774526883; x=1775131683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3uXmHavq943V2Js6d0I1kkJb88a2umuDyIJzCSdvhE=;
        b=W8zJ+C0H7JGQRmQDmLlYgxYPldtLOFy1zNWDS6m7OBtFuv9Bw+8TIXellTBxHtudM+
         J/JGBxxzz1jZ5Rc+5LGhHRsKq2AeXsjmRmvQikqtMQyRGJlCuVoSocATj3o7Ec8459FB
         0JtRH4HEG0K9TO0XWqnl9+2m5+cJoPxMg1nsxtAzZDE1TWhI5p1qs1Sejzx1Md0bT5e5
         IprLk8XXn+PApS6YVBefg8i+RvbTFb4T1QUeklol3dodEa4Vn+YuPfzr+8+BM8u1nMsS
         VutMtwWJP/fa2a3laJMPiCvrBCRlG+WYBQPD+N5lV3cmIhkCXh8hwQU3Fh5JBK9M3HgZ
         7/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526883; x=1775131683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3uXmHavq943V2Js6d0I1kkJb88a2umuDyIJzCSdvhE=;
        b=ZopKRnsWxgYI08Ge7JTSrfm0O+Qffs9zKpNdLTLQekzQqrZbqRb6HP81FF2XncqtKA
         4ffmBVqMcD2Sok5aoT1qyYPTKhEJrJngnthkOuLlzxJqu/UEACksftW0+c39+KybZFJp
         AVQsUQ++5gSlOKUXmZ5v+kUCStE967WLDsj65e9wGw+2KbZ+7NfS8uBu33ACJVLNxA2A
         wnKERCrazHhGDkbNkvY82aMRcnM9V3nPuMvHp+Xi47Pc7a1ZusVPcum/91a6EbepGPI0
         QtoqZaOQVHD0NfgRs7Lk3uSswHYxly2I9pE52PWOdqWrwmg3d58sWVXJjKCMv/FIoYUK
         Qj4w==
X-Forwarded-Encrypted: i=1; AJvYcCVl2A+k4gsj6LU+dkf4zkEfMMsACZgZRVbpL47Q6jCUQoHwYJITujW/1f6wv7krKzjOwgGSof7UvYkoMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdaslvI0ikGkRoXkRg1G9p2Rtv4bB8lxW6OYT4cSjazKSP/Mgx
	NFmBmhe2XMkVMsg0GLa2+xNWpHHDR/X+QjFc8deD23ZmCcSa92LVB/QUPd1H4gDKZ99keTR2I2I
	MT4NHMWoouffOIwbpoKdZlSWw+nkhDrDIkmaASWAJSfaX/fl9zmquxFvWpqppi4bgIA==
X-Gm-Gg: ATEYQzxsLmeBMf8v2QBHXr51XpQLkuwsxUJC78Hm/TlrwV2UbCbOXu7xHFWw3+HOI9o
	pAXQ5N+/+mM2rHf3NOsSwWs1vpo8eU5wxjC46yhwJWi7xBUwcPIJ6fq9axCbk0PS6cwFRDXXfqK
	MkrCUsD8X59a8CogCjQA/ANyrPV+0WgucDjDvTRacpHwgRt3wOiZQAa7lOEk/8xHn4dVZTB5Vk7
	7p92gv5AJ1CB3imJCgl+c0ESEguZ+FqqiiaC5ywPAPRdgOW0RxF0VDPjjimGPVS8Z0drLO41Gvv
	3N0f08TPvikDZRY+xfuoB+NZisMI03eWCAlbPYi3JQFWLBFWTC0Tb05xVEJqGPnoNk4SCBtp3+f
	msLFsGIKrEp0qNboyqrUtsFp7xzKq/6iUwJrhSRz20itzGBo+A8Q9uqbL5NlM1heVUsBlG8iokN
	BDT8E=
X-Received: by 2002:ac8:5a04:0:b0:509:2239:8b46 with SMTP id d75a77b69052e-50b80af3a6emr75124441cf.0.1774526883222;
        Thu, 26 Mar 2026 05:08:03 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:509:2239:8b46 with SMTP id d75a77b69052e-50b80af3a6emr75123861cf.0.1774526882726;
        Thu, 26 Mar 2026 05:08:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20218682sm114362166b.6.2026.03.26.05.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:08:01 -0700 (PDT)
Message-ID: <87943afd-2601-423e-878d-36b69ac3d6c3@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 13:07:59 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com>
 <109d21b4-5d16-4689-8383-ecd29bbbf8a6@oss.qualcomm.com>
 <7wYxWlqdcbL3ANB9n0g4t74x-dwE2yG4CmVw9TwGNmwARxbT5WsdG1fpuIDSA5ab750Gs8OUBwmVa_nZd065guKDJueytb1AmlQ05__IzmU=@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7wYxWlqdcbL3ANB9n0g4t74x-dwE2yG4CmVw9TwGNmwARxbT5WsdG1fpuIDSA5ab750Gs8OUBwmVa_nZd065guKDJueytb1AmlQ05__IzmU=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4NCBTYWx0ZWRfX5CY8tvLjtzKv
 aORhTgM0PnjdZiyRJXf0U1/krqFKIsyfQEc2hmxJ8EXOddty33FW1KLdl5HeR8JmVzDo0M4+9BZ
 y24Rea1rYnsMn5Oc/7QwwoMB+oJWSPqqO2cM+kVirwUz1iaxYFtssczM2PfXApWyVa4JepoQ+bM
 Eu5i9xBX94YF4YeHGgLTWihalC0O4x48FG0clnFeZfs4IYTsgIW5gM+GdAyESFtoVSwCIssCLEM
 DmQ3hV/9gSfrI2Q5xr4639Ols+k9rJSFsWSAiefNNyJldfx6SXJEp04lfl5QsaoE/rFWvtwOZSC
 jxMuh1HFn1Kd9jir59RwgMxd0ea1UfE2mtYamOxVpRrrHmU9ZxJwpwmxOu90UszV9azE+yrzfzF
 o5BAduRouJWyDEa0eKMo1hQ524sZ/BFdIIjtZesO+IcTgY/QEAw2B4t2Iz6/SkqBZmxmIt02ne9
 gRPSsKV60CnNOHaVDAg==
X-Proofpoint-GUID: _5N1hmiRRjeFKmG7zR1LpCPtx1i7Asft
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c521a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=XqikXB0HrO5LkgwUDCoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: _5N1hmiRRjeFKmG7zR1LpCPtx1i7Asft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260084

On 3/24/26 12:18 PM, cristian_ci wrote:
> On Monday, March 23rd, 2026 at 11:52, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/21/26 5:23 PM, Cristian Cozzolino via B4 Relay wrote:
>>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
>>>
>>> Add the description for the display panel found on this phone.
>>> And with this done we can also enable the GPU and set the zap shader
>>> firmware path.
>>>
>>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
>>> ---
>>
>> [...]
>>
>>> +	panel_default: panel-default-state {
>>> +		pins = "gpio61";
>>> +		function = "gpio";
>>> +		drive-strength = <8>;
>>> +		bias-disable;
>>> +		output-high;
>>
>> This says "by default, actively drive the pin not to reset the display
>> panel". Is this actually necessary?
> 
> I've tried to remove panel pinctrl stuff from the panel and the device still boots/works exactly like before. So, have I to submit v4 without pinctrl at all for the panel?

No, the pin config is useful, I'm specifically referencing the output-high
property

Konrad
