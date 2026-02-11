Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E82DB7BF
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824930; cv=none; b=csd/34QDbKZpGqUHVXeg6hqU3jPlZjqa4FYWH/jVanSlevMqaWXdt6/m1dy9/htWACF3iKYadidW6NtrnYVAA49HzhrlyeavMr0eWwjCAJ6XjFF60qEt3DJsauhumc8Gaxr8wTPwMa0vNENMA1pt/KcbNBCy8FfL13K5xfsX2Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824930; c=relaxed/simple;
	bh=7X6WhXcZP2zosxXdxnRbDH3wFCsRm1yWHsTW7p9o9i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd2aL8pqYXlJ9tuJbJYhDHIDZpmGHFX0STNEdUrZdZaBcFbAjEkHhBQS+xzjG95bmgbQHInMYjrXOeipazFQPB78/27Bh1eVsOm4rkGmhfzq0DVe1vXitXG8teGI8+bShFUv7cDhNJLOXCNySAgYmJnEx+5QMtdoWMO9FLdMr6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daQG7+qW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRvEiHOr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daQG7+qW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRvEiHOr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BCTG0R4013749
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 15:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dyp2g4U/Eio5nOlZx8uAt+gT
	6dCc3RNViNpk4NKU/nQ=; b=daQG7+qW5rmXcTPfgELVyez4U2p1M2VXpqI3G43f
	brfijTzAg0oqLdwlcqRT41O87LA7KX85DWfxmR+MzdD/FIyfJ7E3biXc2wQnAEFR
	qFRU5BdeErPZkdVUZxFvnxxJwvbDIirX9fPaArJpaJuXgzEHYY9qQ4SjWzostLTk
	NwjNGpf6K/jKoMa8X4RvRtW8Id9g+E300GfJ1wE0Z3q7cIIHdScYdqsPSCrTczk6
	vUYF2+85WWrG2yX0SUYtMDb+r7Bilr4+UrZEwybYY0mIO1WAKDDoyWjRa8kSgjot
	yJcWQ9M7Wla+cNJwby4G/VTog9uIsBEsdvepmt5isHgEPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8aadbhkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 15:48:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso2580405285a.2
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770824928; x=1771429728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dyp2g4U/Eio5nOlZx8uAt+gT6dCc3RNViNpk4NKU/nQ=;
        b=KRvEiHOraMurJR8MwBSm5JiC8OQqtaZwRaObp4Pp2kpiPHgGn5bBRTVvmj64tnIKuj
         wiqazvutL1PNsZaAJBxBOUBYg83nzZy6aYEU7N3sfe/GAEue+yt/TtEwu0snEi6lPKo6
         Bw7eAqJ1AOfZD1H5N3L8w052MBXcICB6b1tIyzJxZYKLuRsgjSLH/MAkXa4wEWGhfZBE
         QlaDGFJ4wgr/QEW0ptk0mwhEiAtaR4J9r3O287IVbLUpxZD++WxkNwOJTdLJh6mg1Y5Y
         a5veM/UlFOkdR9TzZAOKR7Hi+pv4PbtHAeKfZGxAgX7wrzGOnBAuScFe+m0E+3k82meA
         UnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824928; x=1771429728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyp2g4U/Eio5nOlZx8uAt+gT6dCc3RNViNpk4NKU/nQ=;
        b=Mwqb57JVnBELcHkPZFfCZiwfxXg5GWcsLxCpkEycVRl5SskBoo6RXtuJSem0dN8Lxr
         KHl1dG4HwQYBJ0g27vFrH05tW/NZrLBmptybAcu/LzMyXkJTk2IxuxYIY+Bi4MFKAFM2
         PoFvp0KkFeVwKKORR4tImWSTA1VP6qXYY95d4s5pOXRQXPDMVvFgPY7iny8rmuQi9n2P
         gIofZ/n3UgBnbUVMLncghDLsC+Sj50cBqd9jW7Ra8Ll9dr2PotTeHkWmhMGBwgNahV8G
         X6dIs/MXibU+d/cms8XGKKNuIuo5WKST/WKW3q399EzDpCjetv99IZ9BTBJP/MASA+QP
         f3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCV3QLfpfzPG6a+SjUgOxWTYFjbNs45Li+jLPctD/vZm9gF9w9ajbwpLkVE6V9Jl80IVm0dE4iDOxC1hkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTesIa2LCBEwk8Kqqp29ESQdr9jnopAGXpySMK2iyRqB/i5u+p
	SWtdHeSSwnWrJskX2EHkBSy+cxhTmrSma/WYPmk0Vt0KvshoM6vg4dM7k78jlVQqdHW7Erj8rZK
	Ny0GiUHnwuTKDxPMY+dY/SKivGyXEM1x+RWs7NP5ubKYP6v3bpYA9cIZQDAYSN25krw==
X-Gm-Gg: AZuq6aKrcfilYfXs8DdHq2ve6VcbMKax2WJwFtPh7lTZZRqZYc4SHq8lIcEZYIzCOm5
	f2v9tsK1qSzr+XUa0lPiXWWlGFj3YoljxJK3GEBoIwix6Si4NBhCT2pLSAL2tf0diXFGlfJDHyk
	qXCYSzOOIjBBPz5bmWWDK/pMWwSSHpvH5T/8o1FTUksDm7ZEJ6t6Wf8jGAomXswDJhrrszkl3Sa
	ULk6zR0814gRYXbSWWfDT+WliUDFoo63P/+C0QjpmQj2dscRDfQ4Y2qoRQN9PWEqIdagXlK2kp5
	HUw6HIQ1VTJJ4OFEdcfsdgBCr8Nrr9P7ZcHGWrfiB7IIQW/OncSd8QrTnVHIUW5OTlKUeW36/xS
	2CwzPh8C7BpIq8q5SXjAgU2QFB2nAVQz0Hb1zfAffEGChxRZtMtg7GXFRVbbFlYR+nQH7nbujCI
	9EV9swqdVOxM6ToG83xT4EoUQ4Pr3UNWUuG34=
X-Received: by 2002:a05:620a:bd3:b0:8c7:16fb:ed45 with SMTP id af79cd13be357-8cb27fb7776mr433479685a.27.1770824927719;
        Wed, 11 Feb 2026 07:48:47 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:8c7:16fb:ed45 with SMTP id af79cd13be357-8cb27fb7776mr433475985a.27.1770824927255;
        Wed, 11 Feb 2026 07:48:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870691bb1asm3310321fa.39.2026.02.11.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:48:46 -0800 (PST)
Date: Wed, 11 Feb 2026 17:48:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add I2S1 pinctrl definitions
Message-ID: <3lzwobvrymrzo4ggnkewxi7wvp2hblnev2dmvfyelxwa52rdqq@dqexl3oe5fak>
References: <20260211-kodiak-i2s1-v1-1-b3a7fad8014e@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-kodiak-i2s1-v1-1-b3a7fad8014e@fairphone.com>
X-Proofpoint-ORIG-GUID: 8TkAWSzY1QWEn2s05GlC4lbswkPP0Akx
X-Proofpoint-GUID: 8TkAWSzY1QWEn2s05GlC4lbswkPP0Akx
X-Authority-Analysis: v=2.4 cv=OoVCCi/t c=1 sm=1 tr=0 ts=698ca4e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=SBGJfJ2iIvnYiQKw3gcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyMiBTYWx0ZWRfX+8FAopD/f2s8
 195CZHd74fpT1BB4n7WoRcJodxOhN+op09PwEJs1LArTsJQvE8otVuVyusZ2Jt+YpzXc8gk25XD
 byfR/XJy2sw5f7BUTzYEe12Hr4Q2RWTpzeu/MOEgmkKx8lhikrOv6lGUBdburJd6SBE+QYBcSiq
 73kUe6O1fujcPma76DdgU9yOZgtYTmulArseK4LrnKZ0pYbbyVjqgv+6QInpyTrSPQFJlB0pA/n
 DHjHtrQzkCg7uZI7krRiQE93J6oh3gTZG2bk/3Mmu9xwJvREtJiJzFflGewKYfwyLoiAtF3RMYi
 UAkRZpVlimmUF8LWRLkTDl2nxhdjfT6Clg1h5Ap9A8hzd55RbRJUn+qMOQwAKYCUILrb8l1UxrP
 hrjxczW+xuR3TAU5Bqlk+TinnVfZlUhlKggIkYueHE8byeMMxhZPhz3t+RqxqTE65AkrX4T1xfQ
 xXDQnuTyzguqg8bpFrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110122

On Wed, Feb 11, 2026 at 01:18:57PM +0100, Luca Weiss wrote:
> Add the pinctrl definitions to configure gpio6-gpio9 of the lpass_tlmm
> for I2S output.
> 
> Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
