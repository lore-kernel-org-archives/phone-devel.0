Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3858535B15D
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477347; cv=none; b=retzPt3weH4auKcYPC3oB+WPxbed39cRR5kjB+tYeg5vIAT5IcNVl3U6CD/ryIJzMaZookUS9TGXulidS8BSgaSx2ShtKj+siSdn+rBtxv1vu3qvY38TanhEDegkDboge3AX6HDfRg4YpyiV8a7ul1rpsouyXAVL/71l2oyHJKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477347; c=relaxed/simple;
	bh=0cml0rnk0Uwz5vGuT0N6RVpyBdL75FaXQOzj6ISDrio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpCCDJwm3xwZuy1RSkbIAJCwMdh93wznvVIahSFLP3HIg1QQrWyrUAcPb8xLEmaOQ1cxd8P5wRE+3N1DKpyMR+aTWmFJkfyCeJZk0TAjf8+AaKHMxoCC0PE436wFFEnfJECr80Eo/A8XQ68K4ShzC0MjxHziotrQTK7Nn4N3zDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkJrik0F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKgUxq4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkJrik0F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKgUxq4O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICB3Sk2803486
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqVucf6VKd9stWpBFdYgb4rc/AtI1spyTRvrZdXaVj4=; b=JkJrik0FahcA53+0
	uV0cbu1TKx3dayDzX/nMfY0kL7TIAXLLjll6JunQWh1Ianu37kqw6iq1L/jSV8kd
	ASiFUVZMcKwc94NAXENklNZff493wrxQ3pLh8CvDCtxsYT+r1LSGB0sPgcukXJ7S
	ipkQqp/i5RtCdvHqY0vzBYrSMlDSen8WHcs8mIKItQLSCt7obTmwaD/vbbaCv72G
	Ao0HuPBHntnkev/gc0XOLvXPy1IIkCGSyUC/oh9C3c3zGW+Yfk54mSj93WSp5Sb+
	C+khTjxR5XNtHTHv9Dw/TOYsu8syBRCmvWJZKEJJnk0a35A3caaSdl+ruYWzG2XX
	0AmT8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk20d7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:49:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2fdf3a190so42946585a.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 06:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763477344; x=1764082144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqVucf6VKd9stWpBFdYgb4rc/AtI1spyTRvrZdXaVj4=;
        b=OKgUxq4OeFlAqL2h/gAXYaEJyw5QUhcNKQJiTsWTrdSS00bgLlsB81q2JltzvYP2mT
         SSMNwE6Kz9JMk4S19wlk/FE2IzRu/+tLv4OFTTWfIkSIBcXD9I7bpB3Hyl2d/LtvlAVz
         shoijn8rTJpNycF1DgX8M5epxq8Cu6gNnmP438BOqoUUo62UzJzRlEplzzLcb4gxUdYR
         ydQ2+FLkxvha/IhdsC9jl8UL9mF3etAq3e5ZCDGuGoo7CXiwSEMCiL2ve7jSHhdFZuD+
         UnnFKnvZjWYOYipWp8FhVdphyGsHTcmRe8L95z9ept5hofY3tKSZtbL4yLoU+GCzl9JO
         EpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477344; x=1764082144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqVucf6VKd9stWpBFdYgb4rc/AtI1spyTRvrZdXaVj4=;
        b=pv0Bto6hv9+9KEBLsoBeUZICtDVxWWLi37/MGRRFmT1LuKOt9UZHXJnILZu+BwBxtS
         +Al/kNPVhLiQ4hLes8/5a7wqNiWKzuoQBQHwecLMRsl54wRjA5LVGkt4FdBgxL4I0khI
         BFwOnPR1/xcNd0DPJoDQQ8JuNbN/FB6HyLw5fFd9LXsYZtQ/l92g5OtQvXcEkXE2WLOB
         t0Kkb2ORXGsSJ6WgnWcf8WKiEH2+REvbhh9EvifJ4Tdt3x4xOP3r6+JPeOlAKv76yqnj
         3gt/A/d3a8m2KcCtN6v0aAHaRUSRu5kmBDy4vjb/xOW1ZPCRgwL6m+SgsQVEPCU8QYjB
         rvkg==
X-Forwarded-Encrypted: i=1; AJvYcCWqa2tIvpE8eSyVBfw7MffNNiqngdC53ksQSueafYGTWIpvxCGKL+tZE+m79zUHNfpypZCdCg684SM9Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysxWhz6rg/py8KsQ3uoTmu53I6U6K5ob8uPWWGb/Wh7+eUxmWB
	dzsOSQyNZuDEjg3jSmxv81lXTR3tu3LvbJqCHbxmhztp7EgwRmeqo2W9X9CyDCRZlT/lwPbNRqO
	7XIP1mLcRbg3ZycbC71PqYGJA0ZRwG4L4Vpci26PHiqJHGvL6NoOyo2a5KX2jCtJtqw==
X-Gm-Gg: ASbGnctrkfVLUHvdK+yHyzWrez3xSAL8zJP3s0rAsVo3BN2hsWvtNEjH8zPHyg+Q3Tr
	aRx9izM5eRzgwlxQJH57FiuzW99kVppoY/YsqLxIj/9Su99g+WxoCxhsTr4GLT4nBY1kyka23kK
	p3SoC0YGHQZKYZQOAJvMLvFdbkEMFk4kFwcJfXQ0Ul0y91RxS9XEXQFoFWE6r7y74hSsqu5zNh7
	Mt7AJ1e/h1i2UoJ5vjSxDfZGyux+KYS6o/VzqXla8pQ7J8jUGnXbD7coKtVVSOkZ6yOMA66977K
	5sIm9upO3LAoJPcUJnxspcRYsMczluGNOSTzUkolKV1SQSQKB/qxs0paESWWHoYGcZvn3g5pv+7
	3HH37BBUz3HimOcEzxNTQNqTZMF3vioIH5Y/1hLOUXShZo22p84XT9IGg7x5kmB1pJI8=
X-Received: by 2002:a05:620a:468d:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b305fc8faamr225332885a.9.1763477344154;
        Tue, 18 Nov 2025 06:49:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrPZegBrppYw6zjJa/UisDtrpFEDf1keGfRJkV3PvaMM+nTIEKz0NkaeDCDrjaQJwlHJwc4g==
X-Received: by 2002:a05:620a:468d:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b305fc8faamr225329485a.9.1763477343641;
        Tue, 18 Nov 2025 06:49:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed80f0sm1371812466b.66.2025.11.18.06.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:49:03 -0800 (PST)
Message-ID: <cf53c848-f65e-4956-a8c3-3768818ad50d@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:49:00 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-oneplus: Don't keep panel
 regulator always on
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
 <20251118-dts-oneplus-regulators-v1-2-79fb2f0f253b@ixit.cz>
 <4da03f13-1e45-472c-9435-95156389ba83@oss.qualcomm.com>
 <21c9a3eb-72d2-4fe2-a370-1824b811ced9@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <21c9a3eb-72d2-4fe2-a370-1824b811ced9@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c8761 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=qdQ_x7Z2-qOnOb6oBeYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: A34ZEvlzG14vhPm_kJsLqqtNyrIRnGnc
X-Proofpoint-ORIG-GUID: A34ZEvlzG14vhPm_kJsLqqtNyrIRnGnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX3CC052RcFhfL
 LhWp6hxivAuxX93KVPatvFNp1gpl67bXcZf7IYqero5Y1HP4hQbAjtZEonPSJ/rPn5jsM49XwWN
 laJewsx6uuYiAZUse66Nw1xK+bX4fR2dM0Ax52ZQLymWgPteBP6SkAAR6TLdmWRpRxltaR0qsiY
 j175D4oC4KmNc/1t4YvfDUcb4PW3Y0FFYBP6xHzVP0hvArJMu+XZzMMp8gUIU6dcU4RUcCsBMEj
 xycD8gf77yvXS4AHVlrCalnfkgQmL61ehMSD2m6d08kOpyIrOtZ0/qiyFhRwnTCn8OT/SjMtVmY
 4G+74245AHdGLf30kUaYWpu/4xUcw3nngbArdCSw+Sa3ShmffnV0O9AlP1fOcGgSIHn0QMLQVaF
 LyOIuGAEkCKeqc3EOScwSBc9i4WWJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119

On 11/18/25 3:44 PM, David Heidelberg wrote:
> On 18/11/2025 15:32, Konrad Dybcio wrote:
>> On 11/18/25 3:11 PM, David Heidelberg via B4 Relay wrote:
>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>
>>> The panel regulator doesn't need to be always on, so remove this
>>> property.
>>>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> Fixes?
> 
> I only know this works well at current next-202511xx, these patches we're also in sdm845-mainline downstream repo, but there was multiple different patches and hacks for panels and other stuff present, so it's hard for me verify that on clean mainline kernel these will work as expected (as older mainline versions also need the panel patched etc.)

Fixes != backports

Konrad

> 
> If you insist, I can append Fixes against when these properties we're or weren't introduced (talking about PATCH 3/3 too).
> 
>>
>> Konrad
> 
