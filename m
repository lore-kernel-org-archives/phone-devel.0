Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308412FE042
	for <phone-devel@vger.kernel.org>; Wed, 12 Nov 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762939114; cv=none; b=t/8vHqAmMd4sOgizQn7/vcbL8lxtlD2h6O3o2huOw6+Q4ErSqV+M07mw1rMFtM7lIVIA8f2KsHwMpG09e0b7CVmSAKoMgzhlLo2KPB7KCL07DmW0ClilAVQ20p7EkBKiCghm4OO0X36Fbrl1UZW34sqeita0Z5P2jEOl2pKSYCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762939114; c=relaxed/simple;
	bh=U5QUgzFTz/IvlVLx3nP30IouyyraN4noTBTIRMQEoCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQpFo9Hatd9Djzt5JDKVTgZ+Y3HVDJMIAzzTljLYPArEWKLK/WN2Jmt9NJdxlkUHfJg1aIoQYrR0xItLyLt8jQfZ51wnqqjjPTbJ5itaKAvnS3zKYqxAq2YxECH/8387Rc23IpbBaPvJ/LfvIx/gun6uxPPiwKTh+giqIoTEdkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3mRdK1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbEM29D+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3mRdK1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbEM29D+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC8m78g2540256
	for <phone-devel@vger.kernel.org>; Wed, 12 Nov 2025 09:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=; b=M3mRdK1RR8PQNY60
	GweKj5OB6mJQfS9anE5lEstnPMnkr5UfAh/gaNwnTtqGpmGiCJMT6tcjd7c9qK4B
	n06Npwsl/bcr0LXw40fQGofnf/AHhZzy4R3Tuo9Nrv9nVGG8OyhuFgpjkq/R+UAO
	KzXT50zZ4T9qKdreR4L1xDAObsSajZ01aLywFE2KOmNeIPAZxLAVTeqURbCNphOl
	qWzmmjG2UuQHVbPiA0XF45h6XtmWFTNBcynHdR75QGuTX+UotG+kO2kDbGhw3qwt
	flYPbOPio5XHn4VvNlWJQWhX8hpC1KgIBi30zF+VUTudBNjFM26Gp8qIpij4OZYD
	2+S1ng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac5fgk62w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 12 Nov 2025 09:18:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edace8bc76so2112921cf.3
        for <phone-devel@vger.kernel.org>; Wed, 12 Nov 2025 01:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762939110; x=1763543910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=;
        b=WbEM29D+xUQc2CZ3jEx9xtILvtC/Aa003eDOM9qVKOimJlUxYNdRcPTzbf/WVO9UXC
         kOUExbWxRvAMODFxpRqU6gRVDdCaJKMi13l2fecb+q28LtLurBarzeGVZoLW4RS724mD
         xUoDkbUjpfLAeJGaWjXb/+w8UN2XwKew3GL6MSoX+86md6yb99aWRPPsRlgWRdnghAEb
         b9TcdA6tFctaehnPASvVsjEDpt4QWSgwtwUM99DKnV6x1TjS/0PKCDw4cecHcLZ/dOR5
         XU+/kK3yzo8XC0ljyY31MhFxLGXknJSKI2OHLKk74at4oBct/fJtwIAKi56/QnbPm33C
         7wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939110; x=1763543910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=;
        b=C5sOho5t1cnR4JUtYxndp20R26kIgcxieMVoAt1GEQxZUhm7MhHRo5XAijhI/8OHGa
         ACiikR/fPKyJpi8h6y1mOsVmkGOhu7m/jLL2UON4KTi4veH6WDViBd6lH6aqGatfl/qb
         w8U78Tx0Ci2T2i1PFR6EnIG4mwjEpHQM7W2yIXDOkR3olSdwWKBXm9zVRo2RGLMZ7Mmp
         jGqcZA9PJMQYzqMaGCD/mycf+zpq277LfguExp6mlaSGQ+k3eEesjMiwJU7hR+nqbtq8
         7BarnL9SbIyUh6kZRCwYbs056Onhj/tGvRBdBSnA2GMpRNUbUh6s6uj/o1Ria3Lj5i4v
         dx/w==
X-Forwarded-Encrypted: i=1; AJvYcCU+vn+UbtQQ2z60a+P4gtThZQJSHfG/l+lkK4VVneWEW+OsOSL49LnJ+YTZmy6IjVvIeMiDS9nrKa3s+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSuKU+Ot43YxdOo2HC38sfgeYt9iVn6vKUxVkPVDrDtulUXdSh
	ya4q3at9dhHddI0jktBepm0GzfwkxQlprhCqXO1RZDnouLvl4hfP54BCZeo1lLlnUJIysC2dmLE
	SLMfBufesDvSTyP60zaDTZtKBuwBwRcAwaqUOYYZukLbko1ezayg6xLq1iLfCRRtsdA==
X-Gm-Gg: ASbGncvhrjSBe90Kd2zasMtKVNqL7HMfy3PpIMUa77g4+UM73bMhj2VG1mTpIfoHftd
	UDZVk9O9Ubq4kyx51hukoL+DezqHXbJn6RpsuA8X/D42qvpwf8OerjmjjObY3N6uSeu19Wfq7o4
	FMuFulXcsm3CH2MbEDGfbdSxnenqN6WyTl2X5urmn6Iy8xzoEN9FMvy0KEQje1PJm9u1ld7C9zM
	GWY1LB2FPWX9xTkSfkQAyA4PcPyDMUev9kN/gj7c2GlbyuV6fYYdVR62mlzYMyeg5A8Vwv2icJe
	Ev2PayoGsUtxxYWKAekSGeh5qUh/BInemwjs4eAefDtxaIk7woouB+YK6cF7GxbqevUnzSdJbDz
	NO+2iUYGB/49maPXogqdxKkOwBNY97U12p6xIKrir2s7d1FNmfXoFP6pU
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr19582961cf.0.1762939110387;
        Wed, 12 Nov 2025 01:18:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4l5nO38ZbTUUbjYXNEyin+4V4OUbwvGEdR+rVes2WfMKu7BFS5vDlEA3PIIQEduH3Cw7aqg==
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr19582781cf.0.1762939109964;
        Wed, 12 Nov 2025 01:18:29 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d43bsm1618141566b.45.2025.11.12.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:18:29 -0800 (PST)
Message-ID: <a0c267b3-535a-4f38-9a9b-d7b141b8fc64@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:18:25 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: xiaomi-beryllium: Add firmware-name
 qualifier to WiFi node
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
 <wxvtfyfdso3ngqvnhvryeo2w6udoolfp46smv2r3qny2cl7n4o@iawxfnj7qtrw>
 <5c6a1434-1f43-4434-b6ed-0c5b98ee8d2b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c6a1434-1f43-4434-b6ed-0c5b98ee8d2b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YErODlP1tw-ozhyfNY7r0hBrAELBU8if
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3MyBTYWx0ZWRfX9KVZiGIvH6Ff
 sQVA941p+ZcG1rshGAJraXcIaDZl4+Ws8LQn3g81uxwaYtb/iRQm0Pdvcv7+aI9MdUBiB9ZQr3q
 KaedPwrZ2PIGR4yL/7fxBCNocxYcNIHkn2YqA2H0JsHVsfI79Cu5ncX+p9r38sLcCbe5+r5gQ90
 hi69vCpXKrus/craZAfxPFh+o2Ypj9NyEZ/fjWtLVf0DgkwW4ovfPk9e1ZZ5GmxSY6diiu6WqEy
 5ia8LBA17yl4VQKO0e7KszjTLiNs8M1DfK3SOERY6q8ZrUCRTESpuE80AkqLSIF6kFrfMW56fGS
 ZapitiLRqxkEcsphAvVWc1iUZG+9g5xF4ABfIyaK2UC+iVG6Jyu4koDs/xRj+jnqTOHo4YdAxob
 MfFEnYF+J3I7QkX8BMbiLrdD17yb1A==
X-Authority-Analysis: v=2.4 cv=B5u0EetM c=1 sm=1 tr=0 ts=691450e7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VEnwf-grGjUPgLEjvqIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YErODlP1tw-ozhyfNY7r0hBrAELBU8if
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120073

On 11/11/25 3:23 PM, David Heidelberg wrote:
> On 11/11/2025 13:46, Dmitry Baryshkov wrote:
>> On Tue, Nov 11, 2025 at 01:34:23PM +0100, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Add firmware-name property to the WiFi device tree node to specify
>>> board-specific lookup directory.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> index 785006a15e979..9b0b0446f4ad3 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> @@ -631,6 +631,8 @@ &wcd9340 {
>>>   &wifi {
>>>       status = "okay";
>>>   +    firmware-name "sdm845/Xiaomi/beryllium";
>>
>> This wasn't build-tested
> 
> Sorry, I wanted to send it more like RFC to get initial feedback, I got user with Foco F1 who is willing to test the changes, so I should have new version with T-b until EOD.

Nothing in this thread seems to suggest this still awaits testing :/

Konrad
