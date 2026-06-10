Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E4440B373
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098354; cv=none; b=MRyDD8SJJyLFRUnP963M6aK0ThGqieH7UDkMyUn5jls0UAgsAfCjmR0Oh488dH1btVx0Pc2atJn4jONX0orgS2Nc9tKnKcnvS2IN+9YeTtNlLlILss436wMPdVYbJd1KyVsGFZbeT3yDy2J1sdls5AVXMmcqmZgRqOsUgIdmFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098354; c=relaxed/simple;
	bh=4ShRACg6pRN5f5U0yeS94DPp+wGyACls53laAsdrDZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAXmkvhrM4CPEyTW/6WRSJtG46/s7NZ16ML3AxkvqAlPULet6J/V9U6+k3SRPXjA41AyVnD53w+rxIjQNwzhwkddb2TuSUJdSsd0C/vNFOf420RCDnac2kxokm7weGgUA4NFo55XzM5HzF7Swlv8Nh/p0MPnDkmnr4ABcWex42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cY3CKTHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3HptgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cY3CKTHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx3HptgX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBnEG1137845
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 13:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=; b=cY3CKTHVDUsuNxMW
	xD3jRyPDlpXYqlgbyOpYd9Jw9o0n7Pvq0krnlEjoAConV+NVYvaHCjs1xME5bgVh
	Sh2ll16mn1UJhkr+OluS2yZB9pV9vF1Hej23hxtqi10cb0EBsueK3siMlGohNaCI
	OKckJn10HXBmeB2Ag5DqjsErHUOaTc/SzIoHS0Uac1CAl+fyLDH/b0pAOKbLeHio
	9svv7gyglZMwFTia27oWyEzdKND03MGBby7Fr3t/3Mxi8Z+qgGG8ALTWO8jGRdCX
	C5d3sPFadfTCllpd7fEKoFv/z/aUnK+MDNoKmG6lNTGyvQuERj8LQTegoYZn9RNQ
	gzdlPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2pv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 13:32:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9156dc90fdaso175456985a.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098347; x=1781703147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=;
        b=hx3HptgXPpXEu2ptRsb48y+KzGt3AKeDG1HD7EoFqSstKs1lWOIRtj2j7+PhDrvkCQ
         D4Gw0CuiS6c9P84c+Va2eQIOyylk2Xnk0MYxlUXlLZAJJ3yr3Hs7jbqFbCRTO2TRjm/R
         M6KdmqEmBWDmlsulmqGKW47rcczpabf1A5qukLU8mGDdk+5W2TfxqcvTsva13ug+Z5Ir
         s8U1CSZimW6hljLek9f1fsVqWe0LClIll0HGpEnMcTs724rMacEpqr66mYo5+ntt8CVJ
         Blr5vuedZdacxP0bHOM01uUNGZgPT0u4ruUFcjDsPEsIITgTyEVz1PXFGvuotdkAa5S9
         y0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098347; x=1781703147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=;
        b=qFh9HTElxlyHXy7t18MWd6TbcbHrxLS6Axu5bPeVAVMhEndybLt8YiV7UjG5AfcRM8
         BZCfuvdDYRs2gTJT6IUaX1PejrTD+Pq5gWX4JOgf84CuYQPPXw9UqNIXIulwAsck6o+g
         FQ1BIq8zsq8fviSNTiQ7yBDpEnxJr/4zL1TxryKiTuB+IISMp7htbfD29Ea9eGteiDQz
         bVl+zBQaFmPgWtfFA0W5U+4m1G1NhhPxo7KBXK8l2GKC3fAm9m3TUSvy5E5vsYQwqOfC
         AipAkNAkkL3uo9C0gmZVzlOZ5EjgUgdiTYELvoRiZixkssXD5QNssJ7mXBs9abq1BVKG
         w9Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+ze3VRWVZzrGN415DLYJXK4IBC1dnqikk6QOv+I/RgE3CqGqTYV7CWx7u/ZGvHTH2zivB8VuCFwJmVYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+ZKR1hZ/v8z6W41qfXQm22TazExxVUmqpZ3JZaaL7RRD9q7c
	EdtK3TnfbtubLEkYcVjl8yiZy4Zsk9T2SpAcMf2XgoNQMor/hpjOicogy4CQjiPsml0SwYkJG6/
	BMbJorUXgzZw9cd4b087qfB95a5gXGFrByzORzNmwOnBdLBUh8OPOxyJl7/0CrCArZQ==
X-Gm-Gg: Acq92OE+1ANJpvtIpSqPtwkDllbBiUW/KBLI1fEGqP7rNe4JRjvkdW3YNM/1CuH1zE6
	+whXJMul/sR0CDGVYfbFsHNPNFhpc+Z0nZWjtA1wxRP834twEVT48JQot7suNQc5pdfXyI9bGG8
	mWZW/leeFyJOwqsRxIPrYCE84Zj7VpmIqYCrUABRiJHu6np+PbtUuCwx46abW4M30jimlmWi0cu
	FzYqlXLKVJ+BJAwFU4gZ0AE9Vmoz66dR2lA9LoP06TwcQkjzj5QzpTvT5SKzdj0U/6tND5qGO6E
	J7Gs9DyGRgjvBRsMQ3CR2JrJnGmQj6/6Jpi64dT4/ToCjGSqizaJK3EDuFjYVLJrH3VVccqUJ2p
	BEQZ9ZNuNNT+j6YbZn5NVThj2nmpGZDJLaTiZ4hCxlODCAtkIPUOWpUZ1
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2570904285a.5.1781098347406;
        Wed, 10 Jun 2026 06:32:27 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2570899585a.5.1781098346827;
        Wed, 10 Jun 2026 06:32:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcd3sm5335664e87.25.2026.06.10.06.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:32:25 -0700 (PDT)
Message-ID: <4cd6248a-04e0-4056-b72e-00b860624dae@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:32:22 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
 <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfX9xjr30yaNKEE
 +UHcpsNSkCf7ieeVq39AvztG/mEz9b15GmFX/OxTwqwiCL/OcxDycVOsaqRgBJrQEQnf4rbHlJB
 BrUKsh4tZvDGX38Vq9wHlxmvhYBwuZ91I54PyZmVgneflrT4rFacWncn72gXCLRhbhWELDHKBfD
 wnNLkjIOYoFG+mzt+CYVBJzxHYzp67xr5q10zte3DkmarASqiZfbInjQeK7iA+uDxk3asrira40
 do/KvIOaRYOLTFcKXcfKah4RDNzP/XLVeCdHyBGFQ2J5YPsVAcaS23D3OMUgDr6vW36bFj+uPOE
 KgzIlGhc46cjz5AnLMjtPpYUCgJlpmfma+ElNx/hq1WpeKbXAWp9ySZo8S4+HNU0o6og6vQEypo
 +O13VA2qjxUs11PJAB88ci/eEJs3/wlxopKi9WC5l9g1uH1n3xuEwKCLJFcQzJmq3pEmxwrIxR+
 2dmm/U6/ebRUiLREeWw==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29676c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sFjf4MH_f5z_4b8YUgcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KBzEI1eGVsD2e8o3dHETaPWS8jcBI80H
X-Proofpoint-GUID: KBzEI1eGVsD2e8o3dHETaPWS8jcBI80H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129

On 5/26/26 3:24 PM, Erikas Bitovtas wrote:
> Allow Venus core GDSCs to have their control passed to hardware, so they
> can be powered on by Venus firmware.

"and explicitly state that the vcodec clocks' halt bit should be
checked"

// even though it already happens by virtue of:
#define BRANCH_HALT                     0 /* pol: 1 = halt */

and C partial struct initialization rules setting uninitialized fields
to 0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
