Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8631076A
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329682; cv=none; b=PooKUDFaIy2I1KXt9V//9FIAg+A05/KAzjyrbr5xUfG1TKeFoat3cHuWBpYcUV4E5y9+OU/DhM69ek08mWdrGHbo5GkD1utEkNBib9b2fEug8DD7I9ZbvBl8boDm3hQWH1TmsAMf3HWFnQPWljBAyIfW/+21YK6Nx/y6TCbc6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329682; c=relaxed/simple;
	bh=wyi/2K/PMgiBnA9eO9+b6JgtXV7Y4MAa2MEv05gq3no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxmULMMJeymv1SoUzhEi9c171rEG9UUN67y7TLAQDvnqaigBBz4F6wdKtLjjP+Cv57IfPxJVnxQKiAFSSxGIMx9hKkq1Gfc9058kRG1wx/Md65VDO2o+wEIrFJVr038F4JaxifdVJxbREiZhEyxD36Wmwvgu1+4cTdF9ZbPfwns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifSnJ1ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+5afWpC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifSnJ1ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+5afWpC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8v86S048690
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 12:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcoxJfqP8hTwWTWUoRtoBVPz62wL8BplEKMyIUX4f8A=; b=ifSnJ1ejb87BvdQZ
	byFrF3BA43EMtnd0P5sXvejeW7KYbJOi7PG03N7TUUgxWnILGIl1YjcR5/HZhyNH
	xNf03lcIcEPCAfSiFbXD5TuOs8NGmV6Npy4EaszDCr47/bxxzJvNy6g20FqrBsE5
	rL3IZRuEhCwSSjWVSKA7ECBvROh9ublKLVuRteLDaiUJf3YpexoPEEVdjhHBIr5l
	EVqXI56GASo3je2jY+r4wkHupV3FsN+Re7cWlPL9hhRd4u49WSacJUnbBTsvZHfQ
	qOfUNLzPOH7NCdM7lLFRocBDO7XmZTHRSujNRWycoR4TS1ExrysKbVa01R0a0h4W
	JifaSg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d828jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 12:01:20 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-567560838f3so1072420e0c.2
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 04:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329680; x=1771934480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcoxJfqP8hTwWTWUoRtoBVPz62wL8BplEKMyIUX4f8A=;
        b=d+5afWpCQZwcC5s07HiD6f3OxJKiY2C/uvHXpshP2FykSnnZnGl5wFtS4oNXzLdjIR
         SGwg7v0+QHiDtFEGPTHEWLY4GNe0ANunNPg5IbIoMhQo0nPvDSoiaU1IRAhKTPP8QkYb
         L1sS39nK55/qW5xd6W/+sk0jBXygCQkc3AT0554QIRNCywSkQbXAquVkwEFaqoohkg/A
         rjMhNPrfA4mHh3uoLZ10W6pyyolwWBheY7um6JqPz5omNpBOMKwNJjZJGh96dSRcNZ2L
         AE5mUIHB9LIIWv84MdItWHI3vtKqvyCCGjnms43TGi4sMSBVoU0JodiyO7ZlAkmt/Pxx
         WUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329680; x=1771934480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcoxJfqP8hTwWTWUoRtoBVPz62wL8BplEKMyIUX4f8A=;
        b=s6uq3w6EwOU0RE1ceov5gw2gs219aDKkk4Og5vfRBSEwbZKeZZ68Rl8B0Tki9dtZSZ
         CUE4R7uXBsbXnfrJ2o0hwxYHwy3hNbLIc49AA6bhA+X4u0WbkR9igq8+x67E6qr/QsI3
         ux4GMKC4ADWdVX6rrwpacqy3RW/RlcwyPyI80vT7kqcXH87K8HEY9G6X4AkTaVKN4vd0
         VChaU0sYS3nv4Fije3iuUiG1qXWlFrKkpt6EXfS+MFlYjl7idJSocwKuifbabl4aUa2j
         nWJjahnXGh9udmJiDb2n5Fwt1B0VeFhNPiYQBl3S/GqkdbZqi1rPmqbDIeR1SqHkITra
         8VYg==
X-Forwarded-Encrypted: i=1; AJvYcCWKfqW9CFvGbuasxoLEiE2o34GOils2iqLvC/4Zf+gBXzs9gG/mwEoTAlia9SjJ8xNqxvzO7lbqSA97YA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuqrleb9k9R9TSiaD2zENx9KDQPiHEZ9n0S1fom5APkjPP8zOr
	+P9zakmUByiiOyVbKR+u7I15s+//lRRNjPxIEaEg5+KuvZiSQzQZ2EdNSTtpc1XZeUzVr+NUnYv
	b1K6BdYWtcLGg23DoKMFD6tXQ3d26ygUH+rsMH25OC8TPO5DP7zDrHb3C+cTJpd4rik5wSMOeTw
	==
X-Gm-Gg: AZuq6aK1aAWEQ94sN3etYNRLUZk2N6iPadtAwhpasEk+Fm0xCm62tiIntttjMv5Tqup
	bVnyVWsbcGvKw0Fj3MY+jQbU0pDLDv/Aw4YwBIS5QmIkEJxmVj0T/j47B/P5FOpK+Ocx/klyZAK
	8vCZPBsrjmE1Tm0/RJJg7BhxQjudfmsHmhlE7HtAzEljuzhzE2PU57JKTaGV5YUBEIIjCMK5Kvb
	NJsytEksx2I0IMSVnNUlw58S/SfdFR0polCASMOqK0XPp4kbA7Um2H9IudpGmfnytTy9GsTlGEF
	LuZFpZOrtbZGnPrA8suj37ECpUR/nacgmK/MgFVkMSTRsbTtGtYvamt8v+QmKy+bdhxGEDoSOFl
	H0r2wgFAcKRX4UKHXFVVZp1s+rRX1sNPZAkuDsYw5Tk4oZyV+NIgErl0n6THvC0CIDzpmUQARxb
	8EowI=
X-Received: by 2002:ac5:c89b:0:b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-5676f436ba6mr1603018e0c.3.1771329679408;
        Tue, 17 Feb 2026 04:01:19 -0800 (PST)
X-Received: by 2002:ac5:c89b:0:b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-5676f436ba6mr1602994e0c.3.1771329678699;
        Tue, 17 Feb 2026 04:01:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d2dcsm351116166b.12.2026.02.17.04.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:01:17 -0800 (PST)
Message-ID: <124c661b-db25-466a-a163-99ca336a3e70@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:01:15 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
 <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69945890 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=fxqAw4-zz0YW6xlzh2kA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfXwkSaClTVLWaL
 DbGDhJiivaYYrLjpOZ3KTj9sB7j4jOm7tdeBWhkThbKUcNJa+HL9LvwLyitnr/YRwCyQ+zluUuI
 R1VVH1vnvlbkvrAruQ4OOwY3qymVhrD3uT2dWJk46/9RVB1Kje+8hOD9luXBQlAwdv7LeB78eGf
 eVf6nuTuW2Y3oeVWrDSZZ378HUhNoTRBA+6xayrH8TC4OQF851WxvD5KswRjFWw3C+jsAdW5vNB
 Init43thFmsfN3cy3EybtRALSQgNO2lXJ7HfLdU8tNAIcEG0R+3XWJnVQE4y7SK0FFb1DdmaVpH
 U2FOxyPf2IysQyp4Udy2CeodJO4VLvT11y7lCW0SGR/F6nMSbYYVtQluociFl/k6LBC+10j9shA
 vQqsZGYepwTZH93n0lkkiGWWjBDaFiuRjhGe94kEoJe/yxy3BisuwG/AvL7jgzTpAd4Yt0nwhAx
 xFxBAOu5zpviAOHE/0A==
X-Proofpoint-GUID: j_qlFkHKXQsKl7d0oxkeRNZpCkBaS972
X-Proofpoint-ORIG-GUID: j_qlFkHKXQsKl7d0oxkeRNZpCkBaS972
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170099

On 2/17/26 12:56 PM, Imran Shaik wrote:
> 
> 
> On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
>> On 2/13/26 2:15 PM, Luca Weiss wrote:
>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>> SM6350 SoC.
>>>
>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>> far as I can tell.
>>>
>>> Though when stopping the camera stream, the following clock warning
>>> appears in dmesg. But it does not interfere with any functionality,
>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>> while the clock is on, and 'off' while it's off.
>>>
>>> Any suggestion how to fix this, is appreciated.
>>>
>>> [ 5738.590980] ------------[ cut here ]------------
>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>
>> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
>> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
>> and keep checking the hw state)
>>
>> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
>>
> 
> The parent RCG of this clock is under NoC control, and seems like there is no vote on the NoC while disabling this clock, hence this issue is observed.
> 
> The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting is removed after the clock disable then also this issue should be resolved.

This is very useful, thanks for the insight!

Is any of these solutions specifically preferred from your side?

Konrad
