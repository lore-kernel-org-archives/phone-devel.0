Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A53AC0DA
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148919; cv=none; b=Je2yZospadbAGhi8CUjB15mdWoh+unhb3Fs5WYTAqTYkpaMoCbNg/lCKV+C5FRm7gpRPd60v6jdunVDPvRBrLeUwaDg2ufDvHwlmeoyme6Qetpcn8hpHkHvUg7DtlCZEEl23iwzO9SBFGAF/4wVFO+iDX87K+95p1NcGtujpHpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148919; c=relaxed/simple;
	bh=kAc3fW7+IMaN1I2ItzmCwWE/LwYz3AT3uuNakgRg0k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7a/7nrQXmD+8M6yjxn0vLpOcazg90Gx/EQlnqPANrSCWniHuEYqO38XhDUY7rJLk7bT3Ot7IDLE6kEP30LNXEwzR4lpdWvFoRgqevG4ETXqUlfVwd7lK35cw3fEH7aiHrB9oJekLMWlNG/wtyRYjJC2MjCBU/Wr45oMMY6GHAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFDl7XMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVdHt0n4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFDl7XMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVdHt0n4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaSJR1647102
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAc3fW7+IMaN1I2ItzmCwWE/LwYz3AT3uuNakgRg0k0=; b=LFDl7XMui8mrfhXp
	7e3MMWa7nO6wCN4UfzViV3l5E7cNrudkkhVYcE307hcvDdirQ3XHB7N/ORPRV41t
	b1FgXQXHgoi794XdY7db5jmnflHQNjAuHrCDeNTbw2VDqAOXPlx7h715P6axDTmy
	HXT3mFT5wae8OgQGjf1AQ+5U96Y/mY4wqGPN2Zz06Ot5ff6TT/o0FDwNod6hEl9A
	0J0RGl9GJObV6SqU6Bxd0J7L1HwBPXGaAJmYuXNS1eZnVJPfzBkANnoHPiruXASB
	ShYaRm57Ak0pgpAe+MRQj63JuSjwUmE+cZUQyM0CvF28DC8R95OaqqDV42PknNJj
	hWTWpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8802n5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:21:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd84cfae34so112221585a.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148916; x=1773753716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAc3fW7+IMaN1I2ItzmCwWE/LwYz3AT3uuNakgRg0k0=;
        b=WVdHt0n4f4/zNUnyZ4iGJm4lMmYdSFv2THlwujL/JmMPoCqVNSaqCLRaJ61vUlmaN3
         VoZM7G9ugl2rVvBO3G29HtOl1mUGaQjd5FmOTG/VEyAijbk17p4us7+60ttDPjGjksDK
         7DUlelYmMiziFntNlklt81YaXuF5s83vE7zCbAnZZ+ByJPdE7k9xRb426bWyX6YVzwYq
         u3R+zRkqFomTImFbJyQRirTD28ChZLpjQy39fbUnhfFaYqrOAVBe2awyEEw9ajR1bjR9
         i496XdBxbTdV6pBIFOtUjv5YienRqEp9IWFLDVXilim2q/ZpfT9GaSxQ9WULrzNkAjo4
         qUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148916; x=1773753716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAc3fW7+IMaN1I2ItzmCwWE/LwYz3AT3uuNakgRg0k0=;
        b=tzEL1D7NqLUOFBgpC0ot56H34cjz86o2yEwUsHYPZJi/CCBxoN2Zr9gW75fbvfpS10
         P2U9wL2wfKprHwWcB+Yc1Vf9Nc9zIpt+URJ9oYbCpRt21dG50lWD1UZ3JxxawMiCu9tW
         sRxowz9chDMo450UzKpZRLglNcQr6P5kbbAzELu/mSbWk4erVF6d2skQH1EWZwYWbtgA
         c1aBXWkmsv/AjIQ6Y1dxNHeRQxotM24IPdxJkf5Ohd2/3v3Q+DkSlX1Pc4WVlB7I936y
         fozM25aASjBwp6sX0aLkWIj23J4MgJN8keSJlERgHcFfRozJFW7WasMEWgvUJkiReoef
         d+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG9fxMyz5e/Y2b63G6cZJuHVl6jovQtUJyINRpcpEodvbiXCic/KqtH4MXzjqKxFnN4zOfiOE84FaabA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz59TTWDvhKqhpsicO2fnN4WclFjMYSfUKVbkBujynmcqxME7Ik
	+T4T3/evj30lZHkHBpkEaPWpA63tuTrq3SxaAOl0nc3VrkuZVsLglCq1SdgkywDyv3Tz9bGIaUm
	aeBoktSVc6t6Jmu8yU6FFTB+2FGeWP/EsFL27XT5FGkxEenii9k3Wj/vIVsYTmuPacg==
X-Gm-Gg: ATEYQzwULvW+kdT6xQwfsP3q44ikG3MSOV3qB9BNH/RXpQPkF8FQeWq+rb2Hsi0ULiE
	QDZUlGBJFr2ri3Li8jBcjabvMFvP5Xz6AfOUp/PMLV2o3uca4LMnOPtG7OPfia2feOlUoiPWCfr
	y9Gzy/tIhLSzbJ6fCNy5fNOkvvjosJr4vGkkz3CJm/Iy+BvLA9lxP9IKssQAfAsuayWiPGhQBl4
	qZxmA4ZY5h7uzUZo0HNU2+inHVFjPYlq6fCLUnS6+pDqVanjrSVxY/tYZXqIC50xBGvTFVjWzqV
	rn+goIHq36zrK3uDHaW99JN8WbiAa6ljdRkBRvzP3LdngFu0uu7roqqBCJJ463aa35B6UWRW7Hj
	MU7VrzBT+SB7e927sC4pmR25DMCiQo8V8GGTVhGx1U5/I7C9I/sx2q03cePMB42k4KDBbM18AH4
	5BVyM=
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr744006485a.7.1773148916380;
        Tue, 10 Mar 2026 06:21:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr744004985a.7.1773148915952;
        Tue, 10 Mar 2026 06:21:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e0cfsm2719556e87.43.2026.03.10.06.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:21:53 -0700 (PDT)
Message-ID: <a9658d1f-556e-4a58-828c-1d97e227dfd0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:21:51 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
 <fabedbb450f409aa0aa415151de0263b@mainlining.org>
 <2255b753-4d40-4e49-a89c-22ee939c51d1@oss.qualcomm.com>
 <6665244d82ee8776826a7f6a4e64af99@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6665244d82ee8776826a7f6a4e64af99@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNiBTYWx0ZWRfXxezXRFbtU1p5
 pbF/Cf/Xr1gcSG0puMyAxMBStgQwnHflmUbpEy7xrriFXmCWakrbiGIAQ2LaP1TvFoE2DCUKALo
 HcyXjjz2g5iM8AXZfCbLMoFYZTtcZrGAuDVPayq6SVgP9iDd7P01IBNxs8C1j15x1cx4Hy1w1bb
 V2H2xnUhGhBnreGxCgVgSuai0+N3Qffh5qYZDa3Lox6H7Xnfa2EVDjMv9v5Vjo4VNCpJjCQQlSi
 wd4Ej0QP5y9YCmrA7YeXoQovBlM8pPirDprhwiT8ChgbxGEGqm3Ro1CnmPlQC2tEWhZx5hHnaCf
 Bx6FerFhP4ayqvdl7P37hxlr6NHT20dR+M4DS1q5TGGxi4l7ll2Xt3k7gWUy2Mi/z8X5wk7knad
 yB8TFDYA2v3dY/VMeTCO9dTqH9xrwoeTYTAhhflFECZ/TKrWtKBn3S9jJHZdzR1oAkhF4LJT02W
 mIq0z2qnbI7qYOru76A==
X-Proofpoint-GUID: qs6T4xBgzQHObkhjR0lDlJd0Mmrle7qH
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69b01af5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=txOwCwh0rWGkxaMTvjwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: qs6T4xBgzQHObkhjR0lDlJd0Mmrle7qH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100116

On 3/10/26 2:11 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-10 14:04, Konrad Dybcio wrote:
>> On 3/10/26 1:57 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2026-03-09 13:55, Konrad Dybcio wrote:
>>>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>>>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
>>>>> it can be commonized for avoid unnecessary code duplications.
>>>>>
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>>>
>>>> Could you please try adding the following to your gitconfig:
>>>>
>>>> [diff]
>>>>         renameLimit = 999999
>>>>         algorithm = histogram # or 'copies'
>>>>         renames = copies
>>>>
>>>> and see if this generates a shorter diff?
>>>>
>>>> Konrad
>>> One more question should i rename msm8917-xiaomi-riva-common to msm8917-wingtech-common,
>>> they are wingtech devices. Which naming is preferred?
>>
>> I think xiaomi-riva is easier for people to associate with a phone
>> they may have in their drawer than wingtech-s88503
> What about renaming just the common part to msm8917-wingtech-common?

I think it adds more confusion without much benefit. Probably none
of these devices have been released without a Mi logo on the back.

Konrad
