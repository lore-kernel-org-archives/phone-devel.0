Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7044333EAFE
	for <phone-devel@vger.kernel.org>; Wed,  4 Feb 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224167; cv=none; b=oEHBXKGYCCNeH8d4UuVXDdEJXW/1ck9icoVMU6UFw3oJGPGf2XeRSLdb8H9b096cAiv/PFB2QQhx9Dwz0tOanEwNUSo4JJ5L66k8TOIfjlrwimWd92X2wCrtUXlE+WYsO78Wbdf1B3AkVR71a2VLeBdExcpVBfM8Z+m9xaSnqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224167; c=relaxed/simple;
	bh=gic3rOmdvD+fIkZwf6ImOgaQ7ET4HTPv929Vj/LuWpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmfZ1P9gCWqRfKrnQmiY7dhtkg9yZfxhAdLzBHfCoq8CVrrbtlNCGIpda4gajTqObZ0gCCp8lx4DOj4iktuPMH2Hfbh5JFBomkrcS1TNPivfClrQ5NLpsiFehygvFg2Zt0I9T5+SqmMRiPTq8LVKqgYXX/+4YditoSQEVc6j2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZ5Sj4Td; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhlFMEg0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZ5Sj4Td";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhlFMEg0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIUXk111332
	for <phone-devel@vger.kernel.org>; Wed, 4 Feb 2026 16:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ctaa6AYEkIPAmYh0W1CZ50hHg8Ta3lIzdnbrnHLrXyA=; b=bZ5Sj4TdQmTOlyUz
	yMPYlVHZax92tMA+0oDPugZR9tYFiPucZ4wTuVydWtRkwImTu2ivUL0VBLkQJVEX
	CPQ/gfoeK1esYbjHd+Y9XUUhUvuPvh93fkl8mPc8jhjI+UnwxwcHrl4IzNoLAm2X
	aFQonjsIOd3o9J4/of8Q4R+KxppJXUrfJgroq9FcfNt88DacP2HnzO4N22DCgLuG
	KM2rkHwtPI/Mp1DKlyaxduBl7OGnHeVyPMdQvRV1srpvUKzzo1R+SCvBM8TCKG/H
	5OC14l8RfErhzB0piFjOOUE3WYhcvvFKVGlpJhBdk8dPkcqAPP3o9A6AxSx0ZyV7
	MnlXiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjh2ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 04 Feb 2026 16:56:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a26989018so200106d6.0
        for <phone-devel@vger.kernel.org>; Wed, 04 Feb 2026 08:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770224166; x=1770828966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ctaa6AYEkIPAmYh0W1CZ50hHg8Ta3lIzdnbrnHLrXyA=;
        b=RhlFMEg0I24E3vPx2RgH1yc72ojKOOGJEA/DPRegd66OqlCO7EwdP0hj/o5j5t3nYK
         9For4895fzY1WAeO3i1VcJnIEakfQXz1cQr/d4F9OsdtwVeOHguA7UeOZNO0Mty6lxQW
         OP8QwqvmQ1NNTta1GXFguHopeClX+b0lebJet8tP+Q1iIUpLuJ66gWdNEnGSf0nGVvUx
         EpsDULOUpIlqscrfbqG8VxYfSzkFTN8WmhKLTN80gbyY30pKImOhP+AgrNJbe/syYXDk
         YEaxSlEhAssRBqOb5zJ8nvhsNI9cGgK8Ra+PslmbmBBXHp9L15NgiiH+7YDrwqkYbo1Q
         +tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224166; x=1770828966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ctaa6AYEkIPAmYh0W1CZ50hHg8Ta3lIzdnbrnHLrXyA=;
        b=H+U3qFQkGVUX31tRsiloWKDIKeIoW/Gd1/pDahmhJy0XnRTLZ30nhHsvfUhp3xDTqL
         BpExhbN9bRVUkDF/3XN9Bkn0Wjc5lEE0SmrgA3U9QUxvYy0sRuY3+AnmJ9xqTCnVezAr
         9m6L07RQzLCteGu6+IWUSukcrrCIQbULs3adgHElUdBxVbBm47AFS1kS/wwe0mozruh2
         HDXJfEF2Phs/LdTxNDy09Y0zc3IqFKT/G3kT1eO9paDdGO8aVnIAKtRL66d8oq1LLhEK
         EtEPtHgar230wiiV/wgxIDm3abugio5QNAoNkYHXkYuoZJpmeUaGi3QCy4GgG3GPpAa5
         ZN6A==
X-Forwarded-Encrypted: i=1; AJvYcCU8UWSnCFbs1NkyqL6oDdLcahWI+HYubunTtAmiiXSlNiUXXQfnhtvszqxdcUrrBu4gCYwdn1nfChtl1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/llRb8FlvH3gTN/ajENJvUbRdHE+8eUrPTKfBmwGphxjj70oV
	19sbP/v9JdjX1qe3o0Yk7DVDIVsC5X5ibp4ab5dCmIYoLLqkGOH9eUGn5koNStxprYw1hPGldvd
	UIKat6KDvWGif2JIRrDVWq/gaxI780J++k8V72SiOr4kacmqMPMlQKamtTjklgWDJ/Q==
X-Gm-Gg: AZuq6aIJyJqdNd0sd+XAJWy9xLDrYEFA4FBbvmRieTaS80EbHKDRiJ7rT0FrijATiOC
	N9LNyAihnEAdXMTgbMBVwRQTk4thpxX+S74VH+pDUumXkr79AKyZYLfiVD0Qk3MSx1SUhsTspt6
	JlJ/m7+wUrOFSZnMhJrqxtMpcipwIrDKI8k5zZ3moyacM2BTXlhUqGRISqRwwYbKqDCJTwTfQTi
	vfV/PFyLCdkvTtrwy01X6Hm3O6CNDN86wJrRR9yHBEqG1AAE8mnRRMDOEQ2UL/HYphe7oOOXiOs
	MzwY9ci5BsjJ8J4yKlYHbhqreEEt54jDsm5ynP5wIV/7MYjxCpjt34041C0ibdYRgvOXXMvuiy2
	dHwjiKE+2z0Ge1vVVF1YJULP78yf39jqCTCToNs7Npr0J8L1rwqeoMppnNZCrsvhL4GM=
X-Received: by 2002:a05:620a:1a20:b0:8b2:df32:b900 with SMTP id af79cd13be357-8ca2f845a45mr350580285a.4.1770224165734;
        Wed, 04 Feb 2026 08:56:05 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:8b2:df32:b900 with SMTP id af79cd13be357-8ca2f845a45mr350577785a.4.1770224165260;
        Wed, 04 Feb 2026 08:56:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949ed6b7esm1362084a12.11.2026.02.04.08.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:56:04 -0800 (PST)
Message-ID: <1ddd2441-cad1-4927-b0bb-cba06f8bf084@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 17:56:01 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845: Introduce camera master
 clock pinctrl
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260114-sdm845-mclk-v3-1-c9351deaf4f2@ixit.cz>
 <3b27d707-c4d4-4cc7-94f7-f29c2466ff19@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3b27d707-c4d4-4cc7-94f7-f29c2466ff19@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=69837a26 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EV1nOL3jx1njoq2n4ikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zmhVM3iLoM9ylnU7eNC5Hfyz-Ph5tN-N
X-Proofpoint-ORIG-GUID: zmhVM3iLoM9ylnU7eNC5Hfyz-Ph5tN-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyOSBTYWx0ZWRfXxFDv2ZyGUzKM
 kKpYgkSVddSfU0mNHSq0g1mwezd1RsdR0VGbxaN5cld7xK/FsRugopkyYcKEMoMR8Rtaey1y9Cs
 hso1f82zdARovadSCSpU1EGkSVFcnYt4uiGK1/N5m3YAbpRCq2e+DEebMhfsQFJUt8Q0xXSwYI2
 GSjxNdVthWR9vmAhAC3LehUQaz5OP4ruaSsx4BBrTlYmW6O7m0YjXxXM5NlHuBBe57OyN8hrRlj
 BjjwKh88LkpOvTqd04ZBcbKfKMnEBEpTomEbo5HjvKlgq7399WMQ3spw9rqAdLc/MkaLAYcM469
 KSeLZYGkgD7AvpAD+bdUa380An14XWkWE/JtmPzRFlFtpInvP4agXCjuPMx1ULmjYs1NKmeNGyX
 /3adKKRdeEYt6zGf0X+MJ1/n8B04eOhHCZ90AEt2Zxk1ubOtB00eiIdXFXHtN6a3QrI1hPXsfDB
 zCiWIgtfATygkWYhrGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040129

On 2/4/26 5:53 PM, David Heidelberg wrote:
> On 14/01/2026 11:08, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Put clock pins configuration for camera master clock into the dtsi.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> Inspired by Richard's patch set for SDM670, I noticed that SDM845
>> follows the same pattern. This change prepares for enabling
>> additional cameras.
>>
>> These pinctrl settings have been verified against the downstream
>> SDM845 kernel.
>>
>> Since most of these are not yet used in mainline, testing was done
>> on sdm845-next using OnePlus 6 cameras with downstream drivers.
>>
>> Thank you
>> David
>> ---
>> Changes in v3:
>> - Dropped 2nd patch
>>    ("arm64: dts: qcom: sdm845-db845c: Use pad fn instead of defining own")
>>    as there is no documentation or people who can answer questions for
>>    now, so we can move forward with the main camera work.
>> - Link to v2: https://lore.kernel.org/r/20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz
>>
>> Changes in v2:
>> - Added mclk3. (Vladimir)
>> - Reword commit messages.
>> - Corrected commit msg name. (Konrad)
>> - Link to v1: https://lore.kernel.org/r/20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 56 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>
> 
> Hello, reminder this lovely patch exist :)

We can only follow it up with a reminder of the kernel dev cycle..

The "merge window" as confusingly as it's named, is for Linus to merge
patches from maintainers downstream of him. New features will be accepted
after rc1 drops (circa 3 weeks)

Konrad
