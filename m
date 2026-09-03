Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3B3E3158
	for <phone-devel@vger.kernel.org>; Thu,  3 Sep 2026 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417473; cv=none; b=m9vmvQRRVNb9xc0bKC8S2DemCwF6qqlhl/QgXgvvKkZLqgU5YsDPSgM+QU1BCvvHvF8QSUtjzwCt/nNz96vjY1Wu3SjJ8+S/Ky8mOAdVcik9fxv9tiqtr2Y0s1GdR3+CjfibUh9r7TAfIvlVRHe6KsxuMackCBh2Eq8a4J2CfUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417473; c=relaxed/simple;
	bh=nZHYuewFovLeJ+5naPia4RsxMaLt2TuGBHxq3tZ9DZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWT+kKMjMC2IXH2Cbu1Oy2UrUf87JvdgpNsH6ZqtQBi4hjCPnCl+2V0J+lnC+PTYMAh4tFv2ZcsuR2r4otgSDFo743+iYIfq5LK+zy+6Q+JQgtGTciPN2/whMQzE1X8X8lyBmDqMcZ/4QuUVJqtHJhm7tMVfVnk48ROU3lF9SiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQ29/Lxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8uscEv0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQ29/Lxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8uscEv0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lT4S3114002
	for <phone-devel@vger.kernel.org>; Thu, 3 Sep 2026 06:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=; b=gQ29/Lxvw3aaA9aF
	S6HVwiejxuZ6+3MXShztUOQM2QUgqxM4vEJXq5P3lSGhLrulD6bAjDFbykrDusgW
	2oLk6AMkIGNF8Rsd54hC6AA9bZ+Y/5ttGUSjvNWnvItf+/FbnIhNtMUdaGvYzTrb
	Q6MPHSKGEIEtP/EzoTt8zQto36q3QMjPnRZNZgaMEIBHhSTWIDZn5tfZsDEvkJje
	8ReyRX2Brcy0C+Gz3Fs8Q1tc04rylv/ggJB+myQp18wVhDQ2KA2W04OZs/V2KDH7
	pgN6NQaBGbyX1JXdL2gjqVmj69nPLTQDgwknjw889DeuOg5CYbF0zq1b4cl9jRp4
	jvilFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjrq18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 03 Sep 2026 06:37:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53002215979so3646671cf.0
        for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 23:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417463; x=1789022263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=;
        b=G8uscEv0reXko9JGWWV0Pbr305oo0+T5a9p6ZvaeYBWOaOchhtJRl76mfSX8Ghk2Dy
         RPNfn9+QIP8tDhEp1EwNk0BsceDMULjg+PNhTlRHavMfbUMxmFmyZfOCmrmwDhtrumQF
         xcGa6qz+UR7gLWZzCS1QFp9ZrIFEEVpH+SZ4D15jQy9gL9QTHP+bIQiWf5BdY7CRLV7f
         hPwovIkc6BrYcnZTl6I4BBwzhIPjZYu5DvJqlXZr+zkpzriaPc90ifhvhkIi3GIdbTCv
         34jxKWJrY6SsMUOIuwnPlEymPgRryQBBaUMJgR4MfrB+F2kMb10yl4QOn328UoSAZsNC
         +WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417463; x=1789022263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=;
        b=aSv5V3SrRg9bCCTmMeIaSS/O6vHt2kb1n+Tr2V4iHSnIztasxj8cZ07B6RIOw/z7Ts
         GvkUC6gFvlhEBmj8JYGq3Zc3fxsNjQbaaqm8LtjnvZc2PPkJHhFmz5VOV1hmHuCLS9e8
         +QKuntZhVbREA1IUVzbr3cWWBz/1iRnHZhcFn2fivHif3pjK/C6eiu3SlI5hVJ7wvHl6
         9YA2es3VkgoaZLzGrzdGhcVQREIKvn1huokQ10j/ecf8fxdTb7mKSUTE+GdHu4j7eE8K
         itKHhOeGg+OIPZXoI3ZpEhCCn2ctwhcfuWYdbnzYhjnJv2yBx0wvIr+Rvev6PTTI5MRF
         OyGg==
X-Forwarded-Encrypted: i=1; AKwUvBylWP/s1uVswzvhuLEiQPKgPyCuUX1pgmaB7TwNhK96sbUHwLqUJ5kAMn6NzFszHkcS+h+Z/OxfOcg7zQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mwX7nJL5nZ5l9jruAsDuBLkr7qzlKjrPKMFYlGaQz6EFmkG2C1
	+dKUi8bYm9sME2hKBa2e1zQLQ/ecOnvYZ7ffs+r+Ef0Ot0o+uM14htDgxtrK+90rbLW0gnG3wt/
	e3kwASDWOlpIahymanSoTZ9z8Z4/9+A0ZTZdwYdqYIZsQNM0xXYmzLP4RfxjFDtwcPQ==
X-Gm-Gg: AYBFou1/Vmsj7g1McHQVRE5ccJhO917xw6sp0lSZBUtRssVDhKBLAp5GXiara5J83aW
	s0YvqGTLigWv63qHoziIozdYcykvhw+UJIhuGDiPGybI6kx/lMTGtZmuS19TKpjCOU4EpXtUYml
	gxKZUBaF75FLloa8AUZW3hKK7ejQTodVzkg81Pzz88moVLUlXkiBicEhNowNpZNO2No17rs7d+u
	ueAYy7XflmymMuKjbBq4d3iaYhj6iuDa61LiMEfnVwiCMs9FUQ7GKXi8oIuEjwn0j1omhKeQ2Jf
	L7dQW0Q04cBCwLRKUFOTGOCdI28vZsMYMfM21tMtQ3X4rty0lS2vG00pV0vUle04lrzeb5HS8W7
	k2t0CWmQZmaUMzxG0x9g/zQ==
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr73180871cf.2.1788417463511;
        Wed, 02 Sep 2026 23:37:43 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr73180561cf.2.1788417462938;
        Wed, 02 Sep 2026 23:37:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f953223sm1781245a12.28.2026.09.02.23.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:37:41 -0700 (PDT)
Message-ID: <c4af75e8-5049-4cfe-a333-5c2b58e1da2e@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:37:38 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-google: Set i2c3 frequency
 to 400 kHz
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-1-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-1-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX1ItJIHI3ABYZ
 i3hLBWf1si8VX7RmsES6WPrU2dJ3qWrdMp2oSLu7iL1sMCi36nbUSm8mub+wgpk77dX/LBxcTTd
 TwZbkkFI6/WaN4xW2UJPlIL3SPpcM/NxLXJkmky5Rq2FP9qMz+ZHMep82WmkRiGSUdDx8UdywDN
 VzqXqgxuqizkaZG18ALwMAlqEHHw5o52Wzgcj8idWIPHO3WX9QrPCzyDhgpT198jEqh4feF4t0i
 YcTcmqL09ZY+kX1yN+vdja8d65m3GckpLF1zBjk9e/Jfw3YtdXHNcE6QOJy/Vu1vtF8VuSLjUg/
 VZgLdlz6OqXxDK2lnkSpXMTK7JcSECTvl1z+dwKULCEL8w1qBPELU0NWjSJeazA9Kq1DR4RgVYg
 xywxEMxN90IjwM54FmdDsTvGNdF0ocYJIYM5sx1KzYlACLO54P73c/0f5EohVW9D7F0g0VlVrfG
 tyL7kR61zD0HuBqEOnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX8CdyVCaImSMm
 hnyGsL0GUoIwBCCH8ifSC5DzOsMP7K4lkCWPxgUWONP/WObnCj1gm54CvVvTmgKUEXF2Ev2rrMm
 lMQzXye+073QHuy4JeMuFlMJzVi5Nrg=
X-Proofpoint-GUID: DjvvTtgfJtY7KUKTOzeZS1CXzuigte6e
X-Proofpoint-ORIG-GUID: DjvvTtgfJtY7KUKTOzeZS1CXzuigte6e
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a9915b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=YOhxEyfzO7YiFk8NLKYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> When downstream value is undefined, it fallback to 400 kHz. Set it in
> mainline too.

"The Device Tree found in the downstream kernel for this device doesn't
explicitly set a bus frequency, resulting in 400 kHz being chosen.

This upstream DT also lacks it, however that results in a different
default value of 100 kHz. Set it to 400 explicitly to match the
downstream kernel."

Konrad
