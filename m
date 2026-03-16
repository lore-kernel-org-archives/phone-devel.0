Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136426F476
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671037; cv=none; b=QzajvWWymPHf0S3fILjtqRuQGo2RLo0c05SIjT7kSzBvj9Q4Ex9LZfx8hQuN/TGlelmgbHUCZbfs9+WHkmvaC44sIqHjA4HMlmp834prYIZhVzpw3nbaR+HzU2fvKjBwZCzIJqCuHinYeFDenT8FRqaRPTaI7It68l6fUSSM4t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671037; c=relaxed/simple;
	bh=KPyB66SFAbo4nPiXO9mam5QGs1dtG6QR7Mh2VKrzyPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEkNvBFBvyBENlS76F1i55oHnG0vdh44n/CXE66PMFnoDEd4oa5u0fSiCm6YYQaWIFNU1otW6WpsjPeTypmz0Mzm78U1yla4E1tPA/JbqjJO1RT7emlpiVYNA081RHvxTGtc4aZNqurXaxqHtNREZp8/00NX9EqSEsUzts0zuB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpDYJ6C+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rp61m885; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpDYJ6C+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rp61m885"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBid1B1724710
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 14:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ku4t2Yxi8SLiqD/0cFkd3NhXc//dPXv+T8O4azLlDLM=; b=WpDYJ6C+WQyeQYPY
	Mk/3x5/tPx3XAi8Z4PDJy4H+9zuNl8G4jlu4jDW+9FI42FRqtduFPT5VBYLN47i0
	evLw7WG/Rb3I3xlnpE6o9ILvhU8delKL7zifYrzdTg6xdn+j5lljn1wmhRkovXh5
	akue+yxJObFb/iAlhiOG+EteXoXy6Lvnl7pJfILexgRfUcQkCP1Bz99SUhqEUN2d
	DH1i3OpycV3/drfnhBIdDxPpkGjKr4VDDdJiAOD85rgMuyTwiVhuQj+e10BFthaJ
	elxU03I6uQwow9/slzqHTcj6xMNtcwvPuLBFRLBBiWlDQXIN9KLKek6pJ0H3NMIy
	KGRAZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udp1ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 14:23:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81506677so2997380485a.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773671034; x=1774275834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ku4t2Yxi8SLiqD/0cFkd3NhXc//dPXv+T8O4azLlDLM=;
        b=Rp61m885pU2CgzlKymspiIavGMErRP6/uefSfBCm+MVJpsvvUBId/eKSWT9/YcRkxZ
         gHUyUoTHORlDLgS0oY9rcQL4y+76uPx0YYBwu592cNyjXWHxgPrJQE/rNHfquC64fFkm
         oiWROdpOwInEY26TvxVYDIqEKcUxSvAMBMPU79WH7sv4zz0gNZsedhgD0K7yc0wwApYL
         4L2ZUkzU2pH8NmFgy9noEounnFXtoC/2X1XgIDw60oLm10y3D6b8dsbAAgAqipxGQpxt
         4HZT6VfqyaJc/tKuSwY9cgA06mdaU96+1uXy2n+H9XNCQZ9eb8drjfSB2Y0VgA90cSac
         WBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671034; x=1774275834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku4t2Yxi8SLiqD/0cFkd3NhXc//dPXv+T8O4azLlDLM=;
        b=aHeMXxVL0M4PVzm7yh89DqgDEmj/ufYGbToMdEc5wUmZ9LCVxfNpOcgPVDWdPsW8K6
         8+TeEqVpC0m4m14j+Fi5lGl9aD8977FXu674lsRIGsdDZy/2oHdwjZaKKkPs9ZfaFMWn
         HgB5MD7KRPK5gElIPrn0pNhXSD5QeLEFq/m3vl/05oRwMgxbRiILoNGEH/WJUWehDLtg
         9zXqKZIRGARHT5GgD9/LJgmTjF41Dat2CduYdCoZGAY3xWrIIuPlvvSPrLVXflQjpgZn
         A2b5WGVdQS2FsVFWJVObKjed7esJn+YtYrOco3u1EKEBPz5J6bFiJo7ScJQ3V/xiKQXm
         B2fw==
X-Forwarded-Encrypted: i=1; AJvYcCXMq3d3X4IXIQl5798Oi3Fe9Jzy9rGBKfeWina1d8pWn+o5lgZ3OwT7uB9EmgwISPgwRZLkFq9rNbbf6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YymHbsXJXrZn3BKWfb8VO/VBEZtDHGgAVYd5wgZIyPLzhGdKphA
	19yNpHKVy4q/NYEDBG3gAuuoFj2pu27Ey1kDkmgZUHc0hxy3hY5/JJuZ3EtQ44dmbYunPcYq8My
	y1t4vcwQiLQ18Womhew0HijYbK/nPk3V2RG8pg24SfV+9uvFGBttvhslQGvk51Eq+PA==
X-Gm-Gg: ATEYQzxJiSpDrrrUmK5JHgCsy7Qcg9YV600+rFYiR0zPPb6M52lu7SSPN5/lAJkfOq3
	UacKBvNX3v9kEpkQ07Aj24cqfIOR6SYC7LG/8hKxljWLtiuV57esnxaPmNNvL4hjDBeZ2E/w1lZ
	MfycwJ9bw2T4SWpP50UGgiSsMUQ+8UcWhzfahmS4UwtIPBVEdmj9I9V0fAvWt18DMAwInALBpve
	vUtC6YNkcD62ubAJp2MdXzkDODeV0yezcSJjGAnmwvJ+tCwQIZXgNDnyjDuwgSyRknXAIQDGm9S
	IwsCME3eDERYW7itZsZdYLvxKVBIkuJFWT8LdcAcr78L5bSkjJcIoOUnXxjGjk5ysTGRjBU7oAG
	kfba+zKBWxHS1ETq3AEzgs9iXvGhZbye6F6St2Mi/px9RKas2di67B/hytS/uDZA1j3kFREqbs0
	X7FoVEmfH/HSump7aNVbxdjp752J5OnK8umsA=
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cdb5a5028dmr1639126585a.5.1773671034258;
        Mon, 16 Mar 2026 07:23:54 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cdb5a5028dmr1639120685a.5.1773671033649;
        Mon, 16 Mar 2026 07:23:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156163055sm3459525e87.45.2026.03.16.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:23:52 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:23:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] arm64: dts: qcom: msm8917-xiaomi-riva: Fix
 board-id for all bootloader
Message-ID: <onzbp5pbauvrky7uysu5nd452cytyj23vhk3ey2j5tkyutlwjt@xxey7hetrrsd>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-1-897f130786ed@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260315-riva-common-v3-1-897f130786ed@mainlining.org>
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b8127b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=OuZLqq7tAAAA:8 a=qJtDQxWyQGT2TDQmBm0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: TyUgW_jSv7PC7Z7OoxgYw3-sFqdD7dxA
X-Proofpoint-ORIG-GUID: TyUgW_jSv7PC7Z7OoxgYw3-sFqdD7dxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfX+WFwqJSR7BJ7
 NaXTAOKt1m/c9pC/zbJ9Nyphc0CuAhkrtkpFNYk0NVBOG8QsWi2mB0DAIew7rk8LcXSa3VTZEqR
 j8OMMAi1d4qHZVd04faSqrlAp4JDMjqC1H6A/hJLoxAqTz8d5/JtYBQc4n36kEQaDKK59n0ywSw
 bn0KK/WIgR402Wngk3jPFLs5hgNGpkghRkMnf73+KYpxoHzpG50Y845MY50pTthGu4qAG4Ea5pT
 wsKn9iepS5GyyKma5MSZD5xn1RqEIjtFKDrOOadQYVPhXzsIs7LM8u9NEtdaGvZ7lMoFabEyae+
 xBhWd+chszRcUVTlrtQTSJ/IREpBL9cUt2ALs3RxCp9lN97SBQrzd61/OWyZx8ca4n6Q+BVcD+w
 7AmyC9HdxHJg2XUmXbEqmZ720NIQ81t1OuEVhrM96myF1S8ypQa5CYFVYxXnDfkQC/vmVX8G9tu
 IUfyMXfxxkvCCi7xKLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160108

On Sun, Mar 15, 2026 at 05:26:19PM +0100, Barnabás Czémán wrote:
> Redmi 5A comes with multiple bootloader versions where the expected
> board-id is different.
> Change the board-id to unified form what works on both bootloader
> version.
> 
> Fixes: 26633b582056 ("arm64: dts: qcom: Add Xiaomi Redmi 5A")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
