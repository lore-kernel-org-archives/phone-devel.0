Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C0B2F690F
	for <phone-devel@vger.kernel.org>; Mon,  4 May 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880433; cv=none; b=rlHbEJTvmzZn1f7sFCKnqT9VzP26fqDj4uyeKmZyuz/F5/5Wo4LpTWpzIqfvobZ70DQxjQeHESlYoWKz2gUBWKE0vJI6vIvTKNAv863raQPhkI6nrKA9W8s9fhfl6xoAfZl62e9R3Gl1WhAYTVxEmWcsK+mosegw4m03MkoBKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880433; c=relaxed/simple;
	bh=CxHY4RvIZsFVhZ+sfhFRyOxtKsGuxa202wmwVB50kfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkuS1aBcGvjQYlZdymp6bw0IDwp6CtS2ZzidKGEMM4SxB0tFVqJvBJ62yj9GRR3E8fDDPJhyLZoIyxzqfze5Nrgc4RjPqGmIGQbN7INxRw99y3kmYiTp4qxOgbU09I1p4WfK4Cd9JmLCSDfoqDRIIg/MOG96n44jh0Pkb7yplBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoaomhBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZR7a1nXl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoaomhBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZR7a1nXl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DSQh484328
	for <phone-devel@vger.kernel.org>; Mon, 4 May 2026 07:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=; b=XoaomhBii6vH9AqL
	D1IMpS8AEOAFl8pbpgOoft5D2QxekEvTVYC/iMlgyDaCZOY6153eEmRxIH5CiPwI
	WIuJ9AF1wR1KS3AiGm6XpZ5+qAtRrA4GDFnizPStVshUHVjkLEdBAI1zoNllPqQY
	i0tPlv4tOyth2RQdpbrRbPq7C94lTTMNz6vLC5JLQE/qHJZNm6Pz4G0PG0mzPA1h
	MRPrIdmRb7qkhshtoITuuQUDSGMBARjthU4BP38IOqQkGjOOKnbI2OA2VQ2hZw73
	7ylxoOGy8UHoN/eQEGpobrQIOzJicKlK7YoU7HhOVBc1QjGFa0TXZbHX4d+685Zh
	9o92Bw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87scwmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 04 May 2026 07:40:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5751831fe6dso46852e0c.1
        for <phone-devel@vger.kernel.org>; Mon, 04 May 2026 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880430; x=1778485230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=;
        b=ZR7a1nXl9i/4+jyXKzvEVd47QT5COUQXqnAMhafxBn31EbXS70Xci1npYPoHD0/l8I
         5U7ine9kSsnWqHtK5nW2k9zcafIDWVEXFirGS65pCUDZqG+CKN3T5NZOCORCSJkCU6MF
         p3oDX/2Q7WExmEIPCVqsp1k816cQW/9Ixssrf4Es4Y2A/gM6TNBOW9UvsaI2BSqc24+6
         2bxXiN0maRRIxkGol6jyfZe9N4Q2tdak6HFKmWThbXFtUIvPFUFmDJClgH+X9Sjpt3sQ
         +zUMOjePPUrZDXFLa4UYSWO8A3kkYZ7V5NUt7NkDu6BA6p9Ow4mVRc804MwV4DJ24QTf
         VLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880430; x=1778485230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwIM1jl5XWC+65YTaCeocqS1G1wiQx57VLQE5Vf3BN4=;
        b=bcwWjLnPiDeMSq/jSQaiiZEIrGEBecm8O6/148Y2m79EegYZ622jxSx0Je94wCo+Dd
         CJ238Q16tzSGiFtGRbC8Ak+9rV3czT/sBMT4BSOHOEMf5JzXIfRH6mLvT0W4QditXQ15
         jD32gVjDTEas3z+cIoal9W4EWO1UmwVkWrs1yCjwG2xrSgaOtN5hdcscASmdXbPLGXI6
         BMtJ7M6tfjlYFv2x+Hhc6YQWfVXxyyXmBnlLEIhqSf5m0zBfmGuJ/vBaeL+Na/cKUOjy
         2xJeduSy3m707pjXh5LC4XKVRur83pHJ+NrQlAlZr/xn9+O6K9NaUnuO5KE5SpeUXp0f
         MI9w==
X-Forwarded-Encrypted: i=1; AFNElJ84n/mD96cULP35hPeFtpEgbPmAbWHhpdYkx3oLFUpMpJp8e34+CTxXe3iQ5GJvFnODww4plqHkNDbepg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6JPxpD3myQqXu7oBHrPiTK9xQamdaap0WtAzEQXOgqL7ldVJ
	QB02Fty4X9HEdH/7FkGe6hFVZ+Pp2nmrOj81aBorjZT2sJccQKMS/QWBm2fV6BjY0lgsc/J9XgY
	zz3zTZ9TsVp2JmEubmYryhSOfPp4D3tMpjPCSp1D1k3+NI0xXcyHTEwYknE7znIUxaQ==
X-Gm-Gg: AeBDieveCQlXHpZwGFOqxoKxWPka36iOKCVX6YctiWb/Xh9fzXS39HSAconnlgPQLnX
	cq2SpFfLZ4r720g5sb4I1y9pSstTPcSH9nv8xv2wr8wHvgGmO+qfCO+hFTEsp793JbESRZxMeIj
	4zVmL7T5LjfqteP8/mK6rEe6nifkYtbSSogVEnin0xYnyMGsonC+PA8tLy4hNZlyjFqKARVY/n0
	AncJrWVA9PPSwJAWHGU1JFXcTzmJjEiuCWVdf04wL7NYhf+m4vckGNrki4QOwweeorqXkppIB3t
	FN6q9cqhaHbMWufTi6CaQGfdb9YdPq5fjCedNu27ihz+SB99qO58OjXhQwZGI1JEWSOO3iUY8i2
	mJW7Pr+4LwIGMbV2vfd8LdGwjWbnXlanIj+ZtO85wpTQnKtt8qY8Xd2kqkqqbL3gnO9QXtFM84Y
	+tqX7dlgRR/j57pQ==
X-Received: by 2002:a05:6122:1216:b0:575:1954:4396 with SMTP id 71dfb90a1353d-57519545c81mr773085e0c.2.1777880430003;
        Mon, 04 May 2026 00:40:30 -0700 (PDT)
X-Received: by 2002:a05:6122:1216:b0:575:1954:4396 with SMTP id 71dfb90a1353d-57519545c81mr773066e0c.2.1777880429549;
        Mon, 04 May 2026 00:40:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc20825b337sm93249866b.23.2026.05.04.00.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:40:28 -0700 (PDT)
Message-ID: <fdca4d01-eb6b-49a6-86e1-b6d582af4ba8@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:40:25 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SdOCQYLV2Fo4HD4Ka0JvCCZ7Cn_ek2pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4MiBTYWx0ZWRfX+6zRVcTUWgVT
 55jIlInPaFympkt/aAgvocGjEnGb5elc7DTNZ2FQKBbpgeUSSkLUckuokYk824JRjGph18FQ1xg
 GOI99zujGCC2rli7lor/ZBo0nMEc3uFL0AoHXeaxKZz3Epd2Tlho3QrLY64Xa3Ii3qH8bD4zsXH
 3hyyYO61BLpnN2LEwoVk7XLwc3ivqWaeeYcHm6EGl2cScYyGt0JUeBRQ2VgwDDT4Mcp1hBCD5Ef
 qBmtS5TAFvPwudAL+ydECKWQQCOaV6LpMw+WBYuUWf+pDveEmQ2+yDVP+Pg0fcziPzOvr9/3t79
 42J7PdzqQqnFLfeSPS8NpO1RAztjAW7mDWcI5UkTx5jrIUwaMvn3MqFwH0DHaAiJy8b/9NaQtBS
 YIR347/OgDFPtgZ1wKTaN5tTXh1Evw==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f84d6f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DDlRktX6VRAlMvZBBbgA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: SdOCQYLV2Fo4HD4Ka0JvCCZ7Cn_ek2pe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040082

On 5/1/26 9:41 AM, MINETTE Alexandre wrote:
> Thanks a lot for the suggestion, I checked the downstream board files
> and it does not look like these buses are wired for GSBI.
> 
> There, the MAX77693 bus is instantiated as a dedicated i2c-gpio bus on
> GPIO 22/23, and the AN30259A LED bus as a dedicated i2c-gpio bus on
> GPIO 6/7. The native APQ8064 GSBI2/GSBI3 I2C pins are different
> (GPIO 24/25 and GPIO 8/9), so these two buses do not seem to be wired
> to the GSBI controllers on jflte.

What I meant is that the pins that the i2c-gpio nodes reference
are actually wired (inside the SoC) to the GSBI I2C controllers.

You'll notice that in drivers/pinctrl/qcom/pinctrl-apq8064.c,
there are bits like:

PINGROUP(6, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),

which mean "function 0 is GPIO [implicitly in the macro], function
1 is mux to the GSBI controller"

Konrad
