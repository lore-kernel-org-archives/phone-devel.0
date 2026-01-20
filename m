Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5604D3E9F91
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904321; cv=none; b=V1OO6dRr2ow5q0Zlaf/RTCysSiP1Pth4FqvzOkSsNwkM2q18wjlxKht6kU0dq/8vjIn/YKAUxmnHPMn0dkkJm4QQ5Zl8bHGURtsX6TAiUX7Qos0dRRox4vpP8EE8FEdf6u4zTgqS0od3t3z/k4pnKDJSt1A/ydUTFtbqQWknYjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904321; c=relaxed/simple;
	bh=+ndw8o9MnQLFrcY15IN7f0sz8uaiDSSo7gv8c5lzkg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jF6ougvm7LLG9V7tLv/K0rmfJamoyGFZMpwZwV5ZpiV6S6vHBbO1qrT4tBLDXLeP2DqQOFZw1RahZDmNvhF41+iJvEczHvwtoZxdqZMpK5RcUbpzVxrmn28fs0ATTyYyl1niLKKUuV4FglvgzSgjRkqpx1HhxXjrYBWOHq9PJGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYHaQ6kz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5HWmg4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYHaQ6kz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5HWmg4T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KA7lb83837153
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqVUtrCv86hFunh0dtnQ+VQv4bNBxhGa0iC2YY0bsgk=; b=YYHaQ6kzFpQaIlDP
	q6zuYlddDeS13LO1FK/zyWkjZvdysZkPVa3gE7zvhVk4yl1MHU3Tq0UJiZAHTGXA
	jLFB6tOWkuoXROFDHP0TgNdzUANdora7m76kW6BUH28LoT5FQ8B8X2Y7Z15yMMrS
	tYvxUghjddmxE1kbowS5KR+jDX5SkyEk47XaRxiNSNVnZKWFwY8N0iKKszjlF8+i
	vAjd6zjz1wWABWz4yaePFVNbRQOsuqtVqopz1dXSaP80RevMAVwgd5+BPcuYjiGW
	l+sC/SfSBimEDngaVBcIXKB4LaSUF48ePCQs42w06Q4Dzmt209aGYuehnh1Xa5HF
	N1pKaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt7pb80yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:18:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f77be4f283so12640341cf.2
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 02:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768904319; x=1769509119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqVUtrCv86hFunh0dtnQ+VQv4bNBxhGa0iC2YY0bsgk=;
        b=R5HWmg4T0kW9M3U31701HrnovsSEAazJoO+sDrp1jRAOfYaN8u/hb+DqizJSgzdKHh
         bXQHfEzxmD6DweQPgJmNUIy+1+3+bMEx9DGrrpV7XYwo6LGOjnxmRZhN0AUAYgyynjYv
         0QURwBqtFggZ0NsFtvGjoyM86OeKFrXYtnM2HzDxAj7HP1gLoNsKMxHZ9ojwTn2khdrz
         YTRqLMn0ORmI6a/N94fSEOyOaAN2B/n6luB97CPtuC/akfiRfeSZeeI2ebQwkn5KcrBO
         /qZMxezaC3iP+GIspl2I/Rw0ZzkWnDYOewBgqy8+OTuSMP3QXJlz5r2Mge2w5PuF1ena
         FBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904319; x=1769509119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqVUtrCv86hFunh0dtnQ+VQv4bNBxhGa0iC2YY0bsgk=;
        b=X3C+56RMVJyCgCX0TQW0AdZ1n3XeMttNiuZz2uuL7RCipkcMzY81Ia99R0iVBNivrc
         7sF3tHac8rHjI1T/zudxJsFg0ziBVcTTA2ptDwELFT1+B1gVpa7PqIfadg2XW9Ixs7A4
         6wAypHzfgldkE52Gx0cUt7jC7pfRMIYkCvx+ccziBPmAmRKJiwf1Kw9mxRb3RrxdSX2A
         Ks2gdLNXeXOH/8+IwD3Bo6gBicU66sZCCV2Vrjc/uAf5Wid7obBCDbwbkhoHt7OelpyV
         HBJRHDyvBljvDqh5qe7tJ47UK9yDqMj/jBe2F27snSKVwV7RHJEAvF+CPCSJe8I10zJK
         5YeA==
X-Forwarded-Encrypted: i=1; AJvYcCXQYJMTKfjRhnPQoHo/LYaYY/qqHqYvJOweGIpJUU80kVWn0RXg3eMC+/H+HEBcuX7tBvMDLOoFUKMBQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNdphL6QaMwtn3tZnDNb9LTWK7FFUEF0CtWi56HwiUUBLDaJM/
	kwUDwxg2+TjIR0WjbDPx0IkLOhav2lY18frLQhD2KbwP0EMZjzHitoeGvir28dXFSmX9cfp0/Bk
	9MdiIEzva3E52Jo3STYQuaHAvydgXS47hFJvLIU5B++jxPYIJz4YzOWPQioulE1I7XQ==
X-Gm-Gg: AY/fxX44cu8RpeHeOZbH8I+DjYXgEsqP/ht8pJHX6xhil6HtLgKohpXNst0txSxECVe
	srS3yg+fHQYo+ZXePYC2HgGKoi6cl1KMWcIQf0hsCV1qxDNIhWcoOqb3SQ6OYBwfuSl6aR4pY5U
	tfCYuDqBrd3tmiBZzf3mW9xlHqTQCh0onVtUXRWgY5t+pz3c/NC2LT4JR3EiJ7bqwx323GTAvLy
	vgvd7cZg0HcjJ4Cz+FBcSltgJlLY8Wu682SSGXwrYFgKU4vBC2m5kMaAuZOcxhUq3LrNh0Udl7k
	MOsZXcAzSobZtr4FnfKuIaoQl8j5Arn+8lyfRC5lalwqjorhIVeueKkGl+2j5EHo4qFeSdf7O+F
	qVUNSwbEH2fQGrmupv5xuQMJS7veGpxHghUukFo+g2swcSaYqdZ5geOpnGnQUgZyiADc=
X-Received: by 2002:ac8:5d8e:0:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-502a16520bfmr151401151cf.1.1768904318745;
        Tue, 20 Jan 2026 02:18:38 -0800 (PST)
X-Received: by 2002:ac8:5d8e:0:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-502a16520bfmr151400901cf.1.1768904318193;
        Tue, 20 Jan 2026 02:18:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce213sm13058795a12.2.2026.01.20.02.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:18:37 -0800 (PST)
Message-ID: <66a2cba1-551f-4f6e-b8f2-66524664c495@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:18:35 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
 <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
 <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OMwqHCaB c=1 sm=1 tr=0 ts=696f567f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=khr0x14q-FhmMLVjjbIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: pLaJZ4DW_2O5EpLe1tKfGA2sdaSiXZnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NSBTYWx0ZWRfX2rFplWpiwxlA
 gDuPMl/nX0M9xy9gU7ixFzJqAduTuc8wdTx85351qz+E18VUBk/YEAgnfyvqSUOdNjkD7pEIlhn
 TUzyWlJoXzl4zrugQXaAtJ4G/FHxRH/2stq6ByQxvVJJ3Fty+ne3cALwuAf91uADYK9CeNGfIku
 gqTSj+EVEZ2fpDwnDwWhzNdk2zoevj7bJfxZzgSABpgP8gbYiI+FWp6mC+Ov1RUDbBTSPLQug6s
 zDH4FdmykbBqB2JnlDWmeWA4LfaOeCdAE61G4xQuXCDVoerhThd0h4Mf0Cty44QTk27hbBT+mjT
 AMZygB39kvpg3t4/N+/Poq0JaGrhy8qqQvQYzrPZIVBHFMUVJ9PXWsHCQNKMrmRX7FTgdfHILKU
 qxM/O6eplG+WwsXFevL8ozfpWJ6pbG+pOhTCp6ZezHIEZ29bG5l+mYEQkyV1GPiEtUN7XLdmseW
 /uZ/J7rbgYu4AiEZPjg==
X-Proofpoint-ORIG-GUID: pLaJZ4DW_2O5EpLe1tKfGA2sdaSiXZnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200085

On 1/19/26 4:52 PM, Luca Weiss wrote:
> On Mon Jan 19, 2026 at 3:41 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:22 PM, Luca Weiss wrote:
>>> Add a node for the Hall Effect sensor, used to detect whether the Flip
>>> Cover is closed or not.
>>>
>>> The sensor is powered through vreg_l10b, so let's put a
>>> regulator-always-on on that to make sure the sensor gets power.
>>
>> Is there anything else on L10B? Can we turn it off if the hall sensor
>> is e.g. user-disabled?
> 
> It's the voltage source for pull-up of sensor I2C bus (so
> ADSP-managed?), DVDD for amplifiers and VDD for a most sensors like
> the gyro.
> 
> So realistically, it'll probably be (nearly) always on anyways. And I
> don't want to shave another yak by adding vdd support to gpio-keys...

That's okay

Let's configure the gpio70 in v2 like Dmitry pointed out

Konrad
