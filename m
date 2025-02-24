Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39813242909
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428845; cv=none; b=VbTiYSGhRIANZeooKUZkEl84ReL3AXdHSjB2UusGn8j3Ar9q5w0cwBKVPTi5tLQoZnus3bB8uQl5lzMLy6fwJw2D5dVdHNzEd22ALfB+WpgFKjG9/u5rdxhS8acdhq3VT34Vo8bzofz4vypYecKAIqEKzuN03/mQwySdB5eZIlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428845; c=relaxed/simple;
	bh=VznEzXTNU42ddT4wxfYglEixBZX61SNeGSbkxX/CgPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWJEdAD9e8Q4to9n5tFJ5kysCnypeXi0fI6obiisjsPVYKezyXo6gkjKvG4q0Obe1LP+RUj1CaYsowL68cwVzgA2iUTj4bZzvhr7QH419ViEf7MbyZTx37AhAVJOxdjILeFM9QTpU8r5+GR0eFnS4zkkQWcP3QZ/DGajvXWWjYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pp0p2S3i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pp0p2S3i"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OKOxKE032187
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 20:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3AJ4m7KBlOuSOpyPe5K7xkoXZDmH3H55Z4ePCDd2A8=; b=Pp0p2S3i/U7h+1kM
	iBMFsO2s+uO1mabwQh70gcSoMet7kWNsg9rgb64B8njTrs86Lh8vwUbQ9Qq55Ty9
	c1eUGd6446Fwymq0AiNaKo6pm4i5ejSFtJGQPAS/Ar6eOvD8pNouQsVIkQgdWSnV
	I40jPYzK5qaJ3Z9AZxBlJKVM16U1UtmU5JajaKQ2qhMaGwi6s/eVn5HIAFhYv/Q+
	A5Haljs3i4rJ5rUK6VxbZXqiuqhsFljN2HoedQy4idwvk1EdXoa9sgX/nGSTtnEh
	EyWDkIz6NaednKc1zrdGscQf6CVPVqExkdhkLOYE8zq9unMGGXpzFsMlosezKc3z
	e9Tjzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6ntxfak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 20:27:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c098c6c0caso111294785a.1
        for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 12:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740428842; x=1741033642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3AJ4m7KBlOuSOpyPe5K7xkoXZDmH3H55Z4ePCDd2A8=;
        b=eDUhzJ89dSgZrZ/B2Emej1vBoT9BrZQjaerm9P5pul+Szh+H4GSlXKxAtpRruANeru
         pD9hf7G38rlx0U/F+w3M7l1gBxje43k489tKvz4xwHNrOnjHz4qSTY3ymDvklN7SKc8e
         OGXp67jBt8ey51nu5BKDbDwSr8tkNAcIlsBhA2lWUSnLiBXXLJB78aVT0+kUTb51LxBE
         RlcLuj830osJe/4GlEdjvKXBrOwVpqWYEAMzU2VJGBqcq4DmvF9pKnKHkD6hNd6ueuS9
         A6aiJEcBC+4qRGmRUdUtAIrgYTHe9AYXvxO0Qu56wuG0f8L5j3Cl8q9IsAHfDCpv0VRA
         mPog==
X-Forwarded-Encrypted: i=1; AJvYcCXCd58uXfsF0oPioZ7SowJd7FRgnrkhkMbE/nliUQbCDgZhd3I/lOHvDM3ajafnYjFIDcObqJd4PkrYUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1xVBeKG+DTgSyHEqlNdKngBUAFvFr7str3NJZWSxYImlGAfJ
	EPx4KrqWg7k0YSckRmPkonogc4Tvs/GZdY11tNCfc5LIECWdrJePxznl296eF/AYIAi6SRMtbt1
	xXVBMaqJnQlHJPnOfOT9e721t1LEvLKJRfHBwEy+H/7kqcWg8FeNl8a78gJp1uA==
X-Gm-Gg: ASbGnctAyQFtW+KVcT6peWQEUyzXt3rMCAeVhhX/Skh3U5XzpdScErxNmxKeDULi2QO
	UN12B0giDb3+3YhdRQLVrIeNPYcc/wSwJXqI27zfYyejTXKuAqZcw04x+G+AvAw0sfQ1+bKtYau
	ScCqqfJCKO8qd2Eb4FjVFy7vUdd/kFjq8I1JHUJHFy24ywC1O4K/RlQUxB+Wp7JneNazB5n7p53
	K+ohp0NO8ZITfdo67rQvB4nZaPFNxqZvjYguz8GFIf51peFJdRiImn1MdVwUamcaOM5nDpVky1T
	qTA3xpZpHW8fEORu2JL1q6tV2DV677yLb7fiSzUMRGEJR30VFWxzpH242vpB3xEayeJVfA==
X-Received: by 2002:a05:6214:21ca:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e6ae9a12a7mr68994906d6.9.1740428842300;
        Mon, 24 Feb 2025 12:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEGIu0hTDGUdMHGJYXVXzWBQqkQ0NYTN86e+GcokshmcmZHhKJUOF/l7Lss/BuFaMNPTb8VA==
X-Received: by 2002:a05:6214:21ca:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e6ae9a12a7mr68994666d6.9.1740428841949;
        Mon, 24 Feb 2025 12:27:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm18357266b.56.2025.02.24.12.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 12:27:21 -0800 (PST)
Message-ID: <6d1a95a1-0b84-4bc5-9cb0-3cc514d292a6@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 21:27:19 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 firmware-name for adsp & wcnss
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>
 <w4l5drhu6exq4jb7x2pisqtkz5ylare7ashsmjjqomv3yetjwj@z3wapq4rkk3u>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <w4l5drhu6exq4jb7x2pisqtkz5ylare7ashsmjjqomv3yetjwj@z3wapq4rkk3u>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BOWni_q1rI23etilhyh_y1xwKXcHjb0i
X-Proofpoint-GUID: BOWni_q1rI23etilhyh_y1xwKXcHjb0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_10,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502240129

On 24.02.2025 1:17 AM, Dmitry Baryshkov wrote:
> On Sat, Feb 22, 2025 at 02:00:49PM +0100, Luca Weiss wrote:
>> Set the paths where the device-specific firmware can be found for this
>> device.
>>
>> Fairphone 3 was shipped with secure-boot off so any testkey-signed
>> firmware is accepted.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>> index 08ffe77d762c3a97f470efbfb5064282fe2090da..5611209dbfa41d7834af7903535ed3e05604ba63 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>> @@ -82,6 +82,8 @@ nfc@28 {
>>  };
>>  
>>  &lpass {
>> +	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";
> 
> If any firmware is okay, wouldn't it be better to use
> "qcom/msm8953/foo.mbn" ? This way if we get any of the firmware (yeah,
> I'm a dreamer), then FB3 can pick it up.

No, the fw may have board/wiring differences encoded inside it

Konrad
