Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE8B3CB2FE
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535250; cv=none; b=YoFC9HahYar0Vm43PYSPjjjx/LTGO06lgP2kaqsMcx69xizLnptPuAkk2LIsPqS5wrHqUHxRx8mtCGNi+edP35LfXAwW5cWMhznz2rSPGkGAP30TwwLVwhc/XbQnvwug33nyJEW/n4hP6cQD3zIeyf1pzygJDTRsz1oL+MBqVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535250; c=relaxed/simple;
	bh=o+ww71zqul1lQ6ZJcLPTKRz0ecgZ/H3wEyDx34f482o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuqAWKN8jlUPZg8ylB8bOOIPIpFh+QZ1A/HhEv3l1fi6nhzqOIg5OAiipkVmuPABmpssVJ/TDu9MsKbQbSxOJKwk1/6cYiBlyUOCEmB/NfL6paXfUE4wSwKh5TEUM5BnqiIdTAEsmpCHghwndXHxN5aFdybzyJrZ/yK9zT23EOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irt3KpTQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+98lOY2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irt3KpTQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+98lOY2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RkPX1713749
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxSJtoZ36fpCUBl6Gw3F3Tl87CjAtSY5VBZzPq11lL0=; b=irt3KpTQjZgCvSkg
	2vZTHG5kDZU3BViixt5gyrcsC70NGn1gOAGoeEaNrLzYjaXETf5wjD7qOsTlxD66
	o4GylQTk42k8Fd1NrEUgwmnw1pNdlIzCO2AWzOhU/KoBoD3Q1423ju2D3Qj5tYWo
	V58LymGaKfpBIzJ4dzrzoXqFF5dk4qg3+zSvTgCOe62ferPMlWUUeJJKa7vP8Od9
	zcKIgDfrpkB2/bHzZ3+KA9kc2ZHTlwlXx5vU08tkPBt55P13+NZduEpJqT4Bof3b
	wzDN1L4WtD1++NU4qV8LuCzqUuf1NqdHTKLFOs9ZgE2DqWa64DPYHv9Hhr6Le7cQ
	fSzDdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc55r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:14:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e566bae1bso190373085a.3
        for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535247; x=1785140047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxSJtoZ36fpCUBl6Gw3F3Tl87CjAtSY5VBZzPq11lL0=;
        b=W+98lOY2O3yCDGSs2LjATzKHq5l9ZFgnoCnt9crTjcccEUDKhoVGsqPMxMNCNjy7Q+
         wjtW2+PHM7xFs1szNW5VNeOu3efDUTmjWpPXVHt2OwMQkKElqwriZmcGQZK1wkHWVkBw
         mEhXEAsqakkdhUuJk3zZlcKz5jNTyrpfybxfazn6DtJKK1ftDe6M9yWiXSUdSmo0bqQi
         xLPddfAiHpjnuROS6WRk/wgOWF77fFoj7GyCpC3Lna4uvUye8Zp1jOEH6fOfrbJTAQD9
         8UDqvoR2AdGV6xDNzUXN65eM7CElsYwhgTXtE9SR/cfVy9h6WirsKE9MQrgo1+39nlPW
         j95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535247; x=1785140047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxSJtoZ36fpCUBl6Gw3F3Tl87CjAtSY5VBZzPq11lL0=;
        b=gFb2+peNCTYUSx1r/Fz7DJQXQyL+d5EXoxBwQBrbL1doGjwKvT5xYwrFT34IhTsH3d
         WyNa05KmO+57+U4gBFztCDPd/ICW+qUVsMK1lU1ej3tPufeLzLIJRcPPn6heU3jSkKmp
         BWVtpT9CFW7F+T7QIi4pfbjWV+gCMBe9H6XPsxaYQhrq1yo8l85Kdmn2srL0DaQzu8PH
         WBxo/8tlDRzrvlkaijXQKO5r6JX/+rjPFXNGdI9lwLVBZSFRhZk1dbNvoxBiEYBnCSNg
         PZ1v/nSmn88mWB7xouweHF37Xq+ab/AgsbSLfhKwcFQEQn9QUtfJ8vuKOtgPcFVlWi5z
         yJew==
X-Forwarded-Encrypted: i=1; AHgh+RpvYjcvhhgw9B81tczro3ZCBoO0IYsLFxgiRjleVTvzO4FQU2aVBGyx9cdK2k//WGiLRbd/zAfCzRbCdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfwSaIpLBSaWYY1Kdb4K8xwXt85OkKUlx7nubaPZQ8Uke1vZ92
	oXvbG4eV3kt8JkhOo9guYL3LCSC/9XCyuE9VDcRu+RPF25cySPWK8ISXYLvgWC0DwSH4U6ZeR2i
	FWlQPBst63WnsNkqvuM6ecvuNyBoFoajevtvivigb3isBy5QYx0PQ8DfMDxy91kzffw==
X-Gm-Gg: AfdE7cme2oqj/uvAfy87nhwfVSTmYx0JWa1P9tXhmUvkml0pXDBVzo8QQJPQgxY6gyo
	E1LwSdqcun7gy0DZzwsC4knRX7RhJyULta1BB/HGLOVfkDJzW3d9zhjUDbH5cq5rrhwBxDIOoHh
	Yyt1FU35X1Ya6iqETFlkchq1K64v/MCNLXIjSj/afGSDykSCjrLSqrj8LgqwfLdUR8/hWjN2JBA
	7EJYSHbnnNscovOHOqEVy82PEtHxNrl87NIlgXMw1JLheuJNfkDCPWxHr339htzyXhR1j3rpig7
	PcgNiaJDUIxyvdyPw7p2IgNG7iGZjXK0hEEGIC9k/4avKekM5Vs8ksCUlzlDK6SbHAPxZehWN0u
	XRf6YvDc962TRVvVee4zyKMPr
X-Received: by 2002:a05:620a:aa09:b0:92e:d1e1:8300 with SMTP id af79cd13be357-930b41f98dbmr965454285a.3.1784535247477;
        Mon, 20 Jul 2026 01:14:07 -0700 (PDT)
X-Received: by 2002:a05:620a:aa09:b0:92e:d1e1:8300 with SMTP id af79cd13be357-930b41f98dbmr965452985a.3.1784535247075;
        Mon, 20 Jul 2026 01:14:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a09a44sm421171266b.19.2026.07.20.01.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:14:06 -0700 (PDT)
Message-ID: <23a3b460-3ce6-4139-bcd9-a9fd88d7436d@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:14:03 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
To: Esteban Urrutia <esteuwu@proton.me>, David Heidelberg <david@ixit.cz>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-1-56fd05822270@proton.me>
 <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
 <57bece3e-cfa8-4ddd-811b-eae271b738fd@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <57bece3e-cfa8-4ddd-811b-eae271b738fd@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MCBTYWx0ZWRfXylKR6+nX9uMG
 W/ZESxZOm4NDBx4a/lbk9j/LjLdri+5oCWYl6NLi5ypgUudzfzPR4VqJaMOb/R7AC2TDFeRCcPy
 olVcg6o9gMcKB1ZyhVFQaRSeTtSFkt8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MCBTYWx0ZWRfX7Osh3KnqiZ6a
 pTWpiGU/22uNlbTWHjADqgmjlvcd7UtbSruwna0M07ZV2k7GrN4Bc4tjMm/ZozNVY0b/GoZXExq
 t89y8YGAcD97wEZ9mGYtwZasZQSgGQ1BHgmyk5xvuPctXjdsTXSfdKqW2eqaiAnwJhXA9dkMwla
 K16kG7DPVE8LwASzI2cH3mMn1n/csFL5VfA+Mxk2WJvsZW93Nlj8Aot4fE4lzwk6BrlaPwx9XiU
 m1jkdLwofWUWM4Ly/6ySBQc2VGv6P371urudjl5de3AWTYMfa6NuHuOXSNJ62ftwZ7yFvZQpVsK
 Kxnk1PHbWxg/QzGv+ap6VPB8PNlLdP3/Go9rbzIJFmmsyozw0EZsgrgE9iAI7jZwF7ho9+SM+iw
 RmxHN4Bm6eg221ZFIwg7vGYpsrrp51RkuKcWmU+WLVcerm+igQoxDB4Q69MLJmMDeDFzMOmVaZH
 EDfanEECAwiwkYRjwyA==
X-Proofpoint-ORIG-GUID: ZbdirOhnHZ5Gxy256j9LQ9EE8xz1ymL9
X-Proofpoint-GUID: ZbdirOhnHZ5Gxy256j9LQ9EE8xz1ymL9
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5dd8d0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=s1V7f2QmSm5Kp7TUuH8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200090

On 7/19/26 1:28 AM, Esteban Urrutia wrote:
> On 7/17/26 5:02 PM, David Heidelberg wrote:
>> it's likely this change will be safe for older sdm845 too? Comma.AI people have
>> it applied downstream on top of 6.18/7.1 [1], so I'm wondering if it's something
>> after testing on available targets could be enabled for 845 too.
> 
> Hello.
> I'm not sure, since the patch you linked modifies both mdp and rot clocks
> while I only had to modify mdp for SM8450/8475.
> Both clocks would have to be tested to get a verdict.

I think the 'rot' part should be unused - the hardware is not
driven by Linux today and I doubt the bootloader sets it up

Konrad
