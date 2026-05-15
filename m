Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846EC42EEC1
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837752; cv=none; b=hRPbb9b9cVVZvjsm6ygbOSzeEDyZSgKYKBltlDMxGTT4mmWZ0orF9VzklxUAIdWr3IfYBddGiQ0oIwKLeSh2MMwyVIc3RAsUlXKnohkKcNdy5DNUtGsFR6MdGl20fz1FMOoE8wV3zNLb5FSoICuxHRJwgXCMURvZ8KNQCAY2kMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837752; c=relaxed/simple;
	bh=lk0yUUbpT8/U39ivTcsC1egqSJRZIo+BJJ5eGnvW12g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UP7avw/MyLGOKPnt2BhZlJb7drcP8+cQxByyUzMrYdZulsKJOMidYYY1CnpkAye9U9cOCiuOT1D6QltsfUoNc5oeBdZ+zzFZm7ZjMYAzowSYPtk1JogM8hjG3oOvnS6ms/J3w7YdyX5JuoXKqBJl/SqJ2JO4LFTzShFZIJEO82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFteFIgp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Imw7X/1d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFteFIgp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Imw7X/1d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4puuq654942
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 09:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lk0yUUbpT8/U39ivTcsC1egqSJRZIo+BJJ5eGnvW12g=; b=VFteFIgpWTy97Kvi
	MNJD2q+DW11IkDrK+Fv8PrQ9HSJDkcsMwH+aKYt1WY6asyg/UqBiiHbTHjhcMifa
	xD9xbhv92Zpd35M4ZW7kjWYopS4sx8r3vBHuBLc1bblcY9RxMtii4K8dQ/KM4yxV
	XG5sPJVkQpBu8XOEL8dImJTI/xJFjcYicfGxiqljemPPHji5v4O9FwakD627F8IJ
	S7qLbubheLqJf4xid8O95o2czAoOZ/eL2Ih6wIBQZoGWjFOOiSAIUyy9Gaxa+j6o
	dP0FVXoGu2BO82hoBXJBXG2jXZGAxAjtvADCw5KCFfTZcjoZc0Q8bHUnE+u7s+P1
	LmlZdA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptq0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 09:35:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6314a8f1befso363332137.1
        for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837748; x=1779442548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lk0yUUbpT8/U39ivTcsC1egqSJRZIo+BJJ5eGnvW12g=;
        b=Imw7X/1dMYs0f2aHoq8c02ceorRdMbQMzpuJQdmUyg5J3fLjLTFoUKQjWTRP6lSqm1
         ih6NW01O9us00jth7hkzFOySqhlMZe8YAOLJc5vCGf2XXVNXVNgDWHaYDgKlh4jPNek3
         h7Np3rwWYQPElPSMfwr9yBRGugm4Sj35Rz71E8Gmp59be4dXPiEDbChaW4gQJUnobz3g
         wVzyVgNpZGo9FxH2pT5AfFo8GIFiNZvF86qwKvriw0fo+g3jdGv3943UTlZnxu6U0MnZ
         2pJtE1xATveBLsWyX2MUHnGNv4pP89/lOTUrxNX5/vpfsQLMxaBCL9Cw6w8DB5QeVxop
         sB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837748; x=1779442548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lk0yUUbpT8/U39ivTcsC1egqSJRZIo+BJJ5eGnvW12g=;
        b=IiwQfqGdh7rMsbiiBvhfmBLghzIaXOJpB/htwkig7AQynYFW31FGCHvYEsJQQYOk/R
         V2I/l75ctZpleUJu81CP0OM9PYpEbeoD8lJOj2TGhjyoJD4i+UEX5zzj/oGMU1qhFXEX
         Pu3YhaCWn9JSOFlOI72YhnE53XF6G9Y5przXEP4gmLZ1mm21Xl2/4pAYcz9A+YporR9B
         UauhlDR8sCBHkQBoAuPRhjETy4Cs2kRzY24iUL4waA2EdjcX4OCgeOTxeuZlQMnQFQu/
         f2N4QkdTPPU/vx8DUIwXVkszThSRtk5lqahEPOfKlll6Ni+VesV3fK7vDNp4HM/e+kV7
         j3Mg==
X-Forwarded-Encrypted: i=1; AFNElJ9gk99Nc/eYGlRlWXANJ8xNhCAr+19GjgkuE9bVKs1QeoNkzA7vbJ1V2wA4H4i+KfMiWlAFTTrpP9mXXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/vPLwPOQpGegtLBQDQ3NMz97BhDbQaW56NxeA+AeQ5TW5lU4
	qBwlsKzcZcZM7mYH/mHB7QJT7uzD7pteBldxQ8TLFOhygaiz/cXXCHfml5dEXcXPFvF1a+9Ziev
	587qdvZIDGjQeF76t4cXtDkVpG1n6yygw5AEHJisjxXRr76Z7a+4lHVEbAEKHWaT3NA==
X-Gm-Gg: Acq92OEK0BvpxYqwXP9HXZUQweBxT80IFCX6wBXk8jdiqHvYhVZT4sW3Rbcm8RMf1pN
	yhH0fzYI9iX6mQBmhIubWEp7DuZb4jAgCKgoe5+cBjHM5DYFF0BSkix88DaRLsi8/nMV8qDYrGP
	nXxTNsu2tTertGC1Zxh2LlKszF/PacRqIIVosQ3R1MOcSZRbB9+bAlALZw1F8F3Sj94mRQAdfzf
	R9ZowNvTsK16ovHMN0DnlnraInf5zvMz0VF8LtHGtzP6AKp3cy+c6oD+r9CADq2th2/qH3G6HvD
	SwvgdgyVqzivY/KGANPCe4lqTp1aUzmISX6MyT/+6j9QfFvafPXZPKydfoQZ81Gxmj4u1M9q8Qm
	N96FLbE4YbAAQLKb1fA75CDxofo0x2Xr8G9TLTVCMtvLIwuTGi31NZlig9JZJfDqR5j2q4UoSht
	0Qu/E=
X-Received: by 2002:a05:6102:21d6:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-63a3cc0c981mr429424137.1.1778837748261;
        Fri, 15 May 2026 02:35:48 -0700 (PDT)
X-Received: by 2002:a05:6102:21d6:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-63a3cc0c981mr429413137.1.1778837747869;
        Fri, 15 May 2026 02:35:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e5eef9sm195347866b.51.2026.05.15.02.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:35:46 -0700 (PDT)
Message-ID: <af2a9994-44b1-4945-9c04-4f31c1ff60f9@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:35:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: MINETTE Alexandre <contact@alex-min.fr>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
 <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
 <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
 <fdca4d01-eb6b-49a6-86e1-b6d582af4ba8@oss.qualcomm.com>
 <bb8353fe-29f6-4902-9c7f-67ef61676f2b@oss.qualcomm.com>
 <1eb77056-0716-49d3-b45f-d51ee5b70618@app.fastmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1eb77056-0716-49d3-b45f-d51ee5b70618@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VQ4X9DU0j7CB9suGPFEzXYVensEcsyx2
X-Proofpoint-ORIG-GUID: VQ4X9DU0j7CB9suGPFEzXYVensEcsyx2
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06e8f5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NJkuH3xNc77H-X9ZbZMA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NiBTYWx0ZWRfX049dReXY6Vo9
 kR2LtMlSKtXQOrt49x4W9pI/l6HdQKY1uFZT1V77rWS/DrfnPUCmJES/0vs3qvenGf5rOyX2zop
 5rzXpnD+RpOd07Q3vEQ+BhGsCz5MOevVNAoc6n5dO4DFOMtUeTXP/blQ+HGR4W2dON8QLu93iTa
 29fUbybxfR+rfYmS3Cis4GfamXH42FIksuJIZ0wYoRa6p9C7/vzoN2fX8dYqJsy3s99X7o9oyeG
 7BXuezPlamGQ3t9pJY6saKSSddKwstKJRbcdGza7L5/Wa0wFf9oJmjh7jP2JeZL9wl98O3knNad
 /BxqSINIVAo7B8ynq2//ZY7KQNlhKHjOK1TJ/s0yRt2vGgwlOHRR6QY6gWupEGyNLzKV59klPFd
 +ufVqN8v7Tq1hSyR78LrGwQusIaOXqXFNiDrv+zcqEcACRDyNyq0RIhx5+4g4pHX9C7Mag4hj0q
 4rcyv0K8v4Eo9QjOp7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150096

On 5/14/26 10:23 PM, MINETTE Alexandre wrote:
> Ah yes, I see. I tried GSBI for both the MUIC/extcon bus and the LED bus,
> but it does not work on my GT-I9505: USB does not enumerate with the MUIC
> on GSBI2, and the LED on GSBI3 times out when setting brightness (-110, with no visble changes).
> So I think these should stay as i2c-gpio like downstream.

Alright, thanks for confirming

Konrad
