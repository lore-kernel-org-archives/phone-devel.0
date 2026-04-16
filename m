Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C73D412C
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352896; cv=none; b=IwM8ea2/YtVCih5rRlCKFX0XrBQxi08OSGxS/bs26UjXt4e8x7I5c9tTP8acU8pyVQV4V54AOWhmIz0t2Dm9dipjmVuU751wz99AQI83pwz6tZ7T9k1MpjoqSwsX15EqWILb5BRdn5JqBIVNOuBwN+16Y2KLF3RREYCItPg6sd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352896; c=relaxed/simple;
	bh=YICVe7onyRZm1cIU0ABm6cP0eaJuEsK/X3wiAhTzNoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtrW4jcklj7M+AAn2/DYHdg5ovt1ysoqfg9aEanTXcXaMbQ7iJ0qKXN8b11+wcgCJ88zttcO0t0uJ3yKia8ptC7iy3Xc2IVdRacjrdDjenpW9PdC9W2lnhd06ScNBNgmYllEf4/CafCy+UK7zB+34wcsR1BBjN9r/8ypXe4DAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYCbXC2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhzezjnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYCbXC2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhzezjnD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xhGW4124954
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 15:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=; b=AYCbXC2mXQiuahsX
	Q7/stFtLHZjHs59or3bQVxEohitjkd6L1fjnTGb7RM4NLrTLiJzk3kW7TwUtP05h
	spk3InPE9WM/BqSV4IptViyyykNpVrdHrQHU0v5epM52rwMfPZjQZkBUF/k5hS7W
	/EyCEW12JRckofJtjT7W5uUSoAAU7jGlrKx/HO3qmmPjBm5PXatz/kvdBG0d0pYH
	6iPEDDghVrb7A5Pp46Ftrhk0Bn7PSYXRg1vhEi5rCRHLd7BWPYqcQkyrtFmUhLRl
	QlrZPOpbLiFe20gR52gaGbF8HXniSJSsEJU4YeQl1ohoJITdwUNVWGFRJJHvjBcJ
	V79Ziw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf99ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 15:21:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-61060ad8deeso404251137.1
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 08:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352894; x=1776957694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=;
        b=IhzezjnDYTZGWz04mpq/VOeNmiN80WL/dZ1dQxPH20KuIujTmGovT3De5DtUbpmoLV
         qvrZaN8Kn30U/p8vqTzaqj7xaKAo3jGXk8+7TX23lrWdHlI1u3KnR1S8MApz58jUQXV9
         NfldJaQMdte/Do6TlZIE0PwDRkWu3jmoPfa5EI3rOIQXDN9vMvfwC1CPAqchaCFpXb0V
         Fy6N8oe6n8b3XyYeOapN/k28LtZ5rnpcLmWUA44F8sLRo1eyOPIPW/0Mt4FnBgu14mWZ
         BJN/4dh+L1SJG61usGkgfUgTnSpoWAglbyEn23di6hR2+nHocAUO5wwadPbgqWrZSlA4
         C87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352894; x=1776957694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=;
        b=gomDGSPSBvlhgtUrM9oKlpFIxXdYolmbJ+7gO9/34L2vp2eGar+0AqImhnEtC4OUEO
         +LzEZ3rm2TcyYbvrNNO7zE/WbcmpneH6yXpDYve2xqiUUhD0apvT+xnOrd/evfGVyYET
         eZCA9hzf80fi/4JwekOTw7nY9B/6wUtYRjaLXqCRGZ8AfagPnyYqFus0JFYWSjdopTMK
         3p8MNIIZ6KWKBR0BF154jpEaLP8vTQDJHW76iH4rd7h8T1SRxxOKBxRRrhYgsy0s7a1J
         Skyx+tLFJKnt3sK/ZmhWdBTllxZoZU13xGsLOAxNp1AdD5Xwz2tnX49UleEYMXNcjfLP
         VFKA==
X-Forwarded-Encrypted: i=1; AFNElJ8wUPT93OYZa/bL6oucRWXDIRkpMxbBr5MI8iTf12b67L0rGGbezZQg36uTxKfUtOxPE45qTPxywi93WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBnk+qeZoxwtNddZHhVSi1h2NIogGI5tSk2XtZdqhD9EY/BCrN
	ULgLLt3gzVIke9Wmd2wxmsoRvxabzKm+u7J3qv70J7CW3qpipvihA4uIUUhJtIEQ2K1I6C3k2i7
	xqzo45YyVg54ocxISX85N+QzcB1dTKxm9uW3hMLgEl2QozX90YFHZw1Wcnn3GYxTpuw==
X-Gm-Gg: AeBDiesH2875kh05OqNz3JkqBvVJbBm0rvpFi3K61+JPlYkNLB9JWxanuedkMuftBxH
	mwQuRvK0u/sqrC83cXN1+6O1+auuGk+VmQ3N7yZUkgbNRAH9oYgR5lTN3ek4vgDlTIAWuCfLHHM
	UyG/BhZVTXO2u+KUGI/0STqzDbTIjKjoQfcXzMtev3p6WcM+RijrJYz5s0ntJVsVyJgl11xjHQw
	1sFSbkodU01Bv6nkfp5CT82ekoP2dzwOAzxoe+5i8UBUieJtdKfMv5LMSklYU8lnlXUEFXK0ND3
	tOa/oiKPB3Q72rjxPvgIDmN0s1hTFAPmk/JTSJ15fQquObie3jRR6Ebp1Fi6mZ9KHYwG5PTl/CR
	+f8wqRO1182DUDHhj2osXSyifVFL8sOkC22cPPikZtH0KTcdDG+2CKNgKkxYw2cDky53cQVQKg9
	0q7N3SW95SqsmpNA==
X-Received: by 2002:a05:6102:116a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-6141e262470mr490400137.8.1776352893470;
        Thu, 16 Apr 2026 08:21:33 -0700 (PDT)
X-Received: by 2002:a05:6102:116a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-6141e262470mr490377137.8.1776352893012;
        Thu, 16 Apr 2026 08:21:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173d57fecsm181221066b.22.2026.04.16.08.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:21:31 -0700 (PDT)
Message-ID: <23574203-187e-4fd4-b143-e53ae17a7a00@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:21:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/10] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e2ARkSQmkYMNs8tK3bIDXptoR2SyojEu
X-Proofpoint-ORIG-GUID: e2ARkSQmkYMNs8tK3bIDXptoR2SyojEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX7S1/SPFuMrns
 u7qZC3gCw4hIG/vJ6Toy2ubqqaKKr9jJ/BNfdUSP7ciDhntLIEgOvyVglzcs5GPUlID+80qsro7
 1x7heupgr8OeCPuKW8/eozk92VBFjvZ3z+ExX5I4BQZdeWRRlvnt47elb7+qrt+as71GDB3AXf+
 2dl0SV4JsqvosqZpzbUKi68XWxe1IqUAl5WWHrJwrRNDhxrLs8C9q3PJHbZYs2l0ZXYaneubsn8
 lj8tmoLHQUTHNHwxjKjVmxWehmyse2qlBzqyxKeyVIdPCuF4jdaO0Lo5VZirBeacS+8j2Ofohh+
 CdjgA0FKjMrSSxPbJyrTo1QCbtHZ4tDQkaTIACa3C+k6/yPf5C8sAiMu75BhP+1SFN7DdCRLZFV
 a+bTgHDBu4ZS81ETttfu/nrrFP7O6mRsVSr4aqH7+rjnzNEvvXFwwd5X3OIlenAnhWo5zUw+c5t
 3Qj2CPtzs33i+0e4rPw==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0fe7e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=d5ByKtP1W7CnrCxYHJUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
> to these GDSCs to indicate that they are hardware controlled.
> 
> Because they can be switched off at any moment, also skip voting for
> it so it can be enabled later.

The second paragraph bears no connection with what the effect of
the changes you made is, whatsoever

Konrad
