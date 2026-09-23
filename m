Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9035A4EE85B
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168724; cv=none; b=FYPeCFlZOUwO6YityPicukgryKAJLR5S1BfIp8l3i1uMRgfuage3qWtwzgEYKGVF+L7APsICuVBtkIsv+CIuw90+wRR5f4uXwU3MfHyWnPP6cD+RrOGWcaowlHNNizK3Km/gEAPDtakPzIuqYFUJ/l47SLnOPU3c0J8ssPaxD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168724; c=relaxed/simple;
	bh=5JWwbmm/sf9shtpTQDKczj3QCEB9Gx1ej9MKInqgKCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ae0Vl4pPpJJDA1kkQNP0KM6/Z4QeKQbLYxQiynKM92McCWjDUR9G4qAZ/szUm/+liIbl/d01f8pxLjoGzOZVinqjvopdbXV/ltQHrYFJoXfAc+JJR2jv44/NvZDOEKXRJ6VWuF8wjyDs3yIJAXhhzoDq/O7DM1nN3UP9sKXAu6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh2Y9rMg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UeMqVDpa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh2Y9rMg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UeMqVDpa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVm43616420
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 13:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=; b=kh2Y9rMg1MzLaEaA
	5YmavkJWOssHX4hwEgR7oz71ODR5WgwLMyh4HB2pH11vU9L0lWNonxm2PUK5mlP5
	5GCYL03LQtboAilKRZIwtsZrC8wxT8poEpcAzHEA76jSScl2cwqbDnkTxdMVGL7W
	5jP4hwavIwWDxhGe3pO14ATVB5q8TxFDE6Wv2FI2k9UH8K1wW/lzZUosFsClyQJi
	60lb5M92vRlMnUziyg4NkITUW5Xfel2OGF+gHcsD3N48geBAdhO2tuT/MCs84pDz
	B+t5qjUwgk9tzisA/3Qttk5ZvdOBGJ9mfCEKlUHe1+EdmhafZwHpfUUuXGjiJ46N
	CC2JvQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux864g3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 13:05:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so64957e0c.0
        for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168721; x=1790773521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=;
        b=UeMqVDpaYXs/riIKkgu9ujumRBfvM9LlX74Hzi/PAz2n3j/iQfMsSQJIrH7i6XczVr
         c3iICkMQGZKvvtRxyhdaZFHzeivK6e5vO6NWRklfoEgvZqfjiXuaSAymP59nb0gck+Mz
         2c5GMXvRScp8mSh/lswVALDUNhfXsxksJwkGZ8wAFtpklRxAeeWmw7TF/5l29NxkksKF
         r50kCYmIDCz4lhShCaPz9HR/9PTpgiQzbKacHyBe/kNucJvMkVaKAf9sKTiq1H7kfXb8
         EYbfqNrecu4GD0kFTH2fkmtxQwyrK755+hnjHypYf5aohV+HUL6qKblZ81b5KdIO3n5t
         7yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168721; x=1790773521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=;
        b=FTfzCDGFpUzbUB+4/45KaOH90ymdLBxOG5wMOatAy1q03rT87fkyBiR+9zWxJ7z4Bg
         vSMQI1zsHi0Rd12rTe5KGm4Hb/l2m4bO2spCneU/95lbh2gLQ5Rk7dFkm4xIS6ykkHVz
         gqE7s5P9ivYc+G997h3WrkI9YyfIDIs1sciWBfo41tdnA1VlfWxrhyJ1mVmhtxDIqOuR
         X6j7NP/Sx8uqKACaEQvcLQVk9aMAU1LGhwO+wcw0uU+H6vkOWOzPLruBrrWrtk5EbUZ1
         TSHGIPWAcZX4EWu734GmnUd4M4y1QzYa+u+46vV83YLqPxmww15uULJqZFQ8guIZLPUm
         Xgpg==
X-Forwarded-Encrypted: i=1; AKwUvBxKDU1nvMCE6BsGlvoAMC5hfhLgYzVNO1qAVki3bYBrqQ/x5saQB9hwez4jJP5glAv29+MwK/8dD7+vCQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kt5hVkB3EEyQ5S4JsDLCqlKsnQplSahskPeXl6HafV4l90V/Iy
	gccsMC2yI5R7pDaDKPJFwg+fbTt2CrXYNKw/8v4i927aoVyRpKvq+CjwM1CxIwAu4RmlNJ/eH1F
	5gSdzkSVvbIHDK6ohDjmVK00ydA1jiA2vKrMV1TXkS5Ih8LunRdDKaSBbsb8zStCaKA==
X-Gm-Gg: AYBFou3HzbEJ1geY+mtC3NF8bOo19Iq0tGqSc887/8VejMmrCaX1FYyXXb2r9ajY4bT
	tpOchxL6qXhCBPVvMihyn9dAUnqKWJOa+1pzvkwVWDr+P0v8urX+mOJUvde2As+kES8LDLu0Qlp
	9Io41U/Ve7c0kz+wYrpYys/bj6pNHJLTXftGqPi1g6Krb3HVsbyjrEgm523kFt+PhzusgabFOrH
	3NRPyrS6mueTBKy6nUjV3vhaG3aVYXoM90YSMuN+EXRuhKkrSbSGXFu+qbKYAxJ7QnNLew57oQ9
	GN5ZWwXgrTlw4dMZznViFPG8HepOylb5CDIRBzrTGXJOzuFq9OZGAYcEcxDfNlffAh2gchGRbdt
	4cfKKEhW36qeJtLqrXComrg==
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr383246137.3.1790168720461;
        Wed, 23 Sep 2026 06:05:20 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr383203137.3.1790168719825;
        Wed, 23 Sep 2026 06:05:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae62dabcsm115831566b.31.2026.09.23.06.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:05:19 -0700 (PDT)
Message-ID: <f71f148e-bbcb-4999-9669-4975fc989c0a@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:05:14 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <c5773a71-e7f0-44ae-8418-1e00de16d08f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c5773a71-e7f0-44ae-8418-1e00de16d08f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BWqWOoiafUYZ5GzOXQrB3sxihcbGAEcZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX7CKUbNkCrCnZ
 Xh9ISkIjNpvlLkT/StLy+GqJPpOb9z6rRb0wtTRiAyF1ry5Oxr1PddZJ8Wc4HYP7jYkGvu9og1P
 +zL7f8DmZHTN1pRq2U4Zrvcu4lvE+/o=
X-Proofpoint-ORIG-GUID: BWqWOoiafUYZ5GzOXQrB3sxihcbGAEcZ
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3ce91 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=-N33akl6Kve4PNw8qKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX0nJFRbQtKdPl
 jRhHh0GVBtOCQnLiocZqALPTgieUDvJPnt1VRCV42cp+mPnhMabFhg6vJlQ6veZOUICi5oFyJ0E
 R98YRER4P2qMRjzLs66kzwcJR2EkgPPSFe6DLuQ5dzNSDTulwOxEw8TumgaxK+DA9PECHNfHk9c
 WlDLS3KiqsrmV8+i41u6Foi5PYBKyZX6QeUAQdJpYqSW6iz3rne8ybpnWVMcGTJMFo9UHi7vL0k
 TVfdLvmdXZTycxT1rgV2fTU+0QxELCDYS6biUIfyyG+hRYmskRv8d9EY6Q5f6+4gRLM/EANT8jc
 AbCwYHEx2cjZPi7LXcum5D/7v5XMSUWl07Zscv7oJbul6+T8iOp03RqWkA09U2DMsS45jJP7Kh6
 XELZ89ureCRvF1N9PUo3fG0xibibRKxbUpJewSdbvjsEcbHn13va5JtSJVB9aADpSC4OWjZT61S
 t7+m17EvMJ1lWMvXPYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On 9/3/26 7:24 PM, David Heidelberg wrote:
> On 05/07/2026 22:06, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Introduce support for sound card and wire two CS35L36 audio codecs for
>> top and bottom speakers.
>>
>> Inspired by commit from Joel Selvaraj.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> [...]
> 
>> +&sound {
>> +    compatible = "qcom,sdm845-sndcard";
>> +    model = "Google Pixel 3";
> I see some new nodes using such as
> 
> SC8280XP-MICROSOFT-SURFACE-PRO-9-5G
> sc7280-wcd938x-max98360a-1mic
> HUAWEI-PAK_AL09-M1040
> 
> is there is a preferred syntax?
> 
> I would go for blueline which translates into google-blueline profile.

Looking at

https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/Qualcomm/

I see it's generally SOCNAME-VENDORBOARD-FOOBAR

Konrad
